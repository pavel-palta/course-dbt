{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  v.product_id,
  v.product,
  count(distinct v.session_id) as page_views,
  count(distinct a.session_id) as add_to_carts,
  count(distinct c.session_id) as checkouts,
  div0(add_to_carts, page_views) as rate_view_to_cart,
  div0(checkouts, add_to_carts) as rate_cart_to_checkout,
  div0(checkouts, page_views) as rate_view_to_checkout
  
from {{ ref('int_product__event_page_views') }} as v
left join {{ ref('int_product__event_add_to_carts') }} as a
  on v.session_id = a.session_id and
     v.product_id = a.product_id
left join {{ ref('int_product__event_checkouts') }} as c
  on a.session_id = c.session_id

{{ dbt_utils.group_by(n=2) }}