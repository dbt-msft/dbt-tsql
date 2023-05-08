{% macro sqlserver__create_clustered_columnstore_index(relation) -%}
  {%- set cci_name = (relation.schema ~ '_' ~ relation.identifier ~ '_cci') | replace(".", "") | replace(" ", "") -%}
  {%- set relation_name = relation.schema ~ '_' ~ relation.identifier -%}
  {%- set full_relation = '"' ~ relation.schema ~ '"."' ~ relation.identifier ~ '"' -%}
  use [{{ relation.database }}];
  if EXISTS (
        SELECT * FROM
        sys.indexes WHERE name = '{{cci_name}}'
        AND object_id=object_id('{{relation_name}}')
    )
  DROP index {{full_relation}}.{{cci_name}}
  CREATE CLUSTERED COLUMNSTORE INDEX {{cci_name}}
    ON {{full_relation}}
{% endmacro %}