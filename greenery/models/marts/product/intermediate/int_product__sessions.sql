{{
  config(
    enabled=true,
    materialized='view'
  )
}}

{%- set event_types = get_event_types() -%}

select
  session_id,
  user_id,
  state,
  is_greenery_employee,
  min(event_at) as start_at,
  max(event_at) as end_at,
  count(distinct event_id) as events,
  {%- for event_type in event_types %}
  count(distinct iff(event_type = '{{event_type}}', event_id, null)) as {{event_type}}_events,
  {%- endfor %}
  timediff(second, start_at, end_at) as length_seconds,
  round(length_seconds / 3600, 2) as length_hours

from {{ ref('int_product__events') }}

{{ dbt_utils.group_by(n=4) }}
