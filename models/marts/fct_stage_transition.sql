{{ config(materialized='table') }}

WITH stage_history AS (

    SELECT

        initiative_id,

        initiative_name,

        snapshot_start_date,

        current_stage,

        LAG(current_stage) OVER (

            PARTITION BY initiative_id

            ORDER BY snapshot_start_date

        ) AS previous_stage

    FROM {{ ref('rpt_initiatives_snapshot') }}

)

SELECT

    initiative_id,

    initiative_name,

    snapshot_start_date AS transition_date,

    previous_stage,

    current_stage,

    {{ classify_stage_transition(
        'previous_stage',
        'current_stage'
    ) }}

        AS transition_type

FROM stage_history
