
create or replace view public.resident_list_view
with (security_invoker = true)
as
select
    p.org_id,
    p.name as resident_name,

    -- Main profile information
    jsonb_build_object(
        'id', p.id,
        'org_id', p.org_id,
        'name', p.name,
        'email', p.email,
        'phone', p.phone,
        'role', p.role,
        'created_at', p.created_at,
        'updated_at', p.updated_at,
        'deleted_at', p.deleted_at
    ) as profile,

    -- Personal details
    jsonb_build_object(
        'first_name', coalesce(pd.first_name, ''),
        'last_name', coalesce(pd.last_name, ''),
        'nickname', pd.nickname,
        'emirates_id', pd.emirates_id,
        'created_at', pd.created_at,
        'updated_at', pd.updated_at
    ) as profile_details,

    -- Resident status
    case
        when current_lease.id is not null
            then 'current'

        when exists (
            select 1
            from public.leases l
            where l.resident_id = p.id
              and l.deleted_at is null
              and (
                  l.status in ('expired', 'terminated')
                  or (
                      l.status = 'active'
                      and l.end_date < current_date
                  )
              )
        )
            then 'exited'

        else 'onboarding'
    end as resident_status,

    -- Current unit
    current_lease.unit_id as current_unit_id,
    current_lease.unit_name as current_unit_name,

    -- Current community
    current_lease.community_id as community_id,
    current_lease.community_name as community_name

from public.profiles p

-- Personal details may not exist for every profile
left join public.profile_details pd
    on pd.profile_id = p.id

-- Find the current valid lease
left join lateral (
    select
        l.id,
        u.id as unit_id,
        u.name as unit_name,
        c.id as community_id,
        c.name as community_name

    from public.leases l

    join public.units u
        on u.id = l.unit_id
       and u.deleted_at is null

    join public.communities c
        on c.id = u.community_id
       and c.deleted_at is null

    where l.resident_id = p.id
      and l.deleted_at is null
      and l.status = 'active'
      and current_date between l.start_date and l.end_date

    order by
        l.start_date desc,
        l.created_at desc

    limit 1
) current_lease on true

where p.role = 'resident'
  and p.deleted_at is null;
