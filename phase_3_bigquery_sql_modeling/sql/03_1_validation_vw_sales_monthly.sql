
-- Grain Validation
-- 1 Row = 1 Month
SELECT
    COUNT(*) AS row_count,
    COUNT(DISTINCT month_start) AS distinct_months
FROM `enterprise_dw.vw_sales_monthly`;

-- Revenue Validation
SELECT
    'monthly_view_revenue' AS revenue_source,
    SUM(net_revenue) AS total_revenue
FROM `enterprise_dw.vw_sales_monthly`
UNION ALL
SELECT
    'base_view_revenue',
    SUM(net_revenue)
FROM `enterprise_dw.vw_sales_analysis_base`;

-- Check Monthly Values and Retention
SELECT
 month_start,
    net_revenue,
    sales_volume,
    transaction_count,
    unique_customers,
    retention_rate_pct
FROM `enterprise_dw.vw_sales_monthly`
ORDER BY month_start;

