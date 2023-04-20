select *

from {{ ref('stg_postgres__orders') }}

where 
  round(
    order_revenue
     - product_revenue - shipping_revenue, 
   2) != 0 and
   promo is null