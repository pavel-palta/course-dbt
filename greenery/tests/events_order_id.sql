select *

from {{ ref('stg_postgres__events') }}

where 
  event_type in ('checkout', 'package_shipped') and
  order_id is null