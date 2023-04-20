{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  user_id,
  min(event_at) as first_session_at,
  max(event_at) as last_session_at,
  count(distinct event_id) as events,
  count(distinct session_id) as sessions

from {{ ref('stg_postgres__events') }}

group by 1
