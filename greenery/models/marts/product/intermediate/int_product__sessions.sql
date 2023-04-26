{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  session_id,
  user_id,
  min(event_at) as start_at,
  max(event_at) as end_at,
  count(distinct event_id) as events,
  count(distinct iff(event_type = 'page_view', event_id, null)) as page_view_events,
  count(distinct iff(event_type = 'add_to_cart', event_id, null)) as add_to_cart_events,
  count(distinct iff(event_type = 'checkout', event_id, null)) as checkout_events,
  count(distinct iff(event_type = 'package_shipped', event_id, null)) as package_shipped_events,
  timediff(second, start_at, end_at) as length_seconds,
  round(length_seconds / 3600, 2) as length_hours

from {{ ref('stg_postgres__events') }}

group by 1, 2
