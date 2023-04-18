{{
  config(
    enabled=true
  )
}}

select
  event_id,
  session_id,
  user_id,
  product_id,
  created_at,
  product

from {{ ref('int_product__page_views') }}
