{{ config(materialized='table') }}

WITH dates AS (

    SELECT

        DATEADD(
            DAY,
            ROW_NUMBER() OVER(ORDER BY seq4()) - 1,
            '2024-01-01'
        ) AS date_day

    FROM TABLE(GENERATOR(ROWCOUNT => 3650))

)

SELECT

    date_day,

    YEAR(date_day) AS year,

    MONTH(date_day) AS month,

    DAY(date_day) AS day,

    QUARTER(date_day) AS quarter,

    CASE
        WHEN MONTH(date_day) >= 7
            THEN YEAR(date_day) + 1
        ELSE YEAR(date_day)
    END AS financial_year

FROM dates
