-- Tables Schema
SELECT
    table_name,
    table_type
FROM `enterprise_dw.INFORMATION_SCHEMA.TABLES`
ORDER BY table_name;

-- Columns Schema
SELECT
    table_name,
    column_name,
    data_type,
    is_nullable
FROM `enterprise_dw.INFORMATION_SCHEMA.COLUMNS`
ORDER BY
    table_name,
    ordinal_position;