CREATE OR REPLACE VIEW public.unit_list_view
WITH (security_invoker = true)
AS
SELECT
    u.id,
    u.community_id,
    u.name,
    u.area,
    u.description,
    u.status,
    u.unit_type,
    u.created_at,
    u.updated_at,
    u.deleted_at,
    l.id AS lease_id,
    p.name AS resident_name
FROM public.units u
LEFT JOIN public.leases l
    ON l.unit_id = u.id
    AND l.status = 'active'
    AND l.deleted_at IS NULL
LEFT JOIN public.profiles p
    ON p.id = l.resident_id
    AND p.deleted_at IS NULL
WHERE u.deleted_at IS NULL;