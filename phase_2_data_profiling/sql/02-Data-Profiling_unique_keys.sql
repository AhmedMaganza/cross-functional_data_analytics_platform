-- Key uniqueness
SELECT
    customer_id,
    COUNT(*) AS record_count
FROM `enterprise_dw.dim_customers`
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY record_count DESC;