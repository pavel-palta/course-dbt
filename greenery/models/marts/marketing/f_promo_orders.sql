{{
  config(
    enabled=true
  )
}}

select
  o.order_id,
  o.created_at,
  o.status as order_status,
  o.promo,
  p.status as promo_status,
  p.amount_discount as order_discount

from {{ ref('stg_postgres__orders') }} as o
left join {{ ref('stg_postgres__promos') }} as p
  on o.promo = p.promo