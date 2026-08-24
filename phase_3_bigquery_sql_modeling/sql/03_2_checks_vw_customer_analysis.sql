-- Validate Customer Analysis View

--View Customers
SELECT *
FROM `enterprise_dw.vw_customer_analysis`
ORDER BY net_revenue DESC
LIMIT 20;


-- View Null Cutomter IDs
SELECT
    COUNT(*) AS rows_with_null_customer,
    SUM(net_revenue) AS revenue_with_null_customer
FROM `enterprise_dw.vw_sales_analysis_base`
WHERE customer_id IS NULL;



