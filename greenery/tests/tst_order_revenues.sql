select *

from {{ ref('f_orders') }}

where 
  round(
    order_revenue + order_discount 
     - product_revenue - shipping_revenue, 
   2) != 0