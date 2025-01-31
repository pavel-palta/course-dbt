{{
  config(
    enabled=true
  )
}}

select 
  event_id,
  session_id,
  user_id,
  order_id,
  product_id,
  event_type,
  created_at as event_at,
  page_url

from {{ source('postgres', 'events') }}
