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
  order_id,
  event_at

from {{ ref('int_product__events') }}

where event_type = 'checkout'
