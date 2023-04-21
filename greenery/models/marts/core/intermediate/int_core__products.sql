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
  e.total_views,
  i.first_order_at,
  i.last_order_at,
  i.total_orders,
  i.total_users,
  i.total_units_sold

from {{ ref('stg_postgres__products') }} as p
left join {{ ref('int_core__product_items') }} as i
  on p.product_id = i.product_id
left join {{ ref('int_product__product_page_views') }} as e
  on p.product_id = e.product_id
