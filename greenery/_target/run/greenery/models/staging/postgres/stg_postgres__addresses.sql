
  create or replace   view dev_db.dbt_pavelfilatovpaltacom.stg_postgres__addresses
  
   as (
    

select 
  address_id,
  address,
  country,
  state,
  zipcode

from raw.public.addresses
  );

