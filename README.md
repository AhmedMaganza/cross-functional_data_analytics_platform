# Cross-Functional Data Analytics Platform
*A data warehousing and business intelligence solution built with Google BigQuery and visualized through Looker Studio.*

## Project Overview

Modern organizations generate data across multiple business functions, often leaving information fragmented across departmental systems and reporting tools. This fragmentation creates challenges in consolidating data, establishing consistent metrics, and producing reliable management reporting.

This project demonstrates the **technical implementation of a cross-functional data analytics platform**, with a primary focus on **Google BigQuery and Looker Studio**. It emphasizes **technical implementation, SQL development, data modeling, analytical querying, and BI visualization**, rather than providing a complete demonstration of the broader BI consulting lifecycle.

## Project Purpose
The primary objective of this project is to demonstrate practical technical skills in:

* Designing and working with a data warehouse in **Google BigQuery**.
* Loading and organizing business data for analytical use.
* Profiling and assessing datasets before transformation.
* Writing SQL for data transformation and analytical modeling.
* Creating reusable analytical views and queries.
* Implementing business metrics and KPI calculations in SQL.
* Connecting analytical data to **Looker Studio**.
* Designing interactive BI dashboards and visualizations.
* Translating analytical results into clear business reporting.

The business requirements and analytical context provide the foundation for the technical implementation, while **BigQuery and Looker Studio are the primary technologies demonstrated by the project**.

## Business Context

The project is based on a fictional multi-sector enterprise operating across:

* Trade & Retail
* Hospitality
* Contracting
* Corporate Services

The enterprise is represented through seven key business domains:

| Domain                        | Project Scope                                 |
| -------------------------- | --------------------------------------------- |
| **Sales & Retail**         | **Selected for the technical implementation** |
| **Projects & Contracting** | Enterprise context                   |
| **Operations**             | Enterprise context                   |
| **Marketing**              | Enterprise context                   |
| **Customer Support**       | Enterprise context                   |
| **Finance**                | Enterprise context                   |
| **Human Resources**        | Enterprise context                   |

The initial project-framing establishes the business context, stakeholders, reporting needs, business questions, and KPI requirements necessary to define the technical solution.

The project does not attempt to demonstrate the full BI methodology across all domains. Instead, **Sales & Retail is used as the primary implementation domain for demonstrating the technical capabilities of the platform**.

## Implementation Scope

The main focus of the project is the implementation of the technical solution using:

**Google BigQuery**

* Data profiling
* Data quality assessment
* Data modeling
* SQL transformations
* Analytical views
* KPI calculations
* Analytical queries

**Looker Studio**

* BigQuery connectivity
* Dashboard development
* KPI visualization
* Interactive filtering
* Business performance reporting
* Data storytelling through visualization

## Project Roadmap
| Phase                                  | Primary Focus                     | Status         |
 | -------------------------------------------- | --------------------------------- | -------------- |
| **Phase 1: Project Framing and Business Requirements.</br>[[View Documentation](phase_1_project_framing)]**  | **Business & BI Context**   | ✔ Completed |
| **Phase 2: BigQuery Data Profiling and Architecture.</br>[[View Documentation](phase_2_data_profiling)]**  | **BigQuery / SQL**      | ✔ Completed   |
| **Phase 3: BigQuery SQL Modeling and Data Transformation.</br>[[View Documentation](phase_3_bigquery_sql_modeling)]**  | **BigQuery / SQL**    | ⏳ In Progress  |
| Phase 4: Deep-Dive SQL Analysis.  | **SQL / Analytics**     | ⏳ Pending  |
| Phase 5: Looker Studio Dashboard Engineering.          | **Looker Studio**                 | ⏳ Pending  |
| Phase 6: Final Insights, Recommendations. | **Technical Demonstration & Results** | ⏳ Pending    |

> Each phase has its own README containing the specific work, exercises, decisions, and outputs for that stage.

## Project Positioning
This project is intentionally **technical in focus**.
The business context and initial BI requirements provide the realistic foundation for the solution, but the project is primarily intended to demonstrate the ability to:  
> **Take business requirements and data, build an analytical solution in BigQuery using SQL, and deliver the resulting information through Looker Studio.**

Broader BI practices such as comprehensive business discovery, process discovery, KPI governance, requirements engineering, and enterprise BI methodology are outside the primary focus of this project and are demonstrated in greater depth through other projects.

## Repository Structure

```text

├── phase_1_project_framing/
├── phase_2_data_profiling/
│       ├── sql/
│       │       ├── 01-Schema-Assessment_null_check.sql
│       │       ├── 01-Schema-Assessment.sql
│       │       ├── 02-Data-Profiling_categorical_profiling.sql
│       │       ├── 02-Data-Profiling_date_profiling.sql
│       │       ├── 02-Data-Profiling_null-check.sql
│       │       ├── 02-Data-Profiling_numeric-profiling.sql
│       │       ├── 02-Data-Profiling_tables_volume.sql
│       │       ├── 02-Data-Profiling_unique_keys.sql
│       │       ├── 03-Relationship-Validation_cardinality.sql
│       │       └── 03-Relationship-Validation_foreign_key_integrity.sql
|       |
│       ├── documentation/
│       |       ├── 01_schema_data_inventory.md
│       |       ├── 02_data_profiling.md
│       |       ├── 03_relationship_validation.md
│       |       └── 04_analytical_readiness.md
|       |
│       └── snapshots/
|               ├── ...
├── phase_3_sql_transformations/
├── phase_4_deep_dive_analytics/
├── phase_5_dashboarding/
├── phase_6_final_reporting/
├── dashboards/
|        ├── ...
├── datasets/
|         ├── ...
└── README.MD
```

>[!Note]
> **This project is actively being developed. The root README provides the project context, scope, technical focus, and navigation. Detailed work and implementation are documented within the individual phase README files.**
