{{
  config(
    enabled=true
  )
}}

select
  product_id,
  product,
  price,
  first_order_at,
  last_order_at,
  total_units_sold,
  total_orders,
  total_users

from {{ ref('int_core__products') }}

order by total_units_sold desc
