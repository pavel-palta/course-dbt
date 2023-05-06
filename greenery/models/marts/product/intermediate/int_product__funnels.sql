{{
  config(
    enabled=true,
    materialized='view'
  )
}}

select
  s.session_id,
  v.product_id,
  s.user_id,
  s.start_at,
  v.product as product,
  s.state,
  s.is_greenery_employee,
  count(distinct v.event_id) as page_views,
  count(distinct a.event_id) as add_to_carts,
  count(distinct c.event_id) as checkouts,
  (checkouts > 0) as is_conversion

from {{ ref('int_product__sessions') }} as s
left join {{ ref('int_product__event_page_views') }} as v
  on s.session_id = v.session_id
left join {{ ref('int_product__event_add_to_carts') }} as a
  on v.session_id = a.session_id and
     v.product_id = a.product_id
left join {{ ref('int_product__event_checkouts') }} as c
  on s.session_id = c.session_id and
     a.event_id is not null

{{ dbt_utils.group_by(n=7) }}
