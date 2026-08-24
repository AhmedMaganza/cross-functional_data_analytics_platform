# 🧭 Phase 3: BigQuery SQL Modeling & Data Transformation
## 🔷 Step 3: Build Dashboard-Ready Analytical Views

Create the analytical views required to support the Sales & Retail Looker Studio dashboard.

The views are built from `vw_sales_analysis` and are designed around the analytical requirements and KPIs established in Phase 1.

## Analytical Views

| Analytical View | Grain | Supports |
|---|---|---|
| **vw_sales_monthly** | One row per month | Revenue and sales trends<br>Sales volume<br>Transaction count<br>Unique customers<br>Average Order Value<br>Average Selling Price<br>Sales per Customer<br>Month-over-month growth<br>Customer retention |
| **vw_customer_analysis** | One row per customer | Customer revenue and sales volume<br>Transaction frequency<br>Average Order Value<br>First and last purchase<br>Customer segment analysis<br>Customer performance and retention analysis |
| **vw_location_analysis**  | One row per location | Sales by location<br>Sales volume<br>Transaction count<br>Unique customers<br>Average Order Value<br>Revenue contribution<br>Location ranking |

## SQL Techniques

The views will demonstrate practical analytical SQL including:

* CTEs
* Aggregations
* Date logic
* Window functions
* Rankings
* Period-over-period calculations
* Percentage and contribution calculations

## Implementation Approach

The views will be developed and validated individually:

Build and validate `vw_sales_monthly` **[[View Implementation Process](03_1_vw_sales_monthly.md)]** ✔

Build and validate `vw_customer_analysis` **[[View Implementation Process](03_2_vw_customer_analysis.md)]** ✔
   
Build and validate `vw_location_analysis` (⏳Pending)

Each view will have a clearly defined grain and will be derived from the validated `vw_sales_analysis_base` foundation.

## Outcome

The completed views will provide the **dashboard-ready analytical layer** required by Looker Studio while keeping the architecture lightweight and focused on the project's technical objectives.

