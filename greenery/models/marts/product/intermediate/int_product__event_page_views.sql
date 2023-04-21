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
  event_at,
  product

from {{ ref('int_product__events') }}

where event_type = 'page_view'
