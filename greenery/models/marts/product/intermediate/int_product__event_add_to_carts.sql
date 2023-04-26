{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  event_id,
  session_id,
  user_id,
  product_id,
  product,
  event_at

from {{ ref('int_product__events') }}

where event_type = 'add_to_cart'
