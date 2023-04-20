{{
  config(
    enabled=true
  )
}}

select
  p.promo,
  p.status,
  p.amount_discount,
  po.total_orders as total_promo_orders

from {{ ref('stg_postgres__promos') }} as p
left join {{ ref('int_marketing__promo_orders') }} as po
  on p.promo = po.promo
