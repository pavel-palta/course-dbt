{{
  config(
    enabled=true
  )
}}

select
  product_id,
  order_id,
  user_id,
  product,
  ordered_at,
  product_revenue

from {{ ref('int_core__order_items') }}
