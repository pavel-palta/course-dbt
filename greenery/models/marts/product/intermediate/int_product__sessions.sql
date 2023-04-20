{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  session_id,
  user_id,
  min(event_at) as first_event_at,
  max(event_at) as last_event_at,
  count(distinct event_id) as events,
  timediff(second, first_event_at, last_event_at) as length_seconds,
  round(length_seconds / 3600, 2) as length_hours

from {{ ref('stg_postgres__events') }}

group by 1, 2
