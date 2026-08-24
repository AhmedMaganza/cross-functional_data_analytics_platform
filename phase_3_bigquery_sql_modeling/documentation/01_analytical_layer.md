# 🧭 Phase 3: BigQuery SQL Modeling & Data Transformation
## 🔷 Step 1: Analytical Layer Design

Define the analytical-layer architecture for the **Sales & Retail** domain based on the business requirements and dashboard requirements established in earlier phases.

The goal is to determine what analytical datasets are required, their grain, and the business logic they need to support before writing the transformation SQL.

## Source Tables

Phase 3 uses the existing Sales & Retail warehouse:

| Table              | Role                   |
| ------------------ | ---------------------- |
| `trade_and_retail` | Sales transaction fact |
| `dim_dates`        | Date attributes        |
| `dim_customers`    | Customer attributes    |
| `dim_locations`    | Location attributes    |

The source warehouse tables will remain unchanged.

## Source Grain

The `trade_and_retail` table was validated in Phase 2 at the transaction level.

**Grain: One row = one sales transaction**

This transaction-level dataset provides the foundation for all downstream analytical views.

### Planned Analytical Views

| View                   | Grain       | Purpose                        |
| ---------------------- | ----------- | ------------------------------ |
| `vw_sales_analysis`    | Transaction | Base analytical dataset        |
| `vw_sales_monthly`     | Month       | Sales trends, KPIs & retention |
| `vw_customer_analysis` | Customer    | Customer performance           |
| `vw_location_analysis` | Location    | Geographic performance         |

The views will only contain fields and calculations required to support the defined analysis and dashboard.

## Key Design Decisions

### Revenue

The warehouse already provides `gross_revenue` and `net_revenue`.

**Net Revenue** will be used as the primary Sales/Revenue KPI because it reflects sales after discounts.

`gross_revenue` and `discount_amount` will remain available for supporting analysis.

### Location

For sales-location analysis, `trade_and_retail.location_id` will be used because it represents the location associated with the transaction.

The customer location will remain available as a customer attribute where relevant.

### Customer Retention

Customer retention follows the definition established in Phase 2:

> The percentage of customers who made a purchase during a defined period and made at least one additional purchase during the subsequent period.

For monthly analysis:

```text
Retention Rate = (Customers purchasing in Month N and Month N+1 / Customers purchasing in Month N) × 100
```

## KPI Mapping

| KPI                     | Primary Analytical Output     |
| ----------------------- | ----------------------------- |
| Revenue / Sales         | Monthly                       |
| Sales Volume            | Monthly                       |
| Transaction Count       | Monthly                       |
| Average Order Value     | Monthly / Customer / Location |
| Average Selling Price   | Monthly                       |
| Unique Customers        | Monthly / Location            |
| Sales per Customer      | Monthly / Customer            |
| Sales by Location       | Location                      |
| Sales by Time           | Monthly                       |
| Customer Retention Rate | Monthly                       |

## Design Principles
* Preserve the existing warehouse.
* Reuse existing dimensions.
* Centralize reusable business logic in BigQuery.
* Build analytical outputs based on actual dashboard requirements.

### Next: [[Step 2: Build the Base Analytical View](02_base-analytical_view.md)]
