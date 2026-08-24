# 🧭 Phase 2: Data Profiling & Analytical Readiness
## 🔷 Step 4: Analytical Readiness Assessment

Assess whether the warehouse is ready to support the analytical requirements and KPIs defined in Phase 1.
This step consolidates the findings from **Steps 1–3** and maps them to the planned Sales & Retail analysis and Looker Studio dashboard.

## Assessment Approach

The assessment is based on the evidence established during:

* **Step 1 — Schema & Data Inventory:** available tables, fields, and data structure
* **Step 2 — Data Profiling:** completeness, uniqueness, distributions, ranges, and date coverage
* **Step 3 — Relationship Validation:** keys, relationships, foreign-key integrity, and fact-table grain

These findings are compared against the analytical requirements established in Phase 1.

## 4.1 KPI Data Availability

The Phase 1 KPI requirements are mapped to the available warehouse data to determine whether each KPI can be reliably supported.

| KPI                           | Required Data                   | Source                 | Calculation                      | Status  |
| ----------------------------- | ------------------------------- | ---------------------- | -------------------------------- | ------- |
| **Revenue / Sales**           | `quantity`, `unit_price`        | `trade_and_retail`     | `SUM(quantity × unit_price)`     | ✔ Supported|
| **Sales Volume**              | `quantity`                      | `trade_and_retail`     | `SUM(quantity)`                  | ✔ Supported|
| **Transaction Count**         | Transaction identifier          | `trade_and_retail`     | `COUNT(DISTINCT transaction_id)` | ✔ Supported|
| **Average Order Value (AOV)** | Revenue, transaction identifier | `trade_and_retail`     | Revenue / Transactions           | ✔ Supported |
| **Average Selling Price**     | Revenue, quantity               | `trade_and_retail`     | Revenue / Sales Volume           | ✔ Supported|
| **Unique Customers**          | `customer_id`                   | `trade_and_retail`     | `COUNT(DISTINCT customer_id)`    | ✔ Supported|
| **Sales per Customer**        | Revenue, `customer_id`          | `trade_and_retail`     | Revenue / Customers              | ✔ Supported|
| **Sales by Location**         | Revenue, `location_id`          | Fact + `dim_locations` | Revenue by location              | ✔ Supported|
| **Sales by Time**             | Revenue, `date_id`              | Fact + `dim_dates`     | Revenue by period                | ✔ Supported|
| **Customer Retention Rate**   | `customer_id`, transaction date | Fact + `dim_dates`     | Period-based customer retention  | ✔ Supported|
| **Gross Profit**              | Revenue, COGS                   | —                      | Revenue − COGS                   | ❌ Not Supported |
| **Gross Margin %**            | Revenue, COGS                   | —                      | Gross Profit / Revenue           | ❌ Not Supported |

For this project, **Customer Retention Rate** is defined as:

> The percentage of customers who made a purchase during a defined period and made at least one additional purchase during the subsequent period.

For monthly analysis:

```text
(Customers purchasing in Month N and Month N+1 / Customers purchasing in Month N) x 100
```

## Analytical Readiness Result

The assessment confirms that the current warehouse provides the required **measures, dimensions, relationships, and data coverage** to support the core Sales & Retail analysis and planned Looker Studio dashboard.

The assessment also identified two analytical limitations:

* **Gross Profit** cannot currently be calculated because COGS/cost data is unavailable.
* **Gross Margin %** cannot currently be calculated because it depends on Gross Profit and COGS.

These limitations are documented rather than addressed through additional warehouse changes, keeping the project scope focused.

### Next: [[Phase 3: BigQuery SQL Modeling and Data Transformation](../../phase_3_bigquery_sql_modeling)]
