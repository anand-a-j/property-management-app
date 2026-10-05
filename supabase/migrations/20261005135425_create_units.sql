-- UNIT
create table public.units (
  id uuid primary key default gen_random_uuid(),

  community_id uuid not null
    references public.communities(id)
    on delete cascade,

  name text not null,
  area text not null,
  description text not null,

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  deleted_at timestamptz
);

-- Community lookup: all units of a community
create index idx_units_community_id
  on public.units(community_id);

-- Active units only (soft delete)
create index idx_units_active
  on public.units(community_id)
  where deleted_at is null;

-- updated_at
create trigger units_set_updated_at
  before update on public.units
  for each row execute function public.set_updated_at();