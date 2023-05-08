{% macro azsql__concat(fields) -%}
    concat({{ fields|join(', ') }}, '')
{%- endmacro %}
