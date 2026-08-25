
-- Revenue Reconcilation
SELECT
        'vw_location_analysis' AS data_source,
        SUM(net_revenue) AS view_revenue
FROM `enterprise_dw.vw_location_analysis`

UNION ALL

SELECT
    'vw_sales_analysis_base',
    SUM(net_revenue) AS base_view_revenue
FROM `enterprise_dw.vw_sales_analysis_base`;


-- The contribution percentages should sum to 100%
SELECT
    SUM(revenue_contribution_pct) AS total_contribution_pct
FROM `enterprise_dw.vw_location_analysis`;



-- Highest ranking locations
SELECT
    location_id,
    city,
    country,
    region,
    net_revenue,
    revenue_contribution_pct,
    revenue_rank
FROM `enterprise_dw.vw_location_analysis`
ORDER BY revenue_rank
LIMIT 20;

