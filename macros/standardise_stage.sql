{% macro standardise_stage(column_name) %}

CASE
    WHEN {{ column_name }} IS NULL THEN NULL

    WHEN LOWER(TRIM({{ column_name }}))
        LIKE 'phase %:%'

        THEN TRIM(
            SPLIT_PART(
                {{ column_name }},
                ':',
                2
            )
        )

    ELSE TRIM({{ column_name }})

END

{% endmacro %}
