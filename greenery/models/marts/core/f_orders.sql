{{
  config(
    enabled=true
  )
}}

select
  order_id,
  user_id,
  order_status,
  order_revenue,
  order_discount,
  ordered_at,
  delivery_country,
  delivery_state,
  delivery_zip

from {{ ref('int_core__orders') }}
  