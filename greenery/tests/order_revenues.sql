select *

from dev_db.dbt_pavelfilatovpaltacom.f_orders

where 
  round(
    order_revenue + order_discount 
     - product_revenue - shipping_revenue, 
   2) != 0