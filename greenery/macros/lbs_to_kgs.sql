{% macro lbs_to_kgs(column_name, precision=2) %}

    round(
       ({{ column_name }} / 2.205)::numeric, 
       {{ precision }}
    )
    
{% endmacro %}