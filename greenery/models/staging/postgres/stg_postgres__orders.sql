{{
  config(
    enabled=true
  )
}}

select 
  order_id,
  user_id,
  address_id,
  tracking_id,
  status,
  shipping_service,
  order_total as order_revenue,
  promo_id as promo,
  (promo is not null) as is_discounted,
  order_cost,
  shipping_cost,
  created_at,
  iff(timediff(year, created_at, estimated_delivery_at) >= 1, null, estimated_delivery_at) as estimated_at,
  delivered_at,
  timediff(second, created_at, estimated_at) as estimated_seconds,
  round(estimated_seconds / 86400, 2) as estimated_days,
  timediff(second, created_at, delivered_at) as delivery_seconds,
  round(delivery_seconds / 86400, 2) as delivery_days,
  delivery_seconds < estimated_seconds as is_delivered_in_time

from {{ source('postgres', 'orders') }}