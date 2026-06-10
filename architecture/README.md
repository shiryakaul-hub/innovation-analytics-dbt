1. Raw data
2. Staging / cleaning
3. Joined staging model
4. dbt snapshot
5. BI reporting tables
6. Fact and dimension tables
7. Business-case table: stage transition analysis

Say your API stores columns from source table and randomly changing custom fields, that incur changes in name or datatype every now and then. We need to join the two to make an orginal daily export. Hardcoding these cutom fields will allow us to cater to the changes that occur ever so often and handle them inside dbt, instead of dropping and creatinf the table once again.


models/
├── staging/
│   ├── stg_initiatives.sql
│   ├── stg_custom_fields.sql
│   └── int_initiatives_enriched.sql
│
├── snapshots/
│   └── snapshot_initiatives.sql
│
├── marts/
│   ├── dim_initiative.sql
│   ├── dim_date.sql
│   ├── fct_initiative_daily_asof.sql
│   └── fct_stage_transitions.sql
│
└── reporting/
    ├── rpt_portfolio_current.sql
    ├── rpt_portfolio_historical.sql
    └── rpt_stage_performance.sql
