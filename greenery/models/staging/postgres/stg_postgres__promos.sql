{{
  config(
    enabled=true
  )
}}

select
  promo_id as promo,
  status,
  discount as amount_discount

from {{ source('postgres', 'promos') }}