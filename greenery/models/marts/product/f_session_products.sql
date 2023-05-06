{{
  config(
    enabled=true
  )
}}

select distinct
  s.session_id,
  s.start_at,
  replace(p.value, '"', '') as product

from {{ ref('int_product__sessions') }} as s,
lateral flatten(input => products) as p

order by start_at desc, product asc
