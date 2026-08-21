-- Date Profiling
SELECT
    MIN(d.full_date) AS earliest_date,
    MAX(d.full_date) AS latest_date,
    COUNT(*) AS total_rows,
    COUNTIF(d.full_date > CURRENT_DATE()) AS future_dates
FROM `enterprise_dw.trade_and_retail` AS t
LEFT JOIN `enterprise_dw.dim_dates` AS d
ON t.date_id = d.date_id