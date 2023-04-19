{{
  config(
    enabled=true
  )
}}

select
  order_id,
  user_id,
  order_status,
  shipping_cost,
  shipping_service,
  delivery_country,
  delivery_state,
  delivery_zip,
  ordered_at,
  estimated_at,
  delivered_at,
  estimated_days,
  delivery_days

from {{ ref('int_core__orders') }}

where not is_delivered_in_time
  