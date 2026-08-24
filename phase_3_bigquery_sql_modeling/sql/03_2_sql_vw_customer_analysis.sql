CREATE OR REPLACE VIEW `enterprise_dw.vw_customer_analysis` AS

SELECT
    customer_id,
    customer_name,
    segment,
    signup_date,

    MIN(full_date) AS first_purchase_date,
    MAX(full_date) AS last_purchase_date,

    COUNT(DISTINCT transaction_id) AS transaction_count,
    SUM(quantity) AS sales_volume,

    SUM(gross_revenue) AS gross_revenue,
    SUM(discount_amount) AS total_discount,
    SUM(net_revenue) AS net_revenue,

    SAFE_DIVIDE(
        SUM(net_revenue),
        COUNT(DISTINCT transaction_id)
    ) AS average_order_value,

    SAFE_DIVIDE(
        SUM(net_revenue),
        SUM(quantity)
    ) AS average_selling_price

FROM `enterprise_dw.vw_sales_analysis_base`

GROUP BY
    customer_id,
    customer_name,
    segment,
    signup_date;