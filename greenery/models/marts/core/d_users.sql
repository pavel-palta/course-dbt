{{
  config(
    enabled=true
  )
}}

select
  u.user_id,
  a.country,
  a.state,
  uo.cohort_orders,
  uo.orders,
  uo.orders_in_time,
  uo.average_delivery_days

from {{ ref('stg_postgres__users') }} as u
left join {{ ref('stg_postgres__addresses') }} as a
  on u.address_id = a.address_id
left join {{ ref('int_core__user_orders') }} as uo
  on u.user_id = uo.user_id