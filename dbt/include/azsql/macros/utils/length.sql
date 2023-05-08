{% macro azsql__length(expression) %}

    len( {{ expression }} )

{%- endmacro -%}
