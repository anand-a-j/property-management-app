CREATE TABLE public.visitor (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    org_id UUID NOT NULL
        REFERENCES public.organizations(id)
        ON DELETE RESTRICT,

    -- Visitor details
    name TEXT NOT NULL,
    phone TEXT,

    -- Visit schedule
    visit_at TIMESTAMPTZ NOT NULL,

    -- Visit classification
    visit_type TEXT NOT NULL,
    purpose TEXT,

    -- Optional unit association
    unit_id UUID
        REFERENCES public.units(id)
        ON DELETE SET NULL,

    -- Visitor workflow status
    status TEXT NOT NULL DEFAULT 'pending'
        CHECK (
            status IN (
                'pending',
                'approved',
                'rejected',
                'checked_in',
                'checked_out',
                'cancelled'
            )
        ),

    -- User who created the record
    created_by UUID NOT NULL
        REFERENCES public.profiles(id)
        ON DELETE RESTRICT,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    -- Validation
    CONSTRAINT visitor_name_not_empty
        CHECK (LENGTH(TRIM(name)) > 0),

    CONSTRAINT visitor_type_not_empty
        CHECK (LENGTH(TRIM(visit_type)) > 0)
);

-- Index for listing visitors by organization and visit date
CREATE INDEX idx_visitor_org_visit_at
    ON public.visitor (org_id, visit_at);

-- Index for filtering by unit
CREATE INDEX idx_visitor_unit_id
    ON public.visitor (unit_id);

-- Index for filtering by status
CREATE INDEX idx_visitor_org_status
    ON public.visitor (org_id, status);

grant select, insert, update, delete
on table public.visitor
to authenticated;