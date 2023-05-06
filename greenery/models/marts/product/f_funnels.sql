{{
  config(
    enabled=true
  )
}}

select
  session_id,
  user_id,
  is_greenery_employee,
  state,
  start_at,
  product,
  page_views,
  add_to_carts,
  is_conversion

from {{ ref('int_product__funnels') }}

order by start_at desc
