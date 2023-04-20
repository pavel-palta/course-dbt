select *

from dev_db.dbt_pavelfilatovpaltacom.stg_postgres__events

where 
  event_type in ('add_to_cart', 'page_view') and
  product_id is null