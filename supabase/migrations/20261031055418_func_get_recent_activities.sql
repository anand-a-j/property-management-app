
CREATE OR REPLACE FUNCTION public.get_recent_activities(
    p_limit integer DEFAULT 30
)
RETURNS TABLE (
    activity_type text,
    title text,
    description text,
    activity_at timestamptz,
    due_date date,
    reference_id uuid,
    unit_name text,
    community_name text,
    status text
)
LANGUAGE sql
STABLE
SECURITY INVOKER
SET search_path = ''
AS $function$

WITH activities AS (

    -- 1. Overdue and upcoming rent payments
    SELECT
        CASE
            WHEN p.due_date < CURRENT_DATE
                THEN 'payment_overdue'
            ELSE 'payment_due'
        END AS activity_type,

        CASE
            WHEN p.due_date < CURRENT_DATE
                THEN 'Rent payment overdue'
            ELSE 'Rent payment due soon'
        END AS title,

        'Payment ' || p.payment_number
            || ' · ' || p.amount::text AS description,

        p.due_date::timestamptz AS activity_at,
        p.due_date,
        p.id AS reference_id,
        u.name AS unit_name,
        c.name AS community_name,
        p.status

    FROM public.payments p
    JOIN public.leases l ON l.id = p.lease_id
    JOIN public.units u ON u.id = l.unit_id
    JOIN public.communities c ON c.id = u.community_id

    WHERE c.org_id = public.my_org_id()
      AND c.deleted_at IS NULL
      AND u.deleted_at IS NULL
      AND l.deleted_at IS NULL
      AND p.deleted_at IS NULL
      AND p.status IN ('pending', 'overdue')
      AND p.due_date <= CURRENT_DATE + 30

    UNION ALL

    -- 2. Maintenance requests awaiting manager review
    SELECT
        'maintenance_pending',
        'Maintenance request awaiting review',
        m.issue_title,
        m.created_at,
        NULL::date,
        m.id,
        u.name,
        c.name,
        m.status

    FROM public.maintenance_requests m
    JOIN public.units u ON u.id = m.unit_id
    JOIN public.communities c ON c.id = u.community_id

    WHERE m.org_id = public.my_org_id()
      AND c.deleted_at IS NULL
      AND u.deleted_at IS NULL
      AND m.status = 'pending_review'

    UNION ALL

    -- 3. Recent maintenance updates
    SELECT
        'maintenance_update',
        'Maintenance status updated',
        m.issue_title || ' · ' || mu.status
            || ' · ' || mu.note,
        mu.created_at,
        NULL::date,
        m.id,
        u.name,
        c.name,
        mu.status

    FROM public.maintenance_updates mu
    JOIN public.maintenance_requests m
        ON m.id = mu.maintenance_request_id
    JOIN public.units u ON u.id = m.unit_id
    JOIN public.communities c ON c.id = u.community_id

    WHERE m.org_id = public.my_org_id()
      AND c.deleted_at IS NULL
      AND u.deleted_at IS NULL
      AND mu.created_at >= now() - interval '7 days'

    UNION ALL

    -- 4. Visitor requests awaiting approval
    SELECT
        'visitor_pending',
        'Visitor awaiting approval',
        v.name || ' · ' || v.visit_type,
        v.created_at,
        v.visit_start_at::date,
        v.id,
        COALESCE(u.name, 'No unit'),
        c.name,
        v.status

    FROM public.visitor v
    LEFT JOIN public.units u ON u.id = v.unit_id
    LEFT JOIN public.communities c ON c.id = u.community_id

    WHERE v.org_id = public.my_org_id()
      AND v.status = 'pending'
      AND v.visit_start_at >= now() - interval '1 day'
      AND v.visit_start_at <= now() + interval '30 days'

    UNION ALL

    -- 5. Lease expiring within 30 days
    SELECT
        'lease_expiring',
        'Lease expiring soon',
        'Lease ' || l.lease_number
            || ' expires on ' || l.end_date::text,
        l.end_date::timestamptz,
        l.end_date,
        l.id,
        u.name,
        c.name,
        l.status

    FROM public.leases l
    JOIN public.units u ON u.id = l.unit_id
    JOIN public.communities c ON c.id = u.community_id

    WHERE c.org_id = public.my_org_id()
      AND c.deleted_at IS NULL
      AND u.deleted_at IS NULL
      AND l.deleted_at IS NULL
      AND l.status = 'active'
      AND l.end_date >= CURRENT_DATE
      AND l.end_date <= CURRENT_DATE + 30

    UNION ALL

    -- 6. Lease cheque reminders
    SELECT
        'lease_cheque_reminder',
        'Lease cheque due soon',

        'Lease ' || l.lease_number
            || ' · Cheque ' || installment.cheque_no
            || ' of ' || l.number_of_cheques
            || ' · ' || ROUND(
                l.annual_rent / l.number_of_cheques,
                2
            )::text,

        installment.due_date::timestamptz
            - interval '30 days',

        installment.due_date,
        l.id,
        u.name,
        c.name,
        'upcoming'

    FROM public.leases l
    JOIN public.units u ON u.id = l.unit_id
    JOIN public.communities c ON c.id = u.community_id

    CROSS JOIN LATERAL generate_series(
        0,
        l.number_of_cheques - 1
    ) AS installment_index(n)

    CROSS JOIN LATERAL (
        SELECT
            installment_index.n + 1 AS cheque_no,

            (
                l.start_date
                + (
                    installment_index.n
                    * CASE l.payment_frequency
                        WHEN 'monthly' THEN 1
                        WHEN 'quarterly' THEN 3
                        WHEN 'semi_annual' THEN 6
                        WHEN 'annual' THEN 12
                    END
                ) * interval '1 month'
            )::date AS due_date
    ) installment

    WHERE c.org_id = public.my_org_id()
      AND c.deleted_at IS NULL
      AND u.deleted_at IS NULL
      AND l.deleted_at IS NULL
      AND l.status = 'active'
      AND l.payment_frequency IN (
          'monthly',
          'quarterly',
          'semi_annual',
          'annual'
      )
      AND installment.due_date >= CURRENT_DATE
      AND installment.due_date <= CURRENT_DATE + 30

      -- Exclude installments already recorded as paid
      AND NOT EXISTS (
          SELECT 1
          FROM public.payments p
          WHERE p.lease_id = l.id
            AND p.due_date = installment.due_date
            AND p.status = 'paid'
            AND p.deleted_at IS NULL
      )
)

SELECT
    a.activity_type,
    a.title,
    a.description,
    a.activity_at,
    a.due_date,
    a.reference_id,
    a.unit_name,
    a.community_name,
    a.status

FROM activities a

ORDER BY
    a.activity_at ASC NULLS LAST

LIMIT LEAST(
    GREATEST(COALESCE(p_limit, 30), 1),
    100
);

$function$;
