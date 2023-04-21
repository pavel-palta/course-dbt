{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  product_id,
  min(ordered_at) as first_order_at,
  max(ordered_at) as last_order_at,
  count(distinct order_id) as total_orders,
  count(distinct user_id) as total_users,
  sum(units) as total_units_sold

from {{ ref('int_core__items') }}

group by 1
