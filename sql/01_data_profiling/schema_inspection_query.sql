-- Schema Inspection Query
SELECT
  table_name,
  column_name,
  data_type,
  is_nullable
FROM
  `enterprise-bi.enterprise_dw.INFORMATION_SCHEMA.COLUMNS`
ORDER BY
  table_name,
  ordinal_position;


--Global Row Count Summary Query
SELECT table_id AS table_name, row_count, size_bytes
FROM `enterprise_dw.__TABLES__`
ORDER BY row_count DESC;





