
  create or replace   view dev_db.dbt_pavelfilatovpaltacom.stg_postgres__products
  
   as (
    

select 
  product_id,
  name as product,
  inventory,
  price

from raw.public.products
  );

