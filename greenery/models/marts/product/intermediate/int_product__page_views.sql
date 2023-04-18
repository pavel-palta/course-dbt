{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  e.event_id,
  e.session_id,
  e.user_id,
  e.product_id,
  e.created_at,
  p.product

from {{ ref('stg_postgres__events') }} as e
left join {{ ref('stg_postgres__products') }} as p
  on e.product_id = p.product_id

where e.event_type = 'page_view'
