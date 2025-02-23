{% macro date_in_moscow(ts_col) %}
  ({{ ts_col }} at time zone 'Europe/Moscow')::date
{% endmacro %}