{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  product_id,
  count(order_id) as orders,
  count(user_id) as users

from {{ ref('int_core__order_items') }}

group by 1
