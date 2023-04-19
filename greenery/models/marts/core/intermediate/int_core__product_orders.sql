{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  oi.order_id,
  oi.product_id,
  p.product,
  o.ordered_at

from {{ ref('stg_postgres__order_items') }} as oi
left join {{ ref('stg_postgres__orders') }} as o
  on oi.order_id = o.order_id
left join {{ ref('stg_postgres__products') }} as p
  on oi.product_id = p.product_id
