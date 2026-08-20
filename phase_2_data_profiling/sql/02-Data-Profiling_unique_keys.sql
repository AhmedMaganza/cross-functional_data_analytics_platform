-- Key uniqueness for dim_tables
-- dim_customers
SELECT
    customer_id,
    COUNT(*) AS record_count
FROM `enterprise_dw.dim_customers`
GROUP BY customer_id
HAVING COUNT(*) > 1

UNION ALL
-- dim_locations
SELECT
    location_id,
    COUNT(*) AS record_count
FROM `enterprise_dw.dim_locations`
GROUP BY location_id
HAVING COUNT(*) > 1

UNION ALL
-- dim_dates
SELECT
    CAST(full_date AS STRING),
    COUNT(*) AS record_count
FROM `enterprise_dw.dim_dates`
GROUP BY full_date
HAVING COUNT(*) > 1

UNION ALL
-- fact_trade_and-retail
SELECT
    transaction_id,
    COUNT(*) AS record_count
FROM `enterprise_dw.trade_and_retail`
GROUP BY transaction_id
HAVING COUNT(*) > 1

UNION ALL
-- fact_contracting_mgmt
SELECT
    project_id,
    COUNT(*) AS record_count
FROM `enterprise_dw.contracting_mgmt`
GROUP BY project_id
HAVING COUNT(*) > 1

UNION ALL
-- fact_customer_service_tickets
SELECT
    ticket_id,
    COUNT(*) AS record_count
FROM `enterprise_dw.customer_service_tickets`
GROUP BY ticket_id
HAVING COUNT(*) > 1

UNION ALL
-- fact_finance_ledger
SELECT
    ledger_id,
    COUNT(*) AS record_count
FROM `enterprise_dw.finance_ledger`
GROUP BY ledger_id
HAVING COUNT(*) > 1

UNION ALL
-- fact_hospitality_ops
SELECT
    operation_id,
    COUNT(*) AS record_count
FROM `enterprise_dw.hospitality_ops`
GROUP BY operation_id
HAVING COUNT(*) > 1

UNION ALL
-- fact_hr_employees
SELECT
    employee_id,
    COUNT(*) AS record_count
FROM `enterprise_dw.hr_employees`
GROUP BY employee_id
HAVING COUNT(*) > 1

UNION ALL
-- fact_marketing_campaigns
SELECT
    campaign_id,
    COUNT(*) AS record_count
FROM `enterprise_dw.marketing_campaigns`
GROUP BY campaign_id
HAVING COUNT(*) > 1

ORDER BY record_count DESC





