{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  promo,
  count(order_id) as total_orders

from {{ ref('int_marketing__orders') }}

group by 1
