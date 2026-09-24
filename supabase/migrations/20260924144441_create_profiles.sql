-- ENUM
create type public.user_role as enum (
  'platform_admin',
  'manager',
  'resident',
  'security',
  'maintenance'
);

-- TABLE
create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,

  name text not null,
  email text not null,
  phone text,

  role public.user_role not null default 'resident',

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  deleted_at timestamptz
);

-- INDEXES
create unique index profiles_email_unique
on public.profiles (lower(email))
where deleted_at is null;

create index profiles_role_idx
on public.profiles (role);

-- RLS
alter table public.profiles enable row level security;

create policy "Users can view own profile"
on public.profiles
for select
to authenticated
using (id = auth.uid());

create policy "Users can update own profile"
on public.profiles
for update
to authenticated
using (id = auth.uid())
with check (id = auth.uid());

-- AUTO PROFILE
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.profiles (
    id,
    name,
    email,
    phone,
    role
  )
  values (
    new.id,
    coalesce(new.raw_user_meta_data ->> 'name', ''),
    new.email,
    new.raw_user_meta_data ->> 'phone',
    'resident'
  );

  return new;
end;
$$;

create trigger on_auth_user_created
after insert on auth.users
for each row
execute procedure public.handle_new_user();