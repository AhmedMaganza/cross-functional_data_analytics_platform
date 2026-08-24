# 🧭 Phase 3: BigQuery SQL Modeling & Data Transformation
## 🔷 Step 3: Build Dashboard-Ready Analytical Views </br></br> 🔷🔷 Step 3.2: Build the Customer Analysis View `vw_customer_analysis`

Create `vw_customer_analysis` as the customer-level analytical view for the Sales & Retail domain. This view aggregates the transaction-level `vw_sales_analysis` data to support customer performance and segment analysis.

## Key Metrics

The view provides:

* First Purchase Date
* Last Purchase Date
* Transaction Count
* Sales Volume
* Gross Revenue
* Total Discount
* Net Revenue
* Average Order Value
* Average Selling Price
* Customer Attributes

### Design Approach

The view is built from `vw_sales_analysis_base` which was created in Step 2, rather than directly from the warehouse tables.

```text
Warehouse → vw_sales_analysis_base → vw_sales_monthly → Looker Studio
```
>  ### SQL File: [`03_2_sql_vw_customer_analysis.sql`](../sql/03_2_sql_vw_customer_analysis.sql)

</br>

<img width="600" height="500" alt="03_2_vw_customer_analysis_1" src="https://github.com/user-attachments/assets/4b9abc81-7e91-4e17-8cc8-f47c0c3e4533" />

</br>
</br>

<img width="800" height="400" alt="03_2_vw_customer_analysis_2" src="https://github.com/user-attachments/assets/d6a85767-a56a-4cbd-8d45-154c39b05121" />

## Validation

The view will be validated to confirm:

* One row per customer
* Customer-level revenue reconciliation
* Transaction reconciliation
* Sales volume reconciliation
* Correct first and last purchase dates
* Correct customer-level calculations

>  ### SQL File: [`03_2_checks_vw_customer_analysis.sql`](../sql/03_2_checks_vw_customer_analysis.sql)
</br>

<img width="400" height="600" alt="03_2_vw_customer_analysis_3" src="https://github.com/user-attachments/assets/6270c89a-30e1-4503-b15f-9d0e99e503ce" />

### Next: [[Step 3.3: Build the Location Analysis View](03_3_vw_location_analysis.md)]