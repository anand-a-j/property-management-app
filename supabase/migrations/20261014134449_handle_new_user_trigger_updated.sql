create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  meta_role  text := lower(coalesce(new.raw_app_meta_data ->> 'role', ''));
  final_role text;
  final_org  uuid;

  first_name text;
  last_name  text;
  nickname   text;
  emirates_id text;
  full_name  text;
begin
  -- 1. Resolve role
  final_role := case
    when meta_role in ('manager', 'resident', 'security', 'maintenance')
      then meta_role
    else 'resident'
  end;

  -- 2. Resolve organization
  if final_role = 'manager' then
    insert into public.organizations default values
    returning id into final_org;
  else
    begin
      final_org := (new.raw_app_meta_data ->> 'org_id')::uuid;
    exception when others then
      final_org := null;
    end;
  end if;

  -- 3. Read additional profile details from Auth metadata
  first_name := trim(
    coalesce(new.raw_user_meta_data ->> 'first_name', '')
  );

  last_name := trim(
    coalesce(new.raw_user_meta_data ->> 'last_name', '')
  );

  nickname := nullif(
    trim(coalesce(new.raw_user_meta_data ->> 'nickname', '')),
    ''
  );

  emirates_id := nullif(
    trim(coalesce(new.raw_user_meta_data ->> 'emirates_id', '')),
    ''
  );

  full_name := trim(concat_ws(
    ' ',
    nullif(first_name, ''),
    nullif(last_name, '')
  ));

  -- 4. Create the main profile
  insert into public.profiles (
    id,
    org_id,
    name,
    email,
    phone,
    role
  )
  values (
    new.id,
    final_org,
    coalesce(
      nullif(full_name, ''),
      coalesce(new.raw_user_meta_data ->> 'name', '')
    ),
    new.email,
    nullif(trim(coalesce(new.raw_user_meta_data ->> 'phone', '')), ''),
    final_role
  );

  -- 5. Create additional personal details
  insert into public.profile_details (
    profile_id,
    first_name,
    last_name,
    nickname,
    emirates_id
  )
  values (
    new.id,
    first_name,
    last_name,
    nickname,
    emirates_id
  );

  return new;
end;
$$;