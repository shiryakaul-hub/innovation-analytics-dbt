{{ config(materialized='table') }}

SELECT

    initiative_id,

    initiative_name,

    current_stage,

    domain,

    portfolio_fy,

    snapshot_start_date,

    snapshot_end_date,

    npv_mid,

    project_schedule_status,

    project_cost_status

FROM {{ ref('rpt_initiatives_snapshot') }}
