{{ config(materialized='table') }}

SELECT *

FROM {{ ref('rpt_initiatives_snapshot') }}

WHERE is_current_record = TRUE
