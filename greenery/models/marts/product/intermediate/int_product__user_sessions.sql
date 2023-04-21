{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  user_id,
  round(avg(length_hours), 2) as average_session_length_hours,
  sum(events) as total_events,
  count(distinct session_id) as total_sessions

from {{ ref('int_product__sessions') }}

group by 1
