{{
  config(
    enabled=true
  )
}}

select 
  user_id,
  case user_id
    when 'd1f08820-32e6-4a31-abba-5aa533bc15a9' then true
    else false
  end as is_greenery_employee,
  address_id,
  first_name,
  last_name,
  email,
  phone_number,
  created_at as registered_at,
  updated_at

from {{ source('postgres', 'users') }}
