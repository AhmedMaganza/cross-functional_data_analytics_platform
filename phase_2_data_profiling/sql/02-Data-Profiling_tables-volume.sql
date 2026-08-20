SELECT 'dim_dates' AS table_name, COUNT(*) AS total_rows
FROM `enterprise_dw.dim_dates`

UNION ALL
SELECT 'dim_locations', COUNT(*)
FROM `enterprise_dw.dim_locations`

UNION ALL
SELECT 'dim_customers', COUNT(*)
FROM `enterprise_dw.dim_customers`

UNION ALL
SELECT 'trade_and_retail', COUNT(*)
FROM `enterprise_dw.trade_and_retail`

UNION ALL
SELECT 'finance_ledger', COUNT(*)
FROM `enterprise_dw.finance_ledger`

UNION ALL
SELECT 'hr_employees', COUNT(*)
FROM `enterprise_dw.hr_employees`

UNION ALL
SELECT 'hospitality_ops', COUNT(*)
FROM `enterprise_dw.hospitality_ops`

UNION ALL
SELECT 'contracting_mgmt', COUNT(*)
FROM `enterprise_dw.contracting_mgmt`

UNION ALL
SELECT 'marketing_campaigns', COUNT(*)
FROM `enterprise_dw.marketing_campaigns`

UNION ALL
SELECT 'customer_service_tickets', COUNT(*)
FROM `enterprise_dw.customer_service_tickets`

ORDER BY total_rows DESC;