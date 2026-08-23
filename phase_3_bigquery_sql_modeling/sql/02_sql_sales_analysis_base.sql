-- Create Base Analytical View

CREATE OR REPLACE VIEW `enterprise-bi.enterprise_dw.vw_sales_analysis_base` AS

  SELECT
     --transaction info
     s.transaction_id, s.product_category,

     --customer info
     s.customer_id, c.customer_name, c.segment, c.signup_date,

     --date info
     d.full_date, d.year, d.quarter, d.month, d.month_name, d.day_of_week, d.is_weekend,

     --location info
     loc.region, loc.country, loc.city,

     --sales info
     s.quantity, s.unit_price, s.gross_revenue, s.net_revenue

  FROM `enterprise-bi.enterprise_dw.trade_and_retail` AS s

  LEFT JOIN `enterprise-bi.enterprise_dw.dim_customers` AS c
    ON s.customer_id = c.customer_id

  LEFT JOIN `enterprise-bi.enterprise_dw.dim_dates` AS d
    ON s.date_id = d.date_id

  LEFT JOIN `enterprise-bi.enterprise_dw.dim_locations` AS loc
    ON s.location_id = loc.Location_id