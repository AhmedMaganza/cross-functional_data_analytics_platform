-- Monthly Sales Analytical View

CREATE OR REPLACE VIEW `enterprise_dw.vw_sales_monthly` AS

WITH monthly_sales AS (
    SELECT
        DATE_TRUNC(full_date, MONTH) AS month_start,
        year,
        month,
        month_name,
        SUM(net_revenue) AS net_revenue,
        SUM(quantity) AS sales_volume,
        COUNT(DISTINCT transaction_id) AS transaction_count,
        COUNT(DISTINCT customer_id) AS unique_customers
    FROM `enterprise_dw.vw_sales_analysis_base`
    GROUP BY
        month_start,
        year,
        month,
        month_name
),

monthly_metrics AS (
    SELECT
        *,
        SAFE_DIVIDE(net_revenue, transaction_count) AS average_order_value,
        SAFE_DIVIDE(net_revenue,sales_volume) AS average_selling_price,
        SAFE_DIVIDE(net_revenue, unique_customers) AS sales_per_customer
    FROM monthly_sales
),

monthly_growth AS (
    SELECT
        *,        
        SAFE_DIVIDE(net_revenue - LAG(net_revenue) OVER (ORDER BY month_start), LAG(net_revenue) OVER (ORDER BY month_start)) 
            * 100 AS revenue_growth_pct
    FROM monthly_metrics
),

monthly_customers AS (
    SELECT DISTINCT DATE_TRUNC(full_date, MONTH) AS month_start,
        customer_id
    FROM `enterprise_dw.vw_sales_analysis_base`
    WHERE customer_id IS NOT NULL
),

retention AS (
    SELECT
        current_month.month_start,
        COUNT(DISTINCT current_month.customer_id) AS customers_in_month,
        COUNT(DISTINCT next_month.customer_id) AS retained_customers
    FROM monthly_customers AS current_month
    LEFT JOIN monthly_customers AS next_month
        ON current_month.customer_id = next_month.customer_id
        AND next_month.month_start = DATE_ADD(current_month.month_start, INTERVAL 1 MONTH)
    GROUP BY
        current_month.month_start
)

SELECT
    mg.month_start,
    mg.year,
    mg.month,
    mg.month_name,

    mg.net_revenue,
    mg.sales_volume,
    mg.transaction_count,
    mg.unique_customers,

    mg.average_order_value,
    mg.average_selling_price,
    mg.sales_per_customer,

    mg.revenue_growth_pct,

    SAFE_DIVIDE(
        r.retained_customers,
        r.customers_in_month
    ) * 100 AS retention_rate_pct

FROM monthly_growth AS mg

LEFT JOIN retention AS r
    ON mg.month_start = r.month_start;