
  create or replace   view dev_db.dbt_pavelfilatovpaltacom.stg_postgres__events
  
   as (
    

select 
  event_id,
  session_id,
  user_id,
  order_id,
  product_id,
  event_type,
  created_at,
  page_url

from raw.public.events
  );

