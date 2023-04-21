{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  o.order_id,
  o.user_id,
  u.is_greenery_employee,
  o.status as order_status,
  o.promo,
  p.amount_discount as order_discount,
  o.is_discounted,
  o.order_revenue,
  i.total_products,
  i.total_units,
  i.total_price,
  o.product_revenue,
  i.products_list,
  o.shipping_revenue,
  o.shipping_service,
  o.tracking_id,
  o.address_id,
  a.country as delivery_country,
  a.state as delivery_state,
  a.zip as delivery_zip,
  o.ordered_at,
  o.estimated_at,
  o.delivered_at,
  o.estimated_days,
  o.delivery_days,
  o.is_delivered_in_time

from {{ ref('stg_postgres__orders') }} as o
left join {{ ref('stg_postgres__users') }} as u
  on o.user_id = u.user_id
left join {{ ref('stg_postgres__addresses') }} as a
  on o.address_id = a.address_id
left join {{ ref('stg_postgres__promos') }} as p
  on o.promo = p.promo
left join {{ ref('int_core__order_items') }} as i
  on o.order_id = i.order_id
-- join aggregate on events
