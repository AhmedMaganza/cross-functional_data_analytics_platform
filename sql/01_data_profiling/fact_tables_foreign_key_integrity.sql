-- Fact Tables Foreign Key Integrity Profiling
--An orphan record is a row in the fact table that references an ID that does not exist in the dimension table.
SELECT
  'trade_and_retail' AS fact_table,
  'dim_customers' AS target_dim,
  COUNT(*) AS orphan_count
FROM `enterprise_dw.trade_and_retail` AS f
LEFT JOIN `enterprise_dw.dim_customers` AS d
ON f.customer_id = d.customer_id
WHERE f.customer_id IS NOT NULL AND d.customer_id IS NULL

UNION ALL

SELECT
  'trade_and_retail' AS fact_table,
  'dim_locations' AS target_dim,
  COUNT(*) AS orphan_count
FROM `enterprise_dw.trade_and_retail` AS f
LEFT JOIN `enterprise_dw.dim_locations` AS d
ON f.location_id = d.location_id
WHERE f.location_id IS NOT NULL AND d.location_id IS NULL

UNION ALL

SELECT 
  'finance_ledger' AS fact_table,
  'dim_locations' AS target_dim, 
  COUNT(*) AS orphan_count
FROM `enterprise_dw.finance_ledger` f
LEFT JOIN `enterprise_dw.dim_locations` d 
ON f.location_id = d.location_id
WHERE d.location_id IS NULL AND f.location_id IS NOT NULL

UNION ALL

SELECT 
  'hr_employees' AS fact_table, 
  'dim_locations' AS target_dim, 
  COUNT(*) AS orphan_count
FROM `enterprise_dw.hr_employees` f
LEFT JOIN `enterprise_dw.dim_locations` d 
ON f.location_id = d.location_id
WHERE d.location_id IS NULL AND f.location_id IS NOT NULL

UNION ALL

SELECT 
  'hospitality_ops' AS fact_table, 
  'dim_locations' AS target_dim, 
  COUNT(*) AS orphan_count
FROM `enterprise_dw.hospitality_ops` f
LEFT JOIN `enterprise_dw.dim_locations` d 
ON f.location_id = d.location_id
WHERE d.location_id IS NULL AND f.location_id IS NOT NULL

UNION ALL

SELECT 
  'contracting_mgmt' AS fact_table, 
  'dim_customers' AS target_dim, 
  COUNT(*) AS orphan_count
FROM `enterprise_dw.contracting_mgmt` f
LEFT JOIN `enterprise_dw.dim_customers` d 
ON f.customer_id = d.customer_id
WHERE d.customer_id IS NULL AND f.customer_id IS NOT NULL

UNION ALL

SELECT 
  'customer_service_tickets' AS fact_table, 
  'dim_customers' AS target_dim, 
  COUNT(*) AS orphan_count
FROM `enterprise_dw.customer_service_tickets` f
LEFT JOIN `enterprise_dw.dim_customers` d ON f.customer_id = d.customer_id
WHERE d.customer_id IS NULL AND f.customer_id IS NOT NULL;


