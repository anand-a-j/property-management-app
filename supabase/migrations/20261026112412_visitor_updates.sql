-- 1. Replace the single visit timestamp with a time range.
ALTER TABLE public.visitor
    RENAME COLUMN visit_at TO visit_start_at;

-- 2. Add visitor workflow fields and resident/lease relationships.
ALTER TABLE public.visitor
    ADD COLUMN visit_end_at TIMESTAMPTZ,
    ADD COLUMN parking_required BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN resident_id UUID
        REFERENCES public.residents(id) ON DELETE RESTRICT,
    ADD COLUMN lease_id UUID
        REFERENCES public.leases(id) ON DELETE RESTRICT,
    ADD COLUMN approved_by UUID
        REFERENCES public.profiles(id) ON DELETE SET NULL,
    ADD COLUMN checked_in_at TIMESTAMPTZ,
    ADD COLUMN checked_out_at TIMESTAMPTZ;

-- 3. Backfill existing records with a temporary end time.
UPDATE public.visitor
SET visit_end_at = visit_start_at
WHERE visit_end_at IS NULL;

-- 4. Require an end time for all visitor records.
ALTER TABLE public.visitor
    ALTER COLUMN visit_end_at SET NOT NULL;

-- 5. Validate the visit time range.
ALTER TABLE public.visitor
    ADD CONSTRAINT visitor_valid_time_range
    CHECK (visit_end_at >= visit_start_at);

-- 6. Indexes for visitor listing and resident/lease filtering.
CREATE INDEX idx_visitor_org_start
    ON public.visitor (org_id, visit_start_at);

CREATE INDEX idx_visitor_resident
    ON public.visitor (resident_id, visit_start_at DESC);

CREATE INDEX idx_visitor_lease
    ON public.visitor (lease_id);