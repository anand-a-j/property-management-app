-- Main maintenance ticket table
create table public.maintenance_requests (
    id uuid primary key default gen_random_uuid(),

    org_id uuid not null
        references public.organizations(id)
        on delete restrict,

    unit_id uuid not null
        references public.units(id)
        on delete restrict,

    ticket_number text not null unique,

    created_by uuid not null
        references public.profiles(id)
        on delete restrict,

    resident_id uuid
        references public.profiles(id)
        on delete set null,

    issue_title text not null,
    issue_type text not null,
    description text not null,

    priority text not null default 'medium'
        check (priority in ('low', 'medium', 'high', 'important')),

    status text not null default 'pending_review'
        check (status in (
            'pending_review',
            'rejected',
            'approved',
            'assigned',
            'in_progress',
            'completed',
            'closed',
            'cancelled'
        )),

    assigned_to uuid
        references public.profiles(id)
        on delete restrict,

    reviewed_by uuid
        references public.profiles(id)
        on delete restrict,

    reviewed_at timestamptz,
    rejection_reason text,

    approved_at timestamptz,

    completed_at timestamptz,
    closed_at timestamptz,

    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),

    constraint maintenance_issue_title_not_empty
        check (length(trim(issue_title)) > 0),

    constraint maintenance_description_not_empty
        check (length(trim(description)) > 0),

    constraint maintenance_rejection_reason_required
        check (
            status <> 'rejected'
            or nullif(trim(rejection_reason), '') is not null
        ),

    constraint maintenance_assignee_required
        check (
            status not in ('assigned', 'in_progress')
            or assigned_to is not null
        )
);

grant select, insert, update, delete
on table public.maintenance_requests
to authenticated;
