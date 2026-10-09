
create table public.lease_movements (
  id uuid primary key default gen_random_uuid(),

  lease_id uuid not null
    references public.leases(id)
    on delete restrict,

  movement_type text not null
    check (movement_type in ('move_in', 'move_out')),

  status text not null default 'pending_manager'
    check (
      status in (
        'pending_manager',
        'manager_rejected',
        'pending_security',
        'security_rejected',
        'completed',
        'cancelled'
      )
    ),

  -- Request details
  requested_by uuid not null
    references public.profiles(id)
    on delete restrict,

  requested_at timestamptz not null default now(),

  -- Property Manager decision
  manager_reviewed_by uuid
    references public.profiles(id)
    on delete restrict,

  manager_reviewed_at timestamptz,
  manager_rejection_reason text,

  -- Security decision
  security_reviewed_by uuid
    references public.profiles(id)
    on delete restrict,

  security_reviewed_at timestamptz,
  security_rejection_reason text,

  -- Completion
  completed_at timestamptz,

  -- Audit
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),

  constraint lease_movements_manager_rejection_reason
    check (
      status <> 'manager_rejected'
      or manager_rejection_reason is not null
    ),

  constraint lease_movements_security_rejection_reason
    check (
      status <> 'security_rejected'
      or security_rejection_reason is not null
    )
);

create index idx_lease_movements_lease_id
  on public.lease_movements(lease_id);

create index idx_lease_movements_status
  on public.lease_movements(status);

grant select, insert, update, delete
on table public.lease_movements
to authenticated;

