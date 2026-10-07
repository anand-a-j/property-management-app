-- =========================================================
-- PAYMENTS
-- =========================================================

create table public.payments (
  id uuid primary key default gen_random_uuid(),

  -- User-friendly payment reference
  payment_number text not null unique,

  -- Payment belongs to a lease
  lease_id uuid not null
    references public.leases(id)
    on delete restrict,

  -- Payment information
  due_date date not null,
  amount numeric(12,2) not null,

  payment_type text not null
    check (
      payment_type in (
        'cash',
        'bank_transfer',
        'cheque',
        'card',
        'other'
      )
    ),

  status text not null default 'pending'
    check (
      status in (
        'pending',
        'paid',
        'overdue',
        'cancelled'
      )
    ),

  paid_date date,

  -- Cheque information
  cheque_number text,

  -- Optional description
  description text,

  -- Supabase Storage path
  cheque_copy_path text,

  -- Audit fields
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  deleted_at timestamptz,

  constraint payments_valid_amount
    check (amount > 0)
);

-- Lease → payment history
create index idx_payments_lease_id
  on public.payments(lease_id);

create index idx_payments_status
  on public.payments(status);

create index idx_payments_due_date
  on public.payments(due_date);

create index idx_payments_active
  on public.payments(lease_id)
  where deleted_at is null;

create trigger payments_set_updated_at
  before update on public.payments
  for each row
  execute function public.set_updated_at();