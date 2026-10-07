-- =========================================================
-- LEASES
-- =========================================================

create table public.leases (
  id uuid primary key default gen_random_uuid(),

  -- User-friendly lease reference
  lease_number text not null unique,

  -- Relationships
  unit_id uuid not null
    references public.units(id)
    on delete restrict,

  resident_id uuid not null
    references public.profiles(id)
    on delete restrict,

  -- Lease period
  start_date date not null,
  end_date date not null,

  -- Financial terms
  annual_rent numeric(12,2) not null,
  security_deposit numeric(12,2) not null default 0,

  -- Payment schedule
  payment_frequency text not null
    check (
      payment_frequency in (
        'monthly',
        'quarterly',
        'semi_annual',
        'annual'
      )
    ),

  number_of_cheques integer not null default 1
    check (number_of_cheques > 0),

  -- Lease status
  status text not null default 'draft'
    check (
      status in (
        'draft',
        'active',
        'expired',
        'terminated',
        'cancelled'
      )
    ),

  -- Optional notes
  description text,

  -- Audit fields
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  deleted_at timestamptz,

  constraint leases_valid_date_range
    check (end_date >= start_date),

  constraint leases_valid_rent
    check (annual_rent >= 0),

  constraint leases_valid_security_deposit
    check (security_deposit >= 0)
);

create index idx_leases_unit_id
  on public.leases(unit_id);

create index idx_leases_resident_id
  on public.leases(resident_id);

create index idx_leases_status
  on public.leases(status);

create index idx_leases_active
  on public.leases(unit_id)
  where status = 'active'
    and deleted_at is null;

create unique index idx_one_active_lease_per_unit
  on public.leases(unit_id)
  where status = 'active'
    and deleted_at is null;

create trigger leases_set_updated_at
  before update on public.leases
  for each row
  execute function public.set_updated_at();