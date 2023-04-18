{{
  config(
    enabled=true
  )
}}

select
  o.order_id,
  o.user_id,
  o.status,
  o.order_revenue,
  o.is_discounted,
  o.order_cost,
  o.shipping_cost,
  o.shipping_service,
  a.country as delivery_country,
  a.state as delivery_state,
  a.zip as delivery_zip,
  o.created_at,
  o.estimated_at,
  o.delivered_at,
  o.estimated_days,
  o.delivery_days

from {{ ref('stg_postgres__orders') }} as o
left join {{ ref('stg_postgres__addresses') }} as a
  on o.address_id = a.address_id
  