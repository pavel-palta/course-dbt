{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  p.product_id,
  p.product,
  p.price,
  o.orders as total_orders,
  o.users as total_users,
  v.views as total_views

from {{ ref('stg_postgres__products') }} as p
left join {{ ref('int_core__product_orders') }} as o
  on p.product_id = o.product_id
left join {{ ref('int_product__product_views') }} as v
  on p.product_id = v.product_id
