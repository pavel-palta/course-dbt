{{
  config(
    enabled=true
  )
}}

select
  user_id,
  is_greenery_employee,
  registered_at,
  country,
  state,
  zip,
  average_session_length_hours,
  total_events,
  total_sessions,
  first_order_at,
  last_order_at,
  total_orders,
  total_orders_in_time,
  total_revenue,
  total_discount,
  average_delivery_days,
  total_units

from {{ ref('int_core__users') }}

order by total_revenue desc
