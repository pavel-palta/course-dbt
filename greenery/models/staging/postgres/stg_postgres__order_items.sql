{{
  config(
    enabled=true
  )
}}

select 
  order_id,
  product_id,
  quantity as units

from {{ source('postgres', 'order_items') }}