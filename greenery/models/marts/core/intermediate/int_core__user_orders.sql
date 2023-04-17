{{
  config(
    enabled=true
  )
}}

select
  user_id,
  count(distinct order_id) as orders,
  case orders
    when 1 then '1'
    when 2 then '2'
    else '3+'
  end as cohort_orders,
  count(distinct iff(is_delivered_in_time, order_id, null)) as orders_in_time,
  round(avg(diff_c_d_seconds) / 86400, 2) as average_delivery_days,
  min(created_at) as first_order_at,
  max(created_at) as last_order_at,
  iff(orders > 1, true, false) as is_returning_user

from {{ ref('stg_postgres__orders') }}

group by 1
order by 1 asc