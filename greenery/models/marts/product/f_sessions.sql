{{
  config(
    enabled=true
  )
}}

{%- set event_types = get_event_types() -%}

select
  session_id,
  user_id,
  start_at,
  end_at,
  events,
  {%- for event_type in event_types %}
  {{event_type}}_events,
  {%- endfor %}
  length_seconds,
  length_hours

from {{ ref('int_product__sessions') }}

order by start_at desc
