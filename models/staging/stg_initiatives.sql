{{ config(materialized='view') }}

SELECT

    initiative_id,

    initiative_name,

    archived,

    {{ standardise_stage('current_stage_name') }}
        AS current_stage,

    parent_name,

    {{ get_domain('parent_name') }}
        AS domain,

    owner_name,

    description,

    schedule_status,

    financial_status,

    overall_status,

    created_at,

    updated_at

FROM {{ source('source_system', 'innovation_initiatives') }}

WHERE archived = FALSE
