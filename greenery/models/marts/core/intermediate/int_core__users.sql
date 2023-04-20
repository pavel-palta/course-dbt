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
  uo.first_order_at,
  uo.last_order_at,
  uo.total_orders,
  uo.total_revenue,
  us.first_session_at,
  us.last_session_at,
  us.events as total_events,
  us.sessions as total_sessions

from {{ ref('stg_postgres__users') }} as u
left join {{ ref('stg_postgres__addresses') }} as a
  on u.address_id = a.address_id
left join {{ ref('int_core__user_orders') }} as uo
  on u.user_id = uo.user_id
left join {{ ref('int_product__user_sessions') }} as us
  on u.user_id = us.user_id
