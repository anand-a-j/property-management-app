
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  meta_role   text := lower(coalesce(new.raw_user_meta_data ->> 'role', ''));
  final_role  text;
  final_org   uuid;

  first_name  text;
  last_name   text;
  nickname    text;
  emirates_id text;
  full_name   text;
BEGIN
  -- 1. Resolve role
  final_role := CASE
    WHEN meta_role IN ('manager', 'resident', 'security', 'maintenance')
      THEN meta_role
    ELSE 'resident'
  END;

  -- 2. Resolve organization
  IF final_role = 'manager' THEN
    INSERT INTO public.organizations DEFAULT VALUES
    RETURNING id INTO final_org;
  ELSE
    BEGIN
      final_org := NULLIF(
        new.raw_user_meta_data ->> 'org_id', ''
      )::uuid;
    EXCEPTION WHEN OTHERS THEN
      final_org := NULL;
    END;

    IF final_org IS NOT NULL
       AND NOT EXISTS (
         SELECT 1
         FROM public.organizations
         WHERE id = final_org
       ) THEN
      final_org := NULL;
    END IF;
  END IF;

  -- 3. Read additional profile details
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

  -- 4. Create profile
  INSERT INTO public.profiles (
    id,
    org_id,
    name,
    email,
    phone,
    role
  )
  VALUES (
    new.id,
    final_org,
    coalesce(
      nullif(full_name, ''),
      coalesce(new.raw_user_meta_data ->> 'name', '')
    ),
    new.email,
    nullif(
      trim(coalesce(new.raw_user_meta_data ->> 'phone', '')),
      ''
    ),
    final_role
  );

  -- 5. Create profile details
  INSERT INTO public.profile_details (
    profile_id,
    first_name,
    last_name,
    nickname,
    emirates_id
  )
  VALUES (
    new.id,
    first_name,
    last_name,
    nickname,
    emirates_id
  );

  RETURN new;
END;
$$;
