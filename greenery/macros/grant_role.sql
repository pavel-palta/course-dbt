{% macro grant(role) %}

    {% set sql %}
      grant usage on schema {{ schema }} to role {{ role }};
      grant select on {{ this }} to role {{ role }};
    {% endset %}

    {% set table = run_query(sql) %}

{% endmacro %}