{{ config(materialized='table') }}

SELECT

    initiative_id,
    initiative_name,

    current_stage,

    domain,

    portfolio_fy,

    npv_low,
    npv_mid,
    npv_high,

    project_schedule_status,
    project_cost_status,

    business_adoption,
    economic_viability,

    dbt_valid_from AS snapshot_start_date,

    COALESCE(
        dbt_valid_to,
        CURRENT_DATE()
    ) AS snapshot_end_date,

    CASE
        WHEN dbt_valid_to IS NULL
            THEN TRUE
        ELSE FALSE
    END AS is_current_record

FROM {{ ref('snapshot_initiatives') }}
