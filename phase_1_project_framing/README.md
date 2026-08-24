# 🧭 Phase 1: Project Framing & Business Requirements

## Phase Overview

Phase 1 establishes the **enterprise framing, business scope, target audience, and analytical requirements** for the analytics platform.

The objective of this phase is to define the business context across seven core domains and translate key stakeholder information needs into business questions, candidate KPIs, and underlying data sources.

This phase provides the business foundation for the technical implementation that follows.

## Business Context & Scenario

* **Organization:** A multi-sector entity spanning trade, retail, hospitality, contracting, and corporate services.
* **The Challenge:** Operational, customer, and financial data reside in disconnected departmental systems. Executive leadership lacks cross-functional visibility, resulting in fragmented reporting, delayed strategic execution, and hidden operational friction.
* **The Approach:** Establish a centralized analytical environment in **Google BigQuery** (`enterprise_dw`) and use **Looker Studio** as the BI visualization layer for performance reporting.

## Stakeholder Analysis & Requirements

| Stakeholder Persona                | Primary Business Objective                                                            |                                                                                       
| :--------------------------------- | :------------------------------------------------------------------------------------ | 
| **Executive Leadership (C-Suite)** | High-level business performance, profitability, and enterprise growth.                |
| **Departmental Managers**          | Operational execution, SLA compliance, team productivity, and customer retention.     |
| **Data & Analytics Team**          | Maintain scalable data models, ensure metric consistency, and enable ad-hoc querying. | 

## Domain Matrix & Analytical Mapping

Phase 1 establishes the analytical scope across the seven business domains by mapping each domain to its core data source, key business questions, and candidate KPIs.
| Domain                     | Core Table(s)              | Key Business Questions                                                                                              | Candidate KPIs / Metrics                                                         |
| -------------------------- | -------------------------- | ------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | 
| **Sales & Retail**         | `trade_and_retail`         | How are sales performing across products, customers, locations, and time? Which products and regions drive revenue? | Revenue, Order Volume, AOV, Gross Profit, Gross Margin %, Customer Retention Rate%                  |
| **Finance**                | `finance_ledger`           | How is actual financial performance tracking against expectations?                                                  | Revenue, Gross Margin %, Net Margin %, Budget vs. Actual                    |
| **Human Resources**        | `hr_employees`             | What is the workforce structure and how is it changing?                                                             | Headcount, Turnover Rate %, New Hires, Average Tenure                        |
| **Operations**             | `hospitality_ops`          | How efficiently are operations performing and where are bottlenecks occurring?                                      | Capacity Utilization %, Fulfillment Time, Throughput, On-Time Completion %   | 
| **Projects & Contracting** | `contracting_mgmt`         | Are projects being delivered on time and within budget?                                                             | Project Completion %, Schedule Variance, Cost Variance, Budget Utilization % |
| **Marketing**              | `marketing_campaigns`      | Which campaigns generate the strongest results and how efficiently is spend being used?                             | Marketing Spend, Conversion Rate %, CAC, ROAS                                | 
| **Customer Support**       | `customer_service_tickets` | How effectively are customer issues being resolved?                                                                 | Ticket Volume, Resolution Time, FCR %, CSAT                                  | 


**Shared Dimension Tables:** `dim_customers`, `dim_locations`, `dim_dates`


### Next: [[Phase 2: BigQuery Data Profiling and Architecture](../phase_2_data_profiling/)]
