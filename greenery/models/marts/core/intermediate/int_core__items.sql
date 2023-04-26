{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  i.item_id,
  i.product_id,
  i.order_id,
  o.user_id,
  o.ordered_at,
  p.product,
  i.units,
  p.price as unit_price,
  p.price * i.units as price

from {{ ref('stg_postgres__items') }} as i
left join {{ ref('stg_postgres__orders') }} as o
  on i.order_id = o.order_id
left join {{ ref('stg_postgres__products') }} as p
  on i.product_id = p.product_id
