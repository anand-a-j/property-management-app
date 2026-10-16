create or replace view public.resident_lease_details
with (security_invoker = true)
as
select
    -- Lease
    l.id as lease_id,
    l.lease_number,
    l.resident_id,
    l.status as lease_status,
    l.start_date,
    l.end_date,
    l.annual_rent,
    l.security_deposit,
    l.payment_frequency,
    l.number_of_cheques,
    l.description as lease_description,

    -- Unit
    u.id as unit_id,
    u.name as unit_name,

    -- Community
    c.id as community_id,
    c.name as community_name

from public.leases l
inner join public.units u
    on u.id = l.unit_id
inner join public.communities c
    on c.id = u.community_id

where
    l.deleted_at is null
    and u.deleted_at is null
    and c.deleted_at is null;