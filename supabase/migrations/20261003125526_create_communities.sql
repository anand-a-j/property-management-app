
-- COMMUNITY
create table public.communities (
  id uuid primary key default gen_random_uuid(),

  org_id uuid not null default public.my_org_id()
    references public.organizations(id),

  development_type text not null,
  community_type text not null,

  name text not null,
  address text not null,
  description text not null,

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  deleted_at timestamptz
);

-- Tenant lookup: all communities of an org
create index idx_communities_org_id
  on public.communities(org_id);

-- Active communities only (soft delete)
create index idx_communities_active
  on public.communities(org_id) where deleted_at is null;

-- updated_at
create trigger communities_set_updated_at
  before update on public.communities
  for each row execute function public.set_updated_at();

-- RLS
alter table public.communities enable row level security;

create policy "communities_manager_all" on public.communities
  for all to authenticated
  using (public.my_role() = 'manager' and org_id = public.my_org_id())
  with check (public.my_role() = 'manager' and org_id = public.my_org_id());

create policy "communities_org_read" on public.communities
  for select to authenticated
  using (org_id = public.my_org_id());






