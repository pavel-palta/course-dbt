{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  product_id,
  count(distinct event_id) as views

from {{ ref('int_product__page_views') }}

group by 1
