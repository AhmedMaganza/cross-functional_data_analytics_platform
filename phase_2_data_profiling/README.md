# Phase 2: Data Profiling and Architecture
Phase 2 focuses on understanding and validating the data available in the Cross-Functional Data Analytics Platform before transforming it for analysis. Using **BigQuery and SQL**, the data will be profiled to identify data-quality issues, validate relationships, understand table grain, and assess analytical readiness.

## Objectives

* Understand the structure and grain of the warehouse tables.
* Profile data completeness, uniqueness, validity, and consistency.
* Identify data-quality issues and anomalies.
* Validate fact-to-dimension relationships.
* Assess whether the data can support the analytical requirements defined in Phase 1.
* Translate profiling results into technical decisions for the next phase.

## Data Warehouse
The warehouse currently contains:  
- **Shared Dimensions**
`dim_dates` · `dim_locations` · `dim_customers`  
- **Domain Facts** `trade_and_retail` · `finance_ledger` · `hr_employees` · `hospitality_ops` · `contracting_mgmt` · `marketing_campaigns` · `customer_service_tickets`

The warehouse is profiled broadly, while the **Sales & Retail domain** will be the primary focus of the downstream technical implementation.

<img width="348" height="581" alt="dataset_overview" src="snapshots/dataset_overview.png" />


## Profiling Workflow

### 1. Schema & Data Inventory ✔
Inspect tables, columns, data types, row counts, and candidate keys using BigQuery metadata and SQL. **[ [View Step Details](https://github.com/AhmedMaganza/cross-functional_data_analytics_platform/tree/main/phase_2_data_profiling/documentation/01_schema_data_inventory.md) ]**  

### 2. Data Profiling ✔
Analyze NULLs, duplicates, distinct values, distributions, ranges, and date coverage. **[ [View Step Details](https://github.com/AhmedMaganza/cross-functional_data_analytics_platform/tree/main/phase_2_data_profiling/documentation/02_data_profiling.md) ]**  

### 3. Relationship Validation ✔
Validate fact-to-dimension relationships, foreign keys, orphan records, cardinality, and table grain. **[ [View Step Details](https://github.com/AhmedMaganza/cross-functional_data_analytics_platform/tree/main/phase_2_data_profiling/documentation/03_relationship_validation.md) ]** 

### 4. Analytical Readiness ⏳
Determine whether the data can support the business questions and KPIs established in Phase 1.

### 5. Findings & Decisions ⏳
Document significant issues, their analytical impact, and the required technical action.  

## Repository Structure for Phase 2
```text
├── phase_2_data_profiling/
|       ├── README.md
|       |
│       ├── sql/
│       │   ├── 01-Schema-Assessment.sql
│       │   ├── 01-Schema-Assessment_null-check.sql
│       │   ├── 02-Data-Profiling_tables_volume.sql
│       │   └── 02-Data-Profiling_unique_keys.sql
|       |
│       ├── documentation/
│       |   ├── 01_schema_data_inventory.md
│       |   └── 02_data_profiling.md
|       |
│       └── snapshots/
└──         ├── ...
```