{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select 
  a.address_id,
  a.address,
  a.country,
  a.state,
  a.zip,
  o.total_users,
  o.total_orders,
  o.total_orders_in_time,
  o.total_orders_delayed

from {{ ref('stg_postgres__addresses') }} as a
left join {{ ref('int_logistics__address_orders') }} as o
  on a.address_id = o.address_id
