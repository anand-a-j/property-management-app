-- 1. Remove the existing status constraint.
ALTER TABLE public.visitor
    DROP CONSTRAINT IF EXISTS visitor_status_check;

-- 2. Migrate existing statuses.
UPDATE public.visitor
SET status = CASE
    WHEN status = 'approved' THEN 'pending'
    WHEN status = 'rejected' THEN 'cancelled'
    ELSE status
END
WHERE status IN ('approved', 'rejected');

-- 3. Set the default status for new visitors.
-- Resident-created visitors should remain pending.
ALTER TABLE public.visitor
    ALTER COLUMN status SET DEFAULT 'pending';

-- 4. Add the updated status constraint.
ALTER TABLE public.visitor
    ADD CONSTRAINT visitor_status_check
    CHECK (
        status IN (
            'pending',
            'checked_in',
            'checked_out',
            'cancelled'
        )
    );