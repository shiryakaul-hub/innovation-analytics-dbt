{% macro get_domain(parent_column) %}

CASE

    WHEN {{ parent_column }} IS NULL
        THEN NULL

    WHEN TRIM(TO_VARCHAR({{ parent_column }}))
        LIKE '1%'
        THEN 'Operations'

    WHEN TRIM(TO_VARCHAR({{ parent_column }}))
        LIKE '2%'
        THEN 'Technology'

    WHEN TRIM(TO_VARCHAR({{ parent_column }}))
        LIKE '3%'
        THEN 'People'

    WHEN TRIM(TO_VARCHAR({{ parent_column }}))
        LIKE '4%'
        THEN 'Finance'

    WHEN TRIM(TO_VARCHAR({{ parent_column }}))
        LIKE '5%'
        THEN 'Governance'

    ELSE 'Other'

END

{% endmacro %}
