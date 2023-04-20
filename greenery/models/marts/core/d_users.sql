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
  first_order_at,
  last_order_at,
  first_session_at,
  last_session_at,
  total_orders,
  total_revenue,
  total_events,
  total_sessions

from {{ ref('int_core__users') }}

order by total_orders desc
