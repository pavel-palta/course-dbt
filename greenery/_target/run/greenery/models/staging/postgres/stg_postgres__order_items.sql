
  create or replace   view dev_db.dbt_pavelfilatovpaltacom.stg_postgres__order_items
  
   as (
    

select 
  order_id,
  product_id,
  quantity

from raw.public.order_items
  );

