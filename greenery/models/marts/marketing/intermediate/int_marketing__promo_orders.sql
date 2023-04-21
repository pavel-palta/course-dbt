{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  promo,
  count(order_id) as total_orders,
  count(user_id) as total_users,
  sum(order_discount) as total_discount,
  sum(order_revenue) as total_revenue

from {{ ref('int_marketing__orders_promo') }}

group by 1