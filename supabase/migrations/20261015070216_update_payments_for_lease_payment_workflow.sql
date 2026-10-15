-- 1. Add payment workflow fields
alter table public.payments
  add column if not exists cheque_submitted_at timestamptz,
  add column if not exists bounce_reason text;

-- 2. Set default status for new payments
alter table public.payments
  alter column status set default 'draft';

-- 6. Active payment lookup
drop index if exists public.idx_payments_active;

create index idx_payments_active
  on public.payments(lease_id)
  where deleted_at is null;