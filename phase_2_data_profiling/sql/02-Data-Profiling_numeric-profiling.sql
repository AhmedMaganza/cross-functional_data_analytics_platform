-- Numeric Profiling

SELECT
    COUNT(*) AS total_rows,
    MIN(quantity) AS min_value,
    MAX(quantity) AS max_value,
    AVG(quantity) AS avg_value,
    COUNTIF(quantity = 0) AS zero_value,
    COUNTIF(quantity < 0) AS negative_value
FROM `enterprise_dw.trade_and_retail`;


