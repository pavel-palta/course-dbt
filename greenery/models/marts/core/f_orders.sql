{{
  config(
    enabled=true
  )
}}

select
  order_id,
  user_id,
  status,
  order_revenue,
  order_cost,
  created_at

from {{ ref('stg_postgres__orders') }}
  