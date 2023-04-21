{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  u.user_id,
  u.is_greenery_employee,
  u.registered_at,
  a.country,
  a.state,
  a.zip,
  e.average_session_length_hours,
  e.total_events,
  e.total_sessions,
  o.first_order_at,
  o.last_order_at,
  o.total_orders,
  o.total_orders_in_time,
  o.total_revenue,
  o.total_discount,
  o.average_delivery_days,
  o.total_units
  -- total products
  -- products array

from {{ ref('stg_postgres__users') }} as u
left join {{ ref('stg_postgres__addresses') }} as a
  on u.address_id = a.address_id
left join {{ ref('int_core__user_orders') }} as o
  on u.user_id = o.user_id
left join {{ ref('int_product__user_sessions') }} as e
  on u.user_id = e.user_id
