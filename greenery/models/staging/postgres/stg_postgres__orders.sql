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
  promo_id,
  status,
  shipping_service,
  order_total,
  order_cost,
  shipping_cost,
  created_at,
  estimated_delivery_at,
  delivered_at,
  delivered_at < estimated_delivery_at as is_delivered_in_time,
  timediff(second, created_at, delivered_at) as diff_c_d_seconds

from {{ source('postgres', 'orders') }}