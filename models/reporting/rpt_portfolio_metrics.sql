{{ config(materialized='table') }}

SELECT

    current_stage,

    COUNT(*) AS initiative_count,

    SUM(npv_mid) AS portfolio_npv,

    AVG(business_adoption) AS avg_business_adoption,

    AVG(economic_viability) AS avg_economic_viability

FROM {{ ref('rpt_portfolio_current') }}

GROUP BY current_stage
