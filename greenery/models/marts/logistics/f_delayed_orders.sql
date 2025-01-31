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
  shipping_revenue,
  shipping_service,
  tracking_id,
  delivery_country,
  delivery_state,
  delivery_zip,
  ordered_at,
  estimated_at,
  delivered_at,
  estimated_days,
  delivery_days

from {{ ref('int_logistics__orders_delayed') }}

order by ordered_at desc
