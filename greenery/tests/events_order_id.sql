select *

from dev_db.dbt_pavelfilatovpaltacom.stg_postgres__events

where 
  event_type in ('checkout', 'package_shipped') and
  order_id is null