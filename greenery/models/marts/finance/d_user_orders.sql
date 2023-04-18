{{
  config(
    enabled=true
  )
}}

select
  user_id,
  count(distinct order_id) as total_orders,
  sum(order_revenue) as total_order_revenue

from {{ ref('f_orders') }}

group by 1
order by 1 asc
