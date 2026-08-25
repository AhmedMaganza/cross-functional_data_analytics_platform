CREATE OR REPLACE VIEW `enterprise_dw.vw_location_analysis` AS

WITH location_metrics AS (

    SELECT
        location_id,
        city,
        country,
        region,

        SUM(net_revenue) AS net_revenue,
        SUM(quantity) AS sales_volume,
        COUNT(DISTINCT transaction_id) AS transaction_count,
        COUNT(DISTINCT customer_id) AS unique_customers,

        SAFE_DIVIDE(
            SUM(net_revenue),
            COUNT(DISTINCT transaction_id)
        ) AS average_order_value

    FROM `enterprise_dw.vw_sales_analysis_base`

    GROUP BY
        location_id,
        city,
        country,
        region
)

SELECT
    location_id,
    city,
    country,
    region,

    net_revenue,
    sales_volume,
    transaction_count,
    unique_customers,
    average_order_value,

    SAFE_DIVIDE(net_revenue, SUM(net_revenue) OVER ()) * 100 AS revenue_contribution_pct,
    RANK() OVER (ORDER BY net_revenue DESC) AS revenue_rank

FROM location_metrics;

