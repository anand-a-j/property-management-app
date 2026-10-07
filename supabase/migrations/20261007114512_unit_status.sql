alter table public.units
  add column status text not null default 'unassigned'
  check (
    status in (
      'unassigned',
      'occupied',
      'vacant',
      'maintenance'
    )
  );