{{
  config(
    enabled=true
  )
}}

select 
  user_id,
  address_id,
  first_name,
  last_name,
  email,
  phone_number,
  created_at as registered_at,
  updated_at

from {{ source('postgres', 'users') }}