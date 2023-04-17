{{
  config(
    enabled=true
  )
}}

select
  order_id,
  listagg(distinct p.product, ', ') within group (order by p.product asc) as products,
  count(distinct oi.product_id) as total_products,
  sum(oi.units) as total_units

from {{ ref('stg_postgres__order_items') }} as oi
left join {{ ref('stg_postgres__products') }} as p
  on oi.product_id = p.product_id

group by 1
order by 1 asc