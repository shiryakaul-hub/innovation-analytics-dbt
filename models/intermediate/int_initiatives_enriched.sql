{{ config(materialized='table') }}

WITH pivoted_custom_fields AS (

    SELECT

        initiative_id,

        MAX(CASE WHEN custom_field_id = '101' THEN custom_field_value END)
            AS portfolio_fy,

        MAX(CASE WHEN custom_field_id = '102' THEN custom_field_value END)
            AS strategic_alignment,

        MAX(CASE WHEN custom_field_id = '103' THEN custom_field_value END)
            AS safety_rating,

        MAX(CASE WHEN custom_field_id = '104' THEN TRY_TO_DECIMAL(custom_field_value, 18, 4) END)
            AS business_adoption,

        MAX(CASE WHEN custom_field_id = '105' THEN TRY_TO_DECIMAL(custom_field_value, 18, 4) END)
            AS economic_viability,

        MAX(CASE WHEN custom_field_id = '106' THEN custom_field_value END)
            AS project_schedule_status,

        MAX(CASE WHEN custom_field_id = '107' THEN custom_field_value END)
            AS project_cost_status,

        MAX(CASE WHEN custom_field_id = '108' THEN TRY_TO_NUMBER(custom_field_value) END)
            AS npv_low,

        MAX(CASE WHEN custom_field_id = '109' THEN TRY_TO_NUMBER(custom_field_value) END)
            AS npv_mid,

        MAX(CASE WHEN custom_field_id = '110' THEN TRY_TO_NUMBER(custom_field_value) END)
            AS npv_high,

        MAX(CASE WHEN custom_field_id = '111' THEN TRY_TO_DATE(custom_field_value) END)
            AS into_discovery_date,

        MAX(CASE WHEN custom_field_id = '112' THEN TRY_TO_DATE(custom_field_value) END)
            AS into_assessment_date,

        MAX(CASE WHEN custom_field_id = '113' THEN TRY_TO_DATE(custom_field_value) END)
            AS into_planning_date,

        MAX(CASE WHEN custom_field_id = '114' THEN TRY_TO_DATE(custom_field_value) END)
            AS into_implementation_date,

        MAX(CASE WHEN custom_field_id = '115' THEN custom_field_value END)
            AS valuation_level,

        MAX(CASE WHEN custom_field_id = '116' THEN custom_field_value END)
            AS safety_target

    FROM {{ ref('stg_custom_fields') }}

    GROUP BY initiative_id

),

enriched AS (

    SELECT

        i.initiative_id,
        i.initiative_name,
        i.current_stage,
        i.parent_name,
        i.domain,
        i.owner_name,
        i.description,
        i.schedule_status,
        i.financial_status,
        i.overall_status,
        i.created_at,
        i.updated_at,

        p.portfolio_fy,
        p.strategic_alignment,
        p.safety_rating,
        p.business_adoption,
        p.economic_viability,
        p.project_schedule_status,
        p.project_cost_status,
        p.npv_low,
        p.npv_mid,
        p.npv_high,
        p.into_discovery_date,
        p.into_assessment_date,
        p.into_planning_date,
        p.into_implementation_date,
        p.valuation_level,
        p.safety_target,

        {{ get_fy('p.into_planning_date') }}
            AS fy_planning,

        {{ get_fy('p.into_implementation_date') }}
            AS fy_implementation

    FROM {{ ref('stg_initiatives') }} i

    LEFT JOIN pivoted_custom_fields p
        ON i.initiative_id = p.initiative_id

)

SELECT *
FROM enriched
