{{
  config(
    enabled=true
  )
}}

select
  product_id,
  product,
  price,
  total_users,
  total_orders,
  total_views

from {{ ref('int_core__products') }}

order by total_orders desc
