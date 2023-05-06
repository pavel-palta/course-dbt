{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  product_id,
  product,
  count(distinct iff(page_views > 0, session_id, null)) as total_page_views,
  count(distinct iff(add_to_carts > 0, session_id, null)) as total_add_to_carts,
  count(distinct iff(checkouts > 0, session_id, null)) as total_checkouts,
  div0(total_add_to_carts, total_page_views) as rate_view_to_cart,
  div0(total_checkouts, total_add_to_carts) as rate_cart_to_checkout,
  div0(total_checkouts, total_page_views) as rate_view_to_checkout
  
from {{ ref('int_product__funnels') }}

{{ dbt_utils.group_by(n=2) }}
