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
  event_at

from {{ ref('int_product__event_checkouts') }}

order by event_at desc
