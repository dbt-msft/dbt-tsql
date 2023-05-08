{% macro azsql__current_timestamp() -%}
  SYSDATETIME()
{%- endmacro %}
