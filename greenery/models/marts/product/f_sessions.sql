{{
  config(
    enabled=true
  )
}}

select
  session_id,
  user_id,
  start_at,
  end_at,
  events,
  length_seconds,
  length_hours

from {{ ref('int_product__sessions') }}

order by start_at desc
