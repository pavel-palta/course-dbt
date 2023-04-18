{{
  config(
    enabled=true
  )
}}

select
  product_id,
  product,
  order_id,
  ordered_at

from {{ ref('int_core__product_orders') }}
