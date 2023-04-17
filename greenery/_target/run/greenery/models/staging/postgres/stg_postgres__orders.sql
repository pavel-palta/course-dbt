
  create or replace   view dev_db.dbt_pavelfilatovpaltacom.stg_postgres__orders
  
   as (
    

select 
  order_id,
  user_id,
  address_id,
  tracking_id,
  promo_id,
  status,
  shipping_service,
  order_total,
  order_cost,
  shipping_cost,
  created_at,
  estimated_delivery_at,
  delivered_at

from raw.public.orders
  );

