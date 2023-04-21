{{
  config(
    enabled=true
  )
}}

select
  promo,
  status,
  amount_discount,
  total_users,
  total_orders,
  total_discount,
  total_revenue

from {{ ref('int_marketing__promos') }}

order by status asc, total_orders desc
