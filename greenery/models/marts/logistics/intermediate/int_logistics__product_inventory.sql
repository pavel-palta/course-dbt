{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  product_id,
  product,
  current_inventory,
  previous_inventory

from {{ ref('int_logistics__inventory') }}

where is_last
