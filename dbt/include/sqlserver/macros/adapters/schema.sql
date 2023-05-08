{% macro sqlserver__create_schema(relation) -%}
  {% call statement('create_schema') -%}
    USE [{{ relation.database }}];
    IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = '{{ relation.without_identifier().schema }}')
    BEGIN
    EXEC('CREATE SCHEMA [{{ relation.without_identifier().schema }}]')
    END
  {% endcall %}
{% endmacro %}
