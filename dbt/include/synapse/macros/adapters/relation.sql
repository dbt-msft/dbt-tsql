{% macro synapse__rename_relation(from_relation, to_relation) -%}
  {% call statement('rename_relation') -%}

    rename object {{ from_relation.include(database=False) }} to {{ to_relation.identifier }}
  {%- endcall %}
{% endmacro %}