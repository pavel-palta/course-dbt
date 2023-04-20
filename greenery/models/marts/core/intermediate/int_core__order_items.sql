{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  oi.product_id,
  oi.order_id,
  o.user_id,
  p.product,
  o.ordered_at,
  o.product_revenue

from {{ ref('stg_postgres__order_items') }} as oi
left join {{ ref('stg_postgres__orders') }} as o
  on oi.order_id = o.order_id
left join {{ ref('stg_postgres__products') }} as p
  on oi.product_id = p.product_id
