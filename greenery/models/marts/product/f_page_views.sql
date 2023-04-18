{{
  config(
    enabled=true,
    materialized='incremental'
  )
}}

select
  event_id,
  session_id,
  user_id,
  product_id,
  created_at

from {{ ref('stg_postgres__events') }}

where 
  event_type = 'page_view'
  {% if is_incremental() %}
  and created_at > (select max(created_at) from {{ this }})
  {% endif %}

order by created_at desc