{{
  config(
    enabled=true
  )
}}

select
  promo,
  status,
  amount_discount

from {{ ref('stg_postgres__promos') }}

order by status asc
