{% snapshot snapshot_initiatives %}

{{
    config(

        target_schema='snapshots',

        unique_key='initiative_id',

        strategy='check',

        check_cols=[
            'current_stage',
            'npv_low',
            'npv_mid',
            'npv_high',
            'project_schedule_status',
            'project_cost_status',
            'business_adoption',
            'economic_viability'
        ]

    )
}}

SELECT *

FROM {{ ref('int_initiatives_enriched') }}

{% endsnapshot %}
