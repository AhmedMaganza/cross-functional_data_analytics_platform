# Phase 1: Project Framing & Business Requirements

## 📌 Phase Overview

Phase 1 establishes the **enterprise framing, business scope, target audience, and analytical requirements** for the **Enterprise 360** analytics platform.

The objective of this phase is to define the business context across seven core domains and translate key stakeholder information needs into business questions, target KPIs, and underlying data sources.

This phase provides the business foundation for the technical implementation that follows.

## 🎯 Business Context & Scenario

* **Organization:** A multi-sector entity spanning trade, retail, hospitality, contracting, and corporate services.
* **The Challenge:** Operational, customer, and financial data reside in disconnected departmental systems. Executive leadership lacks cross-functional visibility, resulting in fragmented reporting, delayed strategic execution, and hidden operational friction.
* **The Strategy:** Establish a centralized analytical environment in **Google BigQuery** (`enterprise_dw`) and use **Looker Studio** as the BI visualization layer for performance reporting.

## 👥 Stakeholder Analysis & Requirements

| Stakeholder Persona                | Primary Business Objective                                                            |                                                                                       
| :--------------------------------- | :------------------------------------------------------------------------------------ | 
| **Executive Leadership (C-Suite)** | High-level business performance, profitability, and enterprise growth.                |
| **Departmental Managers**          | Operational execution, SLA compliance, team productivity, and customer retention.     |
| **Data & Analytics Team**          | Maintain scalable data models, ensure metric consistency, and enable ad-hoc querying. | 

## 🗺️ Domain Matrix & Analytical Mapping

Phase 1 establishes the analytical scope across the seven business domains by mapping each domain to its core data source, key business questions, and target KPIs.

| Domain                        | Core Table(s)              | Key Business Questions                                                               | Target KPIs & Metrics                                                                       |
| :---------------------------- | :------------------------- | :----------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------ |
| **Sales & Retail**         | `trade_and_retail`         | Where are deals stalling in the funnel, and which regions drive revenue?             | Revenue, Average Order Value (AOV), YoY/MoM Growth %, Category & Regional Net Revenue, New vs. Repeat Revenue Share %, Effective Discount Rate %                              |
| **Finance**                | `finance_ledger`           | Where are the primary variances between operational budget and actual spend?         | Gross/Net Margin %, EBITDA, Budget vs. Actual Variance, Operating Cash Flow                 |
| **Human Resources**        | `hr_employees`             | What is our employee turnover rate, and which departments show high attrition?       | Headcount, Turnover Rate %, Time-to-Hire, Average Tenure                                    |
| **Operations**             | `hospitality_ops`          | What are our fulfillment cycle times, and where are operational bottlenecks?         | Capacity Utilization %, Order Fulfillment Cycle Time, Perfect Order Rate                    |
| **Projects & Contracting** | `contracting_mgmt`         | Are contracted projects being delivered on time and within agreed budgets?           | Earned Value Management (EVM), Schedule Variance (SV), Cost Variance (CV)                   |
| **Marketing**              | `marketing_campaigns`      | Which campaigns deliver highest ROAS, and how are acquisition costs trending?        | Customer Acquisition Cost (CAC), Return on Ad Spend (ROAS), Conversion Rate %               |
| **Customer Support**       | `customer_service_tickets` | How efficiently are support tickets resolved, and what drives customer satisfaction? | Customer Satisfaction (CSAT), First Contact Resolution (FCR %), Average Handling Time (AHT) |

**Shared Dimension Tables:** `dim_customers`, `dim_locations`, `dim_dates`

*Status: Phase 1 completed. The project proceeds to Phase 2: Data Profiling & Architecture.*
