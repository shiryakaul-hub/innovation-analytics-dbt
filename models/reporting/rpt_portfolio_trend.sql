SELECT

    as_of_date,

    SUM(npv_mid) AS portfolio_npv,

    SUM(npv_mid)
        OVER (
            ORDER BY as_of_date
        )
        AS cumulative_portfolio_npv

FROM {{ ref('fct_initiative_asof') }}

GROUP BY as_of_date
