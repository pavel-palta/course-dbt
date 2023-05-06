{{
  config(
    enabled=true
  )
}}

select
  product_id,
  product,
  total_page_views,
  total_add_to_carts,
  total_checkouts,
  rate_view_to_cart,
  rate_cart_to_checkout,
  rate_view_to_checkout
  
from {{ ref('int_product__product_funnels') }}

order by 8 desc