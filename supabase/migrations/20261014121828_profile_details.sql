create table public.profile_details (
  profile_id uuid primary key
    references public.profiles(id) on delete cascade,

  first_name text not null default '',
  last_name text not null default '',
  nickname text,
  emirates_id text,

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create unique index profile_details_emirates_id_unique
  on public.profile_details (emirates_id)
  where emirates_id is not null
    and btrim(emirates_id) <> '';

create trigger profile_details_set_updated_at
before update on public.profile_details
for each row
execute function public.set_updated_at();

-- Enable access for authenticated and anonymous clients.
alter table public.profile_details disable row level security;

grant all privileges on table public.profile_details
to anon, authenticated, service_role;