-- Data Quality and Null Audits
SELECT
  'trade_and_retail' AS table_name,
  COUNT(*) AS total_rows,
  COUNTIF(transaction_id IS NULL) AS null_pk,
  COUNTIF(net_revenue IS NULL OR net_revenue <=0) AS invalid_revenue,
  0 AS status_issues
FROM `enterprise_dw.trade_and_retail`

UNION ALL

SELECT
  'financial_ledger' AS table_name,
  COUNT(*) AS total_rows,
  COUNTIF(ledger_id IS NULL) AS null_pk,
  COUNTIF(actual_amount IS NULL OR actual_amount <=0) as invalid_revenue,
  0 AS status_issues
FROM `enterprise_dw.finance_ledger`

UNION ALL

SELECT
  'hr_employees' AS table_name,
  COUNT(*) AS total_rows,
  COUNTIF(employee_id IS NULL) AS null_pk,
  COUNTIF(monthly_salary IS NULL OR monthly_salary <=0) as invalid_revenue,
  COUNTIF(employment_status NOT IN ('Active','Terminated')) AS status_issues,
FROM `enterprise_dw.hr_employees`

UNION ALL

SELECT
  'hospitality_ops' AS table_name,
  COUNT(*) AS total_rows,
  COUNTIF(operation_id IS NULL) AS null_pk,
  COUNTIF(utilized_capacity > total_capacity ) as invalid_revenue,
  COUNTIF(fulfillment_status IS NULL) AS status_issues,
FROM `enterprise_dw.hospitality_ops`


UNION ALL

SELECT
  'contracting_mgmt' AS table_name,
  COUNT(*) AS total_rows,
  COUNTIF(project_id IS NULL) AS null_pk,
  COUNTIF(actual_cost IS NULL OR actual_cost <=0) as invalid_revenue,
  COUNTIF(completion_status IS NULL) AS status_issues,
FROM `enterprise_dw.contracting_mgmt`


UNION ALL

SELECT
  'marketing_campaigns' AS table_name,
  COUNT(*) AS total_rows,
  COUNTIF(campaign_id IS NULL) AS null_pk,
  COUNTIF(ad_spend IS NULL OR ad_spend <=0) as invalid_revenue,
  0 AS status_issues,
FROM `enterprise_dw.marketing_campaigns`

UNION ALL

SELECT
  'customer_service_tickets' AS table_name,
  COUNT(*) AS total_rows,
  COUNTIF(ticket_id IS NULL) AS null_pk,
  COUNTIF(csat_score IS NOT NULL AND (csat_score < 1 OR csat_score > 5)) as invalid_revenue,
  COUNTIF(status NOT IN ('Closed','Resolved','In Progress')) AS status_issues,
FROM `enterprise_dw.customer_service_tickets`
