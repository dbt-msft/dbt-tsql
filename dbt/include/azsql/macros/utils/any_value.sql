{% macro azsql__any_value(expression) -%}

    min({{ expression }})

{%- endmacro %}
