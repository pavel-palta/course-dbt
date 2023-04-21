{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select 
  s.product_id,
  s.product,
  s.dbt_updated_at as updated_at,
  p.inventory as current_inventory,
  lag(s.inventory) over (partition by s.product_id order by s.dbt_updated_at asc) as previous_inventory,
  row_number() over (partition by s.product_id order by s.dbt_updated_at desc) = 1 as is_last

from {{ ref('sst_postgres__products') }} as s
left join {{ ref('stg_postgres__products') }} as p
  on s.product_id = p.product_id
