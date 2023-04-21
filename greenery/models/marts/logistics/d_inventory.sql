{{
  config(
    enabled=true
  )
}}

select
  product_id,
  product,
  updated_at,
  current_inventory,
  previous_inventory

from {{ ref('int_logistics__product_inventory') }}

order by current_inventory desc
