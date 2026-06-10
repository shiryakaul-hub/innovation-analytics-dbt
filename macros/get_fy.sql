{% macro get_fy(date_column) %}

CASE

    WHEN {{ date_column }} IS NULL
        THEN NULL

    WHEN MONTH({{ date_column }}) >= 7
        THEN YEAR({{ date_column }}) + 1

    ELSE YEAR({{ date_column }})

END

{% endmacro %}
