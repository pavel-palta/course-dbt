{{
  config(
    enabled=true
  )
}}

select
  user_id,
  created_at,
  country,
  state,
  zip

from {{ ref('int_core__users') }}
