{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  order_id,
  user_id,
  is_greenery_employee,
  order_status,
  promo,
  order_discount,
  order_revenue,
  total_products,
  total_units,
  total_price,
  product_revenue,
  products_list,
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
  delivery_days,
  is_delivered_in_time

from {{ ref('int_core__orders') }}

where is_discounted
