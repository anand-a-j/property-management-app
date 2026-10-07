alter table public.leases
  add column org_id uuid;

alter table public.leases
  add constraint leases_org_id_fkey
  foreign key (org_id)
  references public.organizations(id)
  on delete restrict;

create index idx_leases_org_id
  on public.leases(org_id);