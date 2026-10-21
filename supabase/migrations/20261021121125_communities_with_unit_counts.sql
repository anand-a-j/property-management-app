create or replace view public.communities_with_unit_counts
with (security_invoker = true)
as
select
    c.id,
    c.org_id,
    c.development_type,
    c.community_type,
    c.name,
    c.address,
    c.description,
    c.created_at,
    c.updated_at,

    count(u.id)::integer as total_units,

    count(u.id) filter (
        where u.status = 'occupied'
    )::integer as occupied_units,

    count(u.id) filter (
        where u.status = 'vacant'
    )::integer as vacant_units

from public.communities c

left join public.units u
    on u.community_id = c.id
    and u.deleted_at is null

where c.deleted_at is null

group by c.id;