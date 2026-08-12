-- Dimension Key Uniqueness & Null Profiling
-- Profile dim_dates
SELECT 
  'dim_dates' AS Table_Name,
  COUNT(date_id) AS Total_IDs,
  COUNT(DISTINCT date_id) AS Unique_Primarykeys,
  COUNT(*) - COUNT(date_id) AS Null_Primarykeys
FROM `enterprise_dw.dim_dates`

UNION ALL

SELECT
 'dim_customers' AS Table_Name,
  COUNT(customer_id) AS Total_IDs,
  COUNT(DISTINCT customer_id) AS Unique_Primarykeys,
  COUNT(*) - COUNT(customer_id) AS Null_Primarykeys
FROM `enterprise_dw.dim_customers`

UNION ALL

SELECT
 'dim_locations' AS Table_Name,
  COUNT(location_id) AS Total_IDs,
  COUNT(DISTINCT location_id) AS Unique_Primarykeys,
  COUNT(*) - COUNT(location_id) AS Null_Primarykeys
FROM `enterprise_dw.dim_locations`


