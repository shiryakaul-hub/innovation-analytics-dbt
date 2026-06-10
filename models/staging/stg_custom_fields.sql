{{ config(materialized='view') }}

WITH latest_records AS (

    SELECT

        initiative_id,

        custom_field_id,

        custom_field_value,

        snapshot_date,

        ROW_NUMBER() OVER (

            PARTITION BY
                initiative_id,
                custom_field_id

            ORDER BY
                snapshot_date DESC

        ) AS rn

    FROM {{ source('source_system', 'innovation_custom_fields') }}

)

SELECT

    initiative_id,

    custom_field_id,

    custom_field_value,

    snapshot_date

FROM latest_records

WHERE rn = 1
