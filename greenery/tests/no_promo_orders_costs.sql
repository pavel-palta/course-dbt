select *

from dev_db.dbt_pavelfilatovpaltacom.stg_postgres__orders

where 
  round(
    order_cost 
     - product_cost - shipping_cost, 
   2) != 0 and
   promo is null