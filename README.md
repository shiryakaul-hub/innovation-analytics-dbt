# innovation-analytics-dbt
Building data models and data transformation code for storing history of innovation portfolios and analysing it.



# Innovation Analytics Platform

This project demonstrates the design and implementation of a historical analytics platform for tracking innovation initiatives over time. The solution leverages dbt, Snowflake, SQL, and Power BI to transform operational data into a scalable dimensional model that supports portfolio reporting, trend analysis, and stage transition tracking.

The platform addresses a common business challenge where source systems only retain the latest state of an initiative, limiting the ability to analyse historical performance. By implementing snapshot-based historical tracking and as-of reporting, the solution enables users to understand how initiatives progress through their lifecycle, identify bottlenecks, measure portfolio health, and evaluate value delivery over time.

## Key Features

- Historical reporting using dbt snapshots
- Dimensional modelling (facts and dimensions)
- Stage transition analysis (progressed, regressed, completed, stable)
- Portfolio performance and value tracking
- Data quality and transformation testing
- Power BI dashboards for self-service analytics
