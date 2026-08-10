# Phase 2: Data Profiling & Architecture

## 📌 Phase Overview
Phase 2 establishes the data foundation for the analytics platform by loading the source datasets into **Google BigQuery**, inspecting their structure, profiling key fields, validating logical relationships, and defining the analytical data architecture.

The objective of this phase is to understand the available data and assess its readiness for the SQL modeling and analytical stages that follow.

The profiling work is implemented through dedicated **BigQuery SQL scripts**, covering schema inspection, dimension-key health, fact-to-dimension integrity, and selected data-quality rules.

## 1. BigQuery Dataset Setup

The source CSV files were loaded into **Google BigQuery** to establish the analytical dataset used throughout the project.

A dedicated dataset, `enterprise_dw`, was created to organize the enterprise data model. It contains **10 tables**, consisting of three shared dimension tables and seven domain-specific tables.

<img width="348" height="581" alt="dataset_overview" src="https://github.com/user-attachments/assets/cf7377eb-77c9-4a74-ac27-839b17eff85d" />

### Dataset Structure

| Table | Type |
| :--- | :--- |
| `dim_dates` | Shared Dimension |
| `dim_locations` | Shared Dimension |
| `dim_customers` | Shared Dimension |
| `trade_and_retail` | Domain Fact |
| `finance_ledger` | Domain Fact |
| `hr_employees` | Domain Fact |
| `hospitality_ops` | Domain Fact |
| `contracting_mgmt` | Domain Fact |
| `marketing_campaigns` | Domain Fact |
| `customer_service_tickets` | Domain Fact |

The BigQuery dataset provides the working environment for the profiling, validation, transformation, and analytical activities that follow.

## 2. Data Profiling & Quality Assessment

The data profiling process was designed to assess the structure, key integrity, relationships, and selected business-data quality conditions across the `enterprise_dw` dataset.

The assessment was organized into four validation areas:

1. Schema and metadata inspection
2. Dimension primary-key health
3. Fact-to-dimension foreign-key integrity
4. Data-quality and null audits

### A. Schema Inspection

The schema inspection was performed using BigQuery metadata through `INFORMATION_SCHEMA.COLUMNS`, while table-level row counts and storage information were retrieved from the dataset metadata.

The resulting metadata provides the structural foundation for understanding the available analytical tables before transformation.

**SQL:** [`schema_inspection_query.sql`](../sql/01_data_profiling/schema_inspection_query.sql)

<img width="783" height="476" alt="schema_inspection_query" src="https://github.com/user-attachments/assets/d9e4a582-be40-4065-bbc2-f46938f998f2" />


### B. Dimension Primary-Key Health

The shared dimension tables were profiled to assess the health of their logical primary keys.

The checks include:

- Total key values
- Distinct key values
- Null key values

The analysis covers:

- `dim_dates` → `date_id`
- `dim_customers` → `customer_id`
- `dim_locations` → `location_id`

This provides an initial assessment of whether the dimension keys can reliably support analytical joins.

**SQL:** [`dim_tables_primary-key-healthsql.sql`](../sql/01_data_profiling/dim_tables_primary-key-healthsql.sql)

<img width="915" height="667" alt="dim_tables_check" src="https://github.com/user-attachments/assets/657b01d4-70c3-4a3e-bd49-708c5ccc4fa0" />


### C. Fact-to-Dimension Referential Integrity

Foreign-key integrity checks were designed to identify **orphan records**.

An orphan record occurs when a fact-table foreign key contains a value that does not have a corresponding record in the expected dimension.

The validation covers the following logical relationships:

| Fact Table | Dimension | Foreign Key |
| :--- | :--- | :--- |
| `trade_and_retail` | `dim_customers` | `customer_id` |
| `trade_and_retail` | `dim_locations` | `location_id` |
| `finance_ledger` | `dim_locations` | `location_id` |
| `hr_employees` | `dim_locations` | `location_id` |
| `hospitality_ops` | `dim_locations` | `location_id` |
| `contracting_mgmt` | `dim_customers` | `customer_id` |
| `customer_service_tickets` | `dim_customers` | `customer_id` |

The SQL returns an `orphan_count` for each tested fact-to-dimension relationship.

**SQL:** [`fact_tables_foreign_key_integrity.sql`](../sql/01_data_profiling/fact_tables_foreign_key_integrity.sql)

<img width="1067" height="748" alt="fact_tables_audit" src="https://github.com/user-attachments/assets/9d829462-3074-4f39-ad9f-354c779711c8" />


### D. Data-Quality & Null Audits

Additional business-rule checks were implemented to identify potentially invalid or incomplete records.

The checks include:

| Table | Validation Examples |
| :--- | :--- |
| `trade_and_retail` | Null transaction IDs; missing or non-positive `net_revenue` |
| `finance_ledger` | Null ledger IDs; missing or non-positive `actual_amount` |
| `hr_employees` | Null employee IDs; invalid salary values; unexpected employment status |
| `hospitality_ops` | Null operation IDs; utilized capacity exceeding total capacity; missing fulfillment status |
| `contracting_mgmt` | Null project IDs; missing or non-positive actual cost; missing completion status |
| `marketing_campaigns` | Null campaign IDs; missing or non-positive ad spend |
| `customer_service_tickets` | Null ticket IDs; invalid CSAT scores; unexpected ticket status |

These checks provide an initial layer of data-quality assessment before the datasets are used for analytical modeling.

**SQL:** [`data-quality_and_null_audits.sql`](../sql/01_data_profiling/data-quality_and_null_audits.sql)

<img width="947" height="765" alt="data_qulaity_null_audits" src="https://github.com/user-attachments/assets/b960db79-1f84-462e-9299-97ccdb89eb64" />

## 3. Enterprise Data Warehouse Architecture

Based on the enterprise business context and the available datasets, the analytical model is structured around shared dimensions and domain-specific tables.

The three shared dimensions are:

`dim_dates` 
`dim_locations` 
`dim_customers` 

These dimensions are intended to provide reusable analytical reference points across multiple business domains.

The resulting design follows a conformed dimensional / star-schema approach, where common dimensions can support consistent analysis across domain-specific fact tables.

Logical Entity Relationships

The following ERD represents the logical relationships defined for the analytical model:
<img width="1536" height="1024" alt="ERD" src="https://github.com/user-attachments/assets/5886b060-9b7d-42a2-ab0f-e690fd5357cb" />

