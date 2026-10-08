-- =========================================================
-- LEASES & PAYMENTS - DATA API PERMISSIONS
-- =========================================================

-- LEASES
grant select, insert, update, delete
on table public.leases
to authenticated;


-- PAYMENTS
grant select, insert, update, delete
on table public.payments
to authenticated;