{{
  config(
    materialized='ephemeral'
  )
}}

{% set configured_schemas = get_configured_schemas() %}

with filtered_information_schema_tables as (

    {% if configured_schemas != [] %}
        {{ query_different_schemas(get_tables_from_information_schema, configured_schemas) }}
    {% else %}
        {{ empty_table([('full_table_name', 'string'), ('database_name', 'string'), ('schema_name', 'string'), ('table_name', 'string')]) }}
    {% endif %}
)

select *
from filtered_information_schema_tables
where schema_name is not null
