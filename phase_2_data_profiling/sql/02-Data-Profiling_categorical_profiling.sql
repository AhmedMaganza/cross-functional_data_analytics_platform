-- Categorical Profiling
SELECT
    'trade_and_retail' AS data_table,
    'product_category' AS tested_field,
    product_category AS category,
    COUNT(*) AS record_count
FROM `enterprise_dw.trade_and_retail`
GROUP BY product_category

UNION ALL

SELECT
    'contracting_mgmt' AS data_table,
    'completion_status' AS tested_field,
    completion_status,
    COUNT(*) AS record_count
FROM `enterprise_dw.contracting_mgmt`
GROUP BY completion_status

UNION ALL

SELECT
    'customer_service_tickets' AS data_table,
    'category' AS tested_field,
    category,
    COUNT(*) AS record_count
FROM `enterprise_dw.customer_service_tickets`
GROUP BY category

UNION ALL

SELECT
    'customer_service_tickets' AS data_table,
    'priority' AS tested_field,
    priority,
    COUNT(*) AS record_count
FROM `enterprise_dw.customer_service_tickets`
GROUP BY priority

UNION ALL

SELECT
    'customer_service_tickets' AS data_table,
    'status' AS tested_field,
    status,
    COUNT(*) AS record_count
FROM `enterprise_dw.customer_service_tickets`
GROUP BY status

UNION ALL

SELECT
    'dim_customers' AS data_table,
    'segment' AS tested_field,
    segment,
    COUNT(*) AS record_count
FROM `enterprise_dw.dim_customers`
GROUP BY segment

UNION ALL

SELECT
    'finance_ledger' AS data_table,
    'account_category' AS tested_field,
    account_category,
    COUNT(*) AS record_count
FROM `enterprise_dw.finance_ledger`
GROUP BY account_category


ORDER BY data_table, tested_field, record_count DESC