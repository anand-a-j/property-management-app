-- 1. ORGANIZATIONS (id only; one per manager/client)
create table public.organizations (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now()
);

-- 2. PROFILES
create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  org_id uuid references public.organizations(id),   -- null only for platform_admin
  name text not null default '',
  email text not null,
  phone text,
  role text not null default 'resident'
    check (role in ('platform_admin','manager','resident','security','maintenance')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  deleted_at timestamptz
);

create unique index profiles_email_unique
  on public.profiles (lower(email)) where deleted_at is null;
create index profiles_role_idx on public.profiles (role);
create index profiles_org_idx on public.profiles (org_id);

-- 3. HELPERS (security definer avoids RLS recursion)
create or replace function public.my_role()
returns text language sql stable security definer set search_path = public as $$
  select role from public.profiles where id = auth.uid() and deleted_at is null
$$;

create or replace function public.my_org_id()
returns uuid language sql stable security definer set search_path = public as $$
  select org_id from public.profiles where id = auth.uid() and deleted_at is null
$$;

revoke execute on function public.my_role(), public.my_org_id() from public, anon;
grant execute on function public.my_role(), public.my_org_id() to authenticated;

-- 4. RLS: organizations (writes only from the trigger / service role)
alter table public.organizations enable row level security;

create policy "org_select" on public.organizations
  for select to authenticated
  using (id = public.my_org_id() or public.my_role() = 'platform_admin');

-- 5. RLS: profiles
alter table public.profiles enable row level security;

create policy "profiles_select_own" on public.profiles
  for select to authenticated using (id = auth.uid());

create policy "profiles_select_org_manager" on public.profiles
  for select to authenticated
  using (public.my_role() = 'manager' and org_id = public.my_org_id());

create policy "profiles_select_admin" on public.profiles
  for select to authenticated using (public.my_role() = 'platform_admin');

create policy "profiles_update_own" on public.profiles
  for update to authenticated
  using (id = auth.uid()) with check (id = auth.uid());

-- Clients can only edit name and phone, never role/org_id/email
revoke update on public.profiles from anon, authenticated;
grant update (name, phone) on public.profiles to authenticated;

-- 6. updated_at
create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin new.updated_at = now(); return new; end $$;

create trigger profiles_set_updated_at
  before update on public.profiles
  for each row execute function public.set_updated_at();

-- 7. AUTO PROFILE (+ auto org for managers)
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
declare
  meta_role  text := lower(coalesce(new.raw_app_meta_data ->> 'role', ''));
  final_role text;
  final_org  uuid;
begin
  final_role := case
    when meta_role in ('manager','resident','security','maintenance') then meta_role
    else 'resident' end;

  if final_role = 'manager' then
    -- new manager = new client = new org
    insert into public.organizations default values returning id into final_org;
  else
    begin
      final_org := (new.raw_app_meta_data ->> 'org_id')::uuid;
    exception when others then
      final_org := null;
    end;
  end if;

  insert into public.profiles (id, org_id, name, email, phone, role)
  values (
    new.id,
    final_org,
    coalesce(new.raw_user_meta_data ->> 'name', ''),
    new.email,
    nullif(new.raw_user_meta_data ->> 'phone', ''),
    final_role
  );
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();