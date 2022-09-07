{% macro current_timestamp_utc_as_string(time_format=elementary.get_config_var('time_format')) %}
    {% set current_timestamp_as_string = modules.datetime.datetime.utcnow().strftime(time_format) %}
    {{ return(current_timestamp_as_string) }}
{% endmacro %}
