{{
  config(
    enabled=true
  )
}}

select
  u.user_id,
  a.country,
  a.state,
  a.zip,
  uo.total_orders,
  uo.is_returning_user,
  uo.cohort_orders,
  uo.total_order_revenue,
  uo.orders_discounted as total_orders_discounted,
  uo.average_ordered_products,
  uo.average_ordered_units,
  uo.orders_delivered_in_time,
  uo.average_delivery_days

from {{ ref('stg_postgres__users') }} as u
left join {{ ref('stg_postgres__addresses') }} as a
  on u.address_id = a.address_id
left join {{ ref('int_core__user_orders') }} as uo
  on u.user_id = uo.user_id