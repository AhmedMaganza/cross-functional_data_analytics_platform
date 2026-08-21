-- Check how many fact records linked to each dimension
-- dim_customer -> trade_and_retail
SELECT
    c.customer_id,
    COUNT(t.customer_id) AS fact_records
FROM `enterprise_dw.dim_customers` c
LEFT JOIN `enterprise_dw.trade_and_retail` t
    ON c.customer_id = t.customer_id
GROUP BY c.customer_id
ORDER BY fact_records DESC;

-- dim_dates -> trade_and_retail
SELECT
    loc.location_id,
    COUNT(t.location_id) AS fact_records
FROM `enterprise_dw.dim_locations` loc
LEFT JOIN `enterprise_dw.trade_and_retail` t
    ON loc.location_id = t.location_id
GROUP BY loc.location_id
ORDER BY fact_records DESC;


-- dim_dates -> trade_and_retail
SELECT
    d.date_id,
    COUNT(t.date_id) AS fact_records
FROM `enterprise_dw.dim_dates` d
LEFT JOIN `enterprise_dw.trade_and_retail` t
    ON d.date_id = t.date_id
GROUP BY d.date_id
ORDER BY fact_records DESC;
