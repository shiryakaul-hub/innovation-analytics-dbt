{% macro classify_stage_transition(
    previous_stage,
    current_stage
) %}

CASE

    WHEN {{ previous_stage }} IS NULL
        THEN 'NEW'

    WHEN {{ previous_stage }} = {{ current_stage }}
        THEN 'STABLE'

    WHEN {{ current_stage }} = 'Completed'
        THEN 'COMPLETED'

    WHEN {{ current_stage }} = 'Terminated'
        THEN 'TERMINATED'

    ELSE 'PROGRESSED'

END

{% endmacro %}
