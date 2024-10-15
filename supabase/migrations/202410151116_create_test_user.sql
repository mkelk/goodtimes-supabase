BEGIN;

-- Create a user in auth.users table
WITH new_user AS (
  INSERT INTO auth.users (
    id, email, encrypted_password, email_confirmed_at, 
    raw_app_meta_data, raw_user_meta_data, created_at, updated_at,
    aud, role, instance_id
  )
  VALUES (
    gen_random_uuid(), -- Generate a UUID for the user
    'mortenelk+testgt@gmail.com', -- Replace with the desired email
    crypt('123456', gen_salt('bf', 10)), -- Use stronger encryption (cost factor 10)
    current_timestamp,
    '{"provider": "email", "providers": ["email"]}',
    jsonb_build_object(
      'sub', gen_random_uuid()::text,
      'email', 'mortenelk+testgt@gmail.com',
      'email_verified', false,
      'phone_verified', false
    ),
    current_timestamp,
    current_timestamp,
    'authenticated',
    'authenticated',
    '00000000-0000-0000-0000-000000000000'::uuid -- Replace with your actual instance ID
  )
  RETURNING id, email
), auth_identities AS (
  -- Insert into auth.identities
  INSERT INTO auth.identities (id, user_id, provider, provider_id, identity_data)
  SELECT id, id, 'email', email, jsonb_build_object('sub', id, 'email', email)
  FROM new_user
), customers AS (
  -- Insert into customers table
  INSERT INTO public.customers (auth_user_id)
  SELECT id
  FROM new_user
)
SELECT 'User created successfully' AS result;

COMMIT;
