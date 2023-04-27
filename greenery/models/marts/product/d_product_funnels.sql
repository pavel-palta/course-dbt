{{
  config(
    enabled=true
  )
}}

select
  product_id,
  product,
  page_views,
  add_to_carts,
  checkouts,
  rate_view_to_cart,
  rate_cart_to_checkout,
  rate_view_to_checkout
  
from {{ ref('int_product__product_funnels') }}

order by 8 desc