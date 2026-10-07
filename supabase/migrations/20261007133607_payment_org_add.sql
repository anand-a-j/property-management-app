-- =========================================================
-- MIGRATION: ADD ORG_ID TO PAYMENTS
-- =========================================================

-- 1. Add organization column
alter table public.payments
  add column org_id uuid;

-- 2. Add foreign key
alter table public.payments
  add constraint payments_org_id_fkey
  foreign key (org_id)
  references public.organizations(id)
  on delete restrict;

-- 3. Add organization index
create index idx_payments_org_id
  on public.payments(org_id);

-- 4. Remove the old globally unique constraint
alter table public.payments
  drop constraint if exists payments_payment_number_key;

-- 5. Payment number should be unique per organization
alter table public.payments
  add constraint payments_payment_number_unique
  unique (org_id, payment_number);

-- 6. Organization + lease lookup
create index idx_payments_org_lease
  on public.payments(org_id, lease_id);

-- 7. Update active payment index
drop index if exists idx_payments_active;

create index idx_payments_active
  on public.payments(org_id, lease_id)
  where deleted_at is null;