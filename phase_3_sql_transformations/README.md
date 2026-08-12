# Phase 3: BigQuery SQL Modeling & Data Transformation

## Phase Overview

Phase 3 establishes the analytical transformation layer within **Google BigQuery**.

Building on the data profiling and architecture established in Phase 2, this phase transforms the raw `trade_and_retail` data into a structured, business-ready analytical view that can support downstream analysis and visualization.

The primary objective of this phase is to demonstrate practical **BigQuery SQL modeling and transformation techniques**, including CTEs, dimensional joins, calculated business metrics, window functions, and analytical classifications.

For this project, the **Sales & Retail domain** is selected as the technical implementation domain. The same architectural concepts could be applied to other business domains, but implementing them separately is outside the scope of this technical demonstration.

## Implementation Scope

The enterprise data model contains seven business domains:

| Domain | Source Table |
| :--- | :--- |
| 🛒 **Sales & Retail** | **`trade_and_retail`** |
| *Finance* | `finance_ledger` |
| *Human Resources* | `hr_employees` |
| *Operations* | `hospitality_ops` |
| *Projects & Contracting* | `contracting_mgmt` |
| *Marketing* | `marketing_campaigns` |
| *Customer Support* | `customer_service_tickets` |

Phase 3 implements the transformation layer for **Sales & Retail ONLY**.

The selected domain provides a representative end-to-end example of how raw transactional data can be transformed into a reusable analytical view in BigQuery.

## Analytical Transformation Workflow

The Sales & Retail transformation follows a structured analytical workflow:

**Source Tables → Data Preparation → Dimension Integration → KPIs Calculations → Window-Based Analytics → Analytical View → Dashboarding**

The resulting view is designed to act as a reusable analytical layer between the raw warehouse tables and analytical or visualization workloads.


## SQL Modeling Approach

The transformation logic is implemented using modular **Common Table Expressions (CTEs)**.

The CTE-based structure separates transformation steps into logical stages, making the SQL easier to read, validate, maintain, and extend.

The implementation demonstrates:

* Common Table Expressions
* Dimension joins
* Conditional logic using `CASE`
* Aggregate calculations
* Window functions
* New vs. repeat customer classification
* Running cumulative calculations
* Margin calculations
* Discount-rate calculations
* Date-based analytical attributes


## Tables Integration

The Sales & Retail view integrates the transactional fact table with the shared enterprise dimensions established during Phase 2.

### Source Tables

| Table              | Role      | Purpose                                 |
| :----------------- | :-------- | :-------------------------------------- |
| `trade_and_retail` | Fact      | Core sales and transaction-level data   |
| `dim_dates`        | Dimension | Date attributes and time-based analysis |
| `dim_locations`    | Dimension | Location and regional analysis          |
| `dim_customers`    | Dimension | Customer-level analysis                 |

The use of shared dimensions maintains consistency with the analytical architecture established in Phase 2.

## Analytical View

The primary analytical view created in this phase is:

**`vw_sales_performance`**

The view encapsulates the transformation logic required to convert transaction-level data into a reusable analytical dataset.

### Key Analytical Features

The view includes calculated and derived attributes supporting:

| Analytical Area     | Example                                |
| :------------------ | :------------------------------------- |
| Revenue             | Gross and Net Revenue                  |
| Profitability       | Gross / Net Margin calculations        |
| Discounts           | Effective Discount Rate                |
| Customer Behavior   | New vs. Repeat Customer classification |
| Order Sequence      | Customer order numbering               |
| Time Analysis       | Date-based analytical attributes       |
| Cumulative Analysis | Revenue totals                 |

These calculations are performed within the BigQuery view so that analytical queries and dashboards can consume a consistent business-ready dataset.

## SQL Implementation

The SQL implementation for this phase is maintained separately from the phase documentation.  
```text
sql/
├── 02_transformations/
│   └── vw_sales_performance.sql
```
[**`01_vw_sales_performance.sql`**](../sql/02_transformations/01_vw_sales_performance.sql): This script contains the BigQuery SQL required to create the `vw_sales_performance` analytical view.




## Relationship to Other Project Phases

Phase 3 builds directly on the outputs of Phase 1 and Phase 2:

```text
Phase 1
Business & Analytical Requirements
│
▼
Phase 2
Data Profiling & Architecture
│
▼
Phase 3
BigQuery SQL Modeling
│
▼
`vw_sales_performance`
│
├──────────────► Phase 4
│                Deep-Dive Analytics
│
└──────────────► Phase 5
                 Looker Studio Dashboard
```

The implementation demonstrates how a profiled warehouse dataset can be transformed into a reusable analytical layer using BigQuery SQL.
