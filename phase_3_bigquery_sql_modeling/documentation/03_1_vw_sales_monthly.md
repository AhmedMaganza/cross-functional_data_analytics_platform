# 🧭 Phase 3: BigQuery SQL Modeling & Data Transformation
## 🔷 Step 3: Build Dashboard-Ready Analytical Views </br></br> 🔷🔷 Step 3.1: Build the Monthly Sales Analytical View (`vw_sales_monthly`)

Create `vw_sales_monthly` as the primary time-based analytical view for the Sales & Retail dashboard. The view aggregates the transaction-level `vw_sales_analysis_base` data to one row per calendar month and provides the core sales KPIs required for time-series analysis.

### Key Metrics

The view provides:

* Net Revenue
* Sales Volume
* Transaction Count
* Unique Customers
* Average Order Value (AOV)
* Average Selling Price
* Sales per Customer
* Month-over-Month Revenue Growth
* Customer Retention Rate

### Design Approach

The view is built from `vw_sales_analysis_base` which was created in Step 2, rather than directly from the warehouse tables.

```text
Warehouse → vw_sales_analysis_base → vw_sales_monthly → Looker Studio
```
>  ### SQL File: [`03_1_sql_vw_sales_monthly.sql`](../sql/03_1_sql_vw_sales_monthly.sql)

<img width="500" height="550" alt="03_1_vw_sales_monthly_1" src="../snapshots/03_1_vw_sales_monthly_1.png" />

</br>
</br>

<img width="700" height="400" alt="03_1_vw_sales_monthly_2" src="../snapshots/03_1_vw_sales_monthly_2.png" />

### Validation

The view is validated against `vw_sales_analysis_base` to confirm:

* One row per month
* Revenue reconciliation
* Sales volume reconciliation
* Transaction consistency
* Customer counts

>  ### SQL File: [`03_1_validation_vw_sales_monthly.sql`](../sql/03_1_validation_vw_sales_monthly.sql)

<img width="935" height="750" alt="03_1_vw_sales_monthly_3" src="../snapshots/03_1_vw_sales_monthly_3.png" />

### Next: [[Step 3.2: Build the Customer Analysis View](03_2_vw_customer_analysis.md)]