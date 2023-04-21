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
  zip,
  total_users,
  total_orders,
  total_orders_in_time,
  total_orders_delayed

from {{ ref('int_logistics__addresses') }}

order by total_users desc, total_orders desc
