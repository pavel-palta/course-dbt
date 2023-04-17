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
  o.promo,
  o.is_discounted,
  p.amount_discount as order_discount,
  op.products,
  op.total_products,
  op.total_units,
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
left join {{ ref('stg_postgres__promos') }} as p
  on o.promo = p.promo
left join {{ ref('stg_postgres__addresses') }} as a
  on o.address_id = a.address_id
left join {{ ref('int_core__order_products') }} as op
  on o.order_id = op.order_id