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
  order_discount

from {{ ref('int_core__orders') }}

where is_discounted
