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
  u.is_greenery_employee,
  a.country,
  a.state,
  e.order_id,
  o.tracking_id,
  o.shipping_service,
  o.estimated_at,
  o.delivered_at,
  o.estimated_days,
  o.delivery_days,
  e.product_id,
  p.product,
  e.event_type,
  e.event_at,
  e.page_url

from {{ ref('stg_postgres__events') }} as e
left join {{ ref('stg_postgres__products') }} as p
  on e.product_id = p.product_id
left join {{ ref('stg_postgres__users') }} as u
  on e.user_id = u.user_id
left join {{ ref('stg_postgres__addresses') }} as a
  on u.address_id = a.address_id
left join {{ ref('stg_postgres__orders') }} as o
  on e.product_id = p.product_id
