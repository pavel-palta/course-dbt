{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  address_id,
  count(user_id) as total_users,
  count(order_id) as total_orders,
  count(distinct iff(is_delivered_in_time, order_id, null)) as total_orders_in_time,
  count(distinct iff(not is_delivered_in_time, order_id, null)) as total_orders_delayed

from {{ ref('int_core__orders') }}

group by 1
