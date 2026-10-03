create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
declare
  meta_role  text := lower(coalesce(new.raw_user_meta_data ->> 'role', ''));
  final_role text;
  final_org  uuid;
begin
  final_role := case
    when meta_role in ('manager','resident','security','maintenance') then meta_role
    else 'resident' end;

  if final_role = 'manager' then
    -- new manager = new org, always auto-created
    insert into public.organizations default values returning id into final_org;
  else
    -- org_id optional: null/empty/invalid/nonexistent -> stays null
    begin
      final_org := nullif(new.raw_user_meta_data ->> 'org_id', '')::uuid;
    exception when others then
      final_org := null;
    end;

    if final_org is not null
       and not exists (select 1 from public.organizations where id = final_org) then
      final_org := null;
    end if;
  end if;

  insert into public.profiles (id, org_id, name, email, phone, role)
  values (
    new.id,
    final_org,
    coalesce(new.raw_user_meta_data ->> 'name', ''),
    new.email,
    nullif(new.raw_user_meta_data ->> 'phone', ''),
    final_role
  );
  return new;
end;
$$;