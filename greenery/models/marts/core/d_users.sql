{{
  config(
    enabled=true
  )
}}

select
  user_id,
  registered_at,
  country,
  state,
  zip

from {{ ref('int_core__users') }}
