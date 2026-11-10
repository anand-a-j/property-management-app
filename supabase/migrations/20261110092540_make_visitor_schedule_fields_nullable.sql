-- Make visitor schedule and parking fields optional.

ALTER TABLE public.visitor
    ALTER COLUMN visit_start_at DROP NOT NULL,
    ALTER COLUMN visit_end_at DROP NOT NULL,
    ALTER COLUMN parking_required DROP NOT NULL;

-- Remove the default so omitted values remain NULL.
ALTER TABLE public.visitor
    ALTER COLUMN parking_required DROP DEFAULT;

-- Update time range constraint to allow missing dates.
ALTER TABLE public.visitor
    DROP CONSTRAINT IF EXISTS visitor_valid_time_range;

ALTER TABLE public.visitor
    ADD CONSTRAINT visitor_valid_time_range
    CHECK (
        visit_start_at IS NULL
        OR visit_end_at IS NULL
        OR visit_end_at >= visit_start_at
    );