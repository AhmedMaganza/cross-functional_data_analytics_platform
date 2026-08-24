# Phase 3: BigQuery SQL Modeling & Data Transformation

Phase 3 transforms the validated **Sales & Retail** warehouse data into a clean, reusable analytical layer using **BigQuery SQL**.

The objective is to demonstrate practical skills in SQL, analytical data modeling, business logic, and data validation, while preparing the data for the Looker Studio dashboard.

**Warehouse Tables → BigQuery SQL Transformations → Analytical Layer → Looker Studio**

## Scope

Phase 3 focuses only on the Sales & Retail domain using:

* `trade_and_retail`
* `dim_dates`
* `dim_customers`
* `dim_locations`

Source warehouse tables remain unchanged.

## Phase 3 Workflow

### Step 1: Analytical Layer Design ✔

Define the analytical layer based on the business requirements and dashboard requirements established in Phase 1.

Key activities:

* Review required source fields
* Confirm analytical grain
* Map KPIs and business questions to analytical outputs
* Determine the views required by the Looker Studio dashboard
* Define transformation and business logic

**[[View Documentation](documentation/01_analytical_layer.md)]**



### Step 2: Build the Base Analytical View ✔

Create the foundational transaction-level analytical view:

`vw_sales_analysis`

Key activities:

* Enriches the sales transactions by joining fact and dimension data
* Select and standardize required fields
* Calculate reusable metrics
* Implement core sales business logic

**[[View Documentation](documentation/02_base-analytical_view.md)]**


### Step 3: Build Dashboard-Ready Analytical Views (⏳In Progress)

Create only the analytical views required to support the agreed Looker Studio dashboard.

Potential outputs include:

* `vw_sales_monthly`
* `vw_customer_analysis`
* `vw_location_analysis`

The final views will be determined during Step 1 based on the reporting requirements.

Key techniques may include:

* CTEs
* Aggregations
* Window functions
* Rankings
* Growth calculations
* Contribution analysis
* Customer analytics

**[[View Documentation](documentation/03_dashboard_ready_views.md)]**


### Step 4: Analytical Layer Validation (⏳Pending)

Validate that the analytical views correctly represent the source data and business logic.

Validation will focus on **transformation accuracy**, rather than repeating the data-quality profiling already completed in Phase 2.

Key checks include:

* Revenue reconciliation
* Quantity reconciliation
* Transaction reconciliation
* Customer reconciliation
* Date coverage
* Grain validation
* Aggregation consistency
* Source-to-output consistency

**[[View Documentation](documentation/04_analytical_layer_validation.md)]**

## Phase 3 Repo Structure
```text

├── phase_3_bigquery_sql_modeling/
│       ├── sql/
│       │       ├── 02_checks_sales_analysis_base.sql
│       │       ├── 02_sql_sales_analysis_base.sql
│       │       ├── 03_1_sql_vw_sales_monthly.sql
│       │       └── 03_1_validation_vw_sales_monthly.sql
|       |
│       ├── documentation/
│       |       ├── 01_analytical_layer.md
│       |       ├── 02_base-analytical_view.md
│       |       ├── 03_dashboard_ready_views.md
│       |       |        ├── 03_1_vw_sales_monthly.md
│       |       |        ├── 03_2_vw_customer_analysis.md
│       |       |        ├── 03_3_vw_location_analysis.md
│       |       └── 04_analytical_layer_validation.md
│       └── snapshots/
|               ├── ...
```

