-- Foreign Key Integrity
-- trade_and_retail -> dim_customers
SELECT
    'trade_and_retail' AS fact_table,
    'dim_customers' AS dim_table,
    COUNT(*) AS total_records
FROM `enterprise_dw.trade_and_retail` t
LEFT JOIN `enterprise_dw.dim_customers` c
    ON t.customer_id = c.customer_id

UNION ALL

-- trade_and_retail -> dim_locations
SELECT
    'trade_and_retail',
    'dim_locations',
    COUNT(*)
FROM `enterprise_dw.trade_and_retail` t
LEFT JOIN `enterprise_dw.dim_locations` loc
    ON t.location_id = loc.location_id

UNION ALL

-- trade_and_retail -> dim_locations
SELECT
    'trade_and_retail',
    'dim_dates',
    COUNT(*)
FROM `enterprise_dw.trade_and_retail` t
LEFT JOIN `enterprise_dw.dim_dates` d
    ON t.date_id = d.date_id
