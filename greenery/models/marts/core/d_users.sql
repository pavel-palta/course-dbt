{{
  config(
    enabled=true
  )
}}

select
  u.user_id,
  u.created_at,
  a.country,
  a.state,
  a.zip

from {{ ref('stg_postgres__users') }} as u
left join {{ ref('stg_postgres__addresses') }} as a
  on u.address_id = a.address_id
