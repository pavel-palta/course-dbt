
  create or replace   view dev_db.dbt_pavelfilatovpaltacom.stg_postgres__promos
  
   as (
    

select
  promo_id,
  status,
  discount

from raw.public.promos
  );

