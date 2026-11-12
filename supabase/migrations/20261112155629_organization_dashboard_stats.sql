
CREATE OR REPLACE VIEW public.organization_dashboard_stats
WITH (security_invoker = true)
AS

WITH organizations AS (
    SELECT DISTINCT c.org_id
    FROM public.communities c
    WHERE c.deleted_at IS NULL
),

unit_stats AS (
    SELECT
        c.org_id,

        COUNT(DISTINCT u.id)::integer AS total_units,

        COUNT(DISTINCT u.id) FILTER (
            WHERE u.status = 'occupied'
        )::integer AS occupied_units,

        COUNT(DISTINCT u.id) FILTER (
            WHERE u.status = 'vacant'
        )::integer AS vacant_units,

        COUNT(DISTINCT u.id) FILTER (
            WHERE u.status = 'maintenance'
        )::integer AS maintenance_units,

        COUNT(DISTINCT u.id) FILTER (
            WHERE u.status = 'unassigned'
        )::integer AS unassigned_units

    FROM public.communities c

    LEFT JOIN public.unit_list_view u
        ON u.community_id = c.id

    WHERE c.deleted_at IS NULL

    GROUP BY c.org_id
),

maintenance_stats AS (
    SELECT
        mr.org_id,
        COUNT(DISTINCT mr.id)::integer AS active_maintenance_requests

    FROM public.maintenance_requests mr

    WHERE mr.status IN (
        'pending_review',
        'approved',
        'assigned',
        'in_progress'
    )

    GROUP BY mr.org_id
),

payment_stats AS (
    SELECT
        c.org_id,

        COALESCE(
            SUM(p.amount) FILTER (
                WHERE p.status = 'paid'
            ), 0
        ) AS rent_collected,

        COUNT(p.id) FILTER (
            WHERE p.status = 'overdue'
        )::integer AS overdue_count,

        COALESCE(
            SUM(p.amount) FILTER (
                WHERE p.status IN ('pending', 'overdue')
            ), 0
        ) AS rent_due_total

    FROM public.payments p

    INNER JOIN public.leases l
        ON l.id = p.lease_id
        AND l.deleted_at IS NULL

    INNER JOIN public.units u
        ON u.id = l.unit_id
        AND u.deleted_at IS NULL

    INNER JOIN public.communities c
        ON c.id = u.community_id
        AND c.deleted_at IS NULL

    WHERE p.deleted_at IS NULL

    GROUP BY c.org_id
)

SELECT
    o.org_id,

    COALESCE(us.total_units, 0)::integer AS total_units,
    COALESCE(us.occupied_units, 0)::integer AS occupied_units,
    COALESCE(us.vacant_units, 0)::integer AS vacant_units,
    COALESCE(us.maintenance_units, 0)::integer AS maintenance_units,
    COALESCE(us.unassigned_units, 0)::integer AS unassigned_units,

    COALESCE(ms.active_maintenance_requests, 0)::integer
        AS active_maintenance_requests,

    COALESCE(ps.rent_collected, 0) AS rent_collected,
    COALESCE(ps.overdue_count, 0)::integer AS overdue_count,
    COALESCE(ps.rent_due_total, 0) AS rent_due_total

FROM organizations o

LEFT JOIN unit_stats us
    ON us.org_id = o.org_id

LEFT JOIN maintenance_stats ms
    ON ms.org_id = o.org_id

LEFT JOIN payment_stats ps
    ON ps.org_id = o.org_id;
