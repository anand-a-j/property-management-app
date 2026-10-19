create or replace view public.security_lease_movements_view
with (security_invoker = true)
as
select
    -- Organization
    c.org_id,

    -- Movement request
    lm.id as movement_id,
    lm.lease_id,
    lm.movement_type,
    lm.status,
    lm.requested_by,
    lm.requested_at,

    -- Manager review
    lm.manager_reviewed_by,
    lm.manager_reviewed_at,
    lm.manager_rejection_reason,

    -- Security review
    lm.security_reviewed_by,
    lm.security_reviewed_at,
    lm.security_rejection_reason,

    -- Completion and audit
    lm.completed_at,
    lm.created_at,
    lm.updated_at,

    -- Lease details
    l.lease_number,
    l.start_date,
    l.end_date,
    l.status as lease_status,

    -- Unit details
    u.id as unit_id,
    u.name as unit_name,

    -- Resident details
    resident.id as resident_id,
    resident.name as resident_name,

    -- Requester details
    requester.name as requested_by_name

from public.lease_movements lm

join public.leases l
    on l.id = lm.lease_id

join public.units u
    on u.id = l.unit_id

join public.communities c
    on c.id = u.community_id

join public.profiles resident
    on resident.id = l.resident_id

join public.profiles requester
    on requester.id = lm.requested_by;