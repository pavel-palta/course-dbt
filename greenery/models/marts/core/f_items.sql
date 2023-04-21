{{
  config(
    enabled=true
  )
}}

select
  product_id,
  order_id,
  user_id,
  ordered_at,
  product,
  units,
  price

from {{ ref('int_core__items') }}

order by ordered_at desc, units desc, price desc