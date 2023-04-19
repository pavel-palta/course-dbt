{{
  config(
    enabled=true
  )
}}

select
  order_id,
  product_id,
  product,
  ordered_at

from {{ ref('int_core__product_orders') }}
