-- NULL Profiling Across All Warehouse Tables

DECLARE profiling_sql STRING;

SET profiling_sql = (
  SELECT STRING_AGG(
    FORMAT("""
      SELECT
        '%s' AS table_name,
        '%s' AS column_name,
        '%s' AS data_type,
        COUNT(*) AS total_rows,
        COUNTIF(`%s` IS NULL) AS null_count,
        ROUND(
          COUNTIF(`%s` IS NULL) * 100.0 / COUNT(*),
          2
        ) AS null_percentage
      FROM `enterprise_dw.%s`
    """,
      table_name,
      column_name,
      data_type,
      column_name,
      column_name,
      table_name
    ),
    " UNION ALL "
  )
  FROM `enterprise_dw.INFORMATION_SCHEMA.COLUMNS`
  WHERE table_name IN (
    'dim_dates',
    'dim_locations',
    'dim_customers',
    'trade_and_retail',
    'finance_ledger',
    'hr_employees',
    'hospitality_ops',
    'contracting_mgmt',
    'marketing_campaigns',
    'customer_service_tickets'
  )
);

EXECUTE IMMEDIATE """
  SELECT *
  FROM (
""" || profiling_sql || """
  )
  ORDER BY table_name, column_name
""";