{{
  config(
    enabled=true
  )
}}

select
  {{ dbt_utils.generate_surrogate_key(['order_id', 'product_id']) }} as item_id,
  order_id,
  product_id,
  quantity as units

from {{ source('postgres', 'order_items') }}
