select *

from {{ ref('f_orders') }}

where 
  round(
    total_price
     - product_revenue, 
   2) != 0