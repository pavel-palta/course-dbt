{{
  config(
    enabled=true
  )
}}

select
  order_id,
  ordered_at,
  order_status,
  promo,
  promo_status,
  order_revenue + order_discount as order_revenue_before_discount,
  order_discount,
  order_revenue as order_revenue_after_discount

from {{ ref('int_core__orders') }}

where is_discounted
