
  create or replace   view dev_db.dbt_pavelfilatovpaltacom.stg_postgres__users
  
   as (
    

select 
  user_id,
  address_id,
  first_name,
  last_name,
  email,
  phone_number,
  created_at,
  updated_at

from raw.public.users
  );

