{{
  config(
    enabled=true
  )
}}

select
  session_id,
  user_id,
  start_at,
  end_at,
  events,
  page_view_events,
  add_to_cart_events,
  checkout_events,
  package_shipped_events,
  length_seconds,
  length_hours

from {{ ref('int_product__sessions') }}

order by start_at desc
