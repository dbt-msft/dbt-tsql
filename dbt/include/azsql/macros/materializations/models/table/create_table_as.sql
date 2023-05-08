{% macro azsql__create_table_as(temporary, relation, sql) -%}
   {%- set as_columnstore = config.get('as_columnstore', default=true) -%}
   {% set tmp_relation = relation.incorporate(
   path={"identifier": relation.identifier.replace("#", "") ~ '_temp_view'},
   type='view')-%}
   {%- set temp_view_sql = sql.replace("'", "''") -%}

   {{ azsql__drop_relation_script(tmp_relation) }}

   {{ azsql__drop_relation_script(relation) }}

   EXEC('create view {{ tmp_relation.include(database=False) }} as
    {{ temp_view_sql }}
    ');

   SELECT * INTO {{ relation }} FROM
    {{ tmp_relation }}

   {{ azsql__drop_relation_script(tmp_relation) }}

   {% if not temporary and as_columnstore -%}
   {{ azsql__create_clustered_columnstore_index(relation) }}
   {% endif %}

{% endmacro %}
