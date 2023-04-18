{{
  config(
    enabled=true
  )
}}

select
  product_id,
  product,
  inventory,
  price

from {{ ref('stg_postgres__products') }}
