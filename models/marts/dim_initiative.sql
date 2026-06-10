{{ config(materialized='table') }}

SELECT

    initiative_id,

    initiative_name,

    domain,

    owner_name,

    portfolio_fy,

    strategic_alignment,

    safety_target,

    valuation_level,

    created_at

FROM {{ ref('rpt_portfolio_current') }}
