select *

from dev_db.dbt_pavelfilatovpaltacom.f_orders

where 
  round(
    order_cost + order_discount 
     - product_cost - shipping_cost, 
   2) != 0