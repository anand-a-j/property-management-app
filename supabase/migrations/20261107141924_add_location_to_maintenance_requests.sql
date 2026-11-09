
-- Add location details to maintenance requests
-- All columns are nullable to support existing records.

alter table public.maintenance_requests
    add column unit_name text,
    add column community_id uuid
        references public.communities(id)
        on delete restrict,
    add column community_name text;

-- Index for filtering maintenance requests by community
create index idx_maintenance_requests_community_id
    on public.maintenance_requests(community_id);

