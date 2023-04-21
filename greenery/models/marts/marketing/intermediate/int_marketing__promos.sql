{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  p.promo,
  p.status,
  p.amount_discount,
  o.total_users,
  o.total_orders,
  o.total_discount,
  o.total_revenue

from {{ ref('stg_postgres__promos') }} as p
left join {{ ref('int_marketing__promo_orders') }} as o
  on p.promo = o.promo
