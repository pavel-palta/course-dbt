{{
  config(
    enabled=true
  )
}}

select 
  address_id,
  address,
  country,
  state,
  zipcode as zip

from {{ source('postgres', 'addresses') }}
