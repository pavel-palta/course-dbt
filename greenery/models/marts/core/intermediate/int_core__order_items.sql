{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  order_id,
  count(distinct product_id) as total_products,
  array_agg(distinct product) within group (order by product) as products_list,
  sum(units) as total_units,
  sum(price) as total_price

from {{ ref('int_core__items') }}

group by 1
