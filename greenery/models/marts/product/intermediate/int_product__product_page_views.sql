{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  product_id,
  count(distinct event_id) as total_views

from {{ ref('int_product__event_page_views') }}

group by 1
