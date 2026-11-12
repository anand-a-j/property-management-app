
CREATE OR REPLACE VIEW public.communities_with_unit_counts
WITH (security_invoker = true)
AS
SELECT
    c.id,
    c.org_id,
    c.development_type,
    c.community_type,
    c.name,
    c.address,
    c.description,
    c.created_at,
    c.updated_at,

    COUNT(u.id)::integer AS total_units,

    COUNT(u.id) FILTER (
        WHERE u.status = 'occupied'
    )::integer AS occupied_units,

    COUNT(u.id) FILTER (
        WHERE u.status = 'vacant'
    )::integer AS vacant_units,

    COUNT(u.id) FILTER (
        WHERE u.status = 'maintenance'
    )::integer AS maintenance_units,

    COUNT(u.id) FILTER (
        WHERE u.status = 'unassigned'
    )::integer AS unassigned_units

FROM public.communities c

LEFT JOIN public.unit_list_view u
    ON u.community_id = c.id

WHERE c.deleted_at IS NULL

GROUP BY c.id;
