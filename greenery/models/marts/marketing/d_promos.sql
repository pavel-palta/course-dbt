{{
  config(
    enabled=true
  )
}}

select
  promo,
  status,
  amount_discount,
  total_promo_orders

from {{ ref('int_marketing__promos') }}

order by total_promo_orders desc
