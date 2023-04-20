{{
  config(
    enabled=true
  )
}}

select
  user_id,
  first_session_at,
  last_session_at,
  events,
  sessions

from {{ ref('int_product__user_sessions') }}
