{{
  config(
    enabled=true
  )
}}

select
  user_id,
  min(ordered_at) as first_order_at,
  max(ordered_at) as last_order_at,
  count(distinct order_id) as total_orders,
  sum(order_revenue) as total_revenue

from {{ ref('int_core__orders') }}

group by 1
order by 1 asc
