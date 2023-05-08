{% macro azsql__make_temp_relation(base_relation, suffix) %}
    {% set tmp_identifier = '#' ~  base_relation.identifier ~ suffix %}
    {% set tmp_relation = base_relation.incorporate(
                                path={"identifier": tmp_identifier}) -%}

    {% do return(tmp_relation) %}
{% endmacro %}

{% macro azsql__drop_relation(relation) -%}
  {% call statement('drop_relation', auto_begin=False) -%}
    {{ azsql__drop_relation_script(relation) }}
  {%- endcall %}
{% endmacro %}

{% macro azsql__drop_relation_script(relation) -%}
  {% if relation.type == 'view' -%}
   {% set object_id_type = 'V' %}
   {% elif relation.type == 'table'%}
   {% set object_id_type = 'U' %}
   {%- else -%} invalid target name
   {% endif %}

  if object_id ('{{ relation.include(database=False) }}','{{ object_id_type }}') is not null
      begin
      drop {{ relation.type }} {{ relation.include(database=False) }}
      end
{% endmacro %}

{% macro azsql__rename_relation(from_relation, to_relation) -%}
  {% call statement('rename_relation') -%}

    EXEC sp_rename '{{ from_relation.schema }}.{{ from_relation.identifier }}', '{{ to_relation.identifier }}'
    IF EXISTS(
    SELECT *
    FROM sys.indexes
    WHERE name='{{ from_relation.schema }}_{{ from_relation.identifier }}_cci' and object_id = OBJECT_ID('{{ from_relation.schema }}.{{ to_relation.identifier }}'))
    EXEC sp_rename N'{{ from_relation.schema }}.{{ to_relation.identifier }}.{{ from_relation.schema }}_{{ from_relation.identifier }}_cci', N'{{ from_relation.schema }}_{{ to_relation.identifier }}_cci', N'INDEX'
  {%- endcall %}
{% endmacro %}
