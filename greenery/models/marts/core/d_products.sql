{{
  config(
    enabled=true
  )
}}

select
  product_id,
  product,
  price

from {{ ref('stg_postgres__products') }}
