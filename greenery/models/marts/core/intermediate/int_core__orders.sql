{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  o.order_id,
  o.user_id,
  o.status as order_status,
  o.order_revenue,
  o.promo,
  p.amount_discount as order_discount,
  p.status as promo_status,
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
  o.delivery_days,
  o.is_delivered_in_time

from {{ ref('stg_postgres__orders') }} as o
left join {{ ref('stg_postgres__addresses') }} as a
  on o.address_id = a.address_id
left join {{ ref('stg_postgres__promos') }} as p
  on o.promo = p.promo