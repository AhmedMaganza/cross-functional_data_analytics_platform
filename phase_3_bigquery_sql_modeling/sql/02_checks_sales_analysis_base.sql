-- vw_sales_analysis_base checks
SELECT
  'vw_sales_analysis_base' AS data_source,
  COUNT(*) AS row_count,
  SUM(quantity) AS total_quantity,
  SUM(gross_revenue) AS gross_revenue,
  SUM(net_revenue) AS net_revenue,

FROM `enterprise_dw.vw_sales_analysis_base`

UNION ALL

SELECT 
  'trade_and_retail',
  COUNT(*),
  SUM(quantity),
  SUM(gross_revenue),
  SUM(net_revenue),
FROM `enterprise-bi.enterprise_dw.trade_and_retail`