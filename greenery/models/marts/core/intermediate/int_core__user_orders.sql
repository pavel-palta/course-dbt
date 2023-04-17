{{
  config(
    enabled=true
  )
}}

select
  user_id,
  count(distinct order_id) as total_orders,
  iff(total_orders > 1, true, false) as is_returning_user,
  case total_orders
    when 1 then '1'
    when 2 then '2'
    else '3+'
  end as cohort_orders,
  sum(order_revenue) as total_order_revenue,
  round(div0(total_order_revenue, total_orders), 2) as average_order_revenue,
  round(div0(sum(total_products), total_orders), 2) as average_ordered_products,
  round(div0(sum(total_units), total_orders), 2) as average_ordered_units,
  count(distinct iff(is_discounted, order_id, null)) as orders_discounted,
  count(distinct iff(is_delivered_in_time, order_id, null)) as orders_delivered_in_time,
  round(avg(delivery_days), 2) as average_delivery_days,
  min(created_at) as first_order_at,
  max(created_at) as last_order_at

from {{ ref('f_orders') }}

group by 1
order by 1 asc