{{
  config(
    enabled=true
  )
}}

{%- set event_types = get_event_types() -%}

select
  session_id,
  user_id,
  state,
  product,
  start_at,
  page_views,
  add_to_carts,
  checkouts

from {{ ref('int_product__funnels') }}

order by start_at desc
