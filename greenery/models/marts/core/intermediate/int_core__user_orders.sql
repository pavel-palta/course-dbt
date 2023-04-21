{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  user_id,
  min(ordered_at) as first_order_at,
  max(ordered_at) as last_order_at,
  count(distinct order_id) as total_orders,
  count(distinct iff(is_delivered_in_time, order_id, null)) as total_orders_in_time,
  sum(order_revenue) as total_revenue,
  sum(order_discount) as total_discount,
  avg(delivery_days) as average_delivery_days,
  sum(total_units) as total_units
  -- total products
  -- products array

from {{ ref('int_core__orders') }}

group by 1
