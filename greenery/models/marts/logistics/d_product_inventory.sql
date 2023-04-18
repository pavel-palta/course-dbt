{{
  config(
    enabled=true
  )
}}

select
  product_id,
  product,
  inventory

from {{ ref('stg_postgres__products') }}
