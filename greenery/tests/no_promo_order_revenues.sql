select *

from dev_db.dbt_pavelfilatovpaltacom.stg_postgres__orders

where 
  round(
    order_revenue
     - product_revenue - shipping_revenue, 
   2) != 0 and
   promo is null