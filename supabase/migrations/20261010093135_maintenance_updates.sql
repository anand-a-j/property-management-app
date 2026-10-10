create table public.maintenance_updates (
    id uuid primary key default gen_random_uuid(),

    maintenance_request_id uuid not null
        references public.maintenance_requests(id)
        on delete restrict,

    updated_by uuid not null
        references public.profiles(id)
        on delete restrict,

    status text not null
        check (status in (
            'assigned',
            'in_progress',
            'completed'
        )),

    note text not null,

    created_at timestamptz not null default now(),

    constraint maintenance_update_note_not_empty
        check (length(trim(note)) > 0)
);

grant select, insert, update, delete
on table public.maintenance_updates
to authenticated;