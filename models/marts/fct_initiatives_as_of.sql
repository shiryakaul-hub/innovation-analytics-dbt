{{ config(materialized='table') }}

WITH date_spine AS (

    SELECT

        date_day AS as_of_date

    FROM {{ ref('dim_date') }}

),

initiative_history AS (

    SELECT *

    FROM {{ ref('rpt_initiatives_snapshot') }}

),

expanded AS (

    SELECT

        d.as_of_date,

        h.initiative_id,

        h.initiative_name,

        h.current_stage,

        h.domain,

        h.portfolio_fy,

        h.npv_low,

        h.npv_mid,

        h.npv_high,

        h.project_schedule_status,

        h.project_cost_status,

        h.business_adoption,

        h.economic_viability,

        h.snapshot_start_date,

        h.snapshot_end_date

    FROM date_spine d

    INNER JOIN initiative_history h

        ON d.as_of_date
            BETWEEN h.snapshot_start_date
            AND h.snapshot_end_date

)

SELECT *

FROM expanded
