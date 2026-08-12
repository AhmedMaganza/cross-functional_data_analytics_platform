CREATE OR REPLACE VIEW `enterprise_dw.vw_sales_performance` AS
WITH base_sales AS (
    SELECT
        -- Primary & Foreign Keys
        s.transaction_id,
        s.customer_id,
        s.location_id,
        s.date_id,
        
        -- Date Attributes
        d.full_date,
        d.year,
        d.quarter,
        d.month,
        d.month_name,
        d.day_of_week,
        d.is_weekend,

        -- Customer Attributes
        c.customer_name,
        c.segment AS customer_segment,
        c.signup_date AS customer_signup_date,

        -- Location Attributes
        l.city,
        l.country,
        l.region,

        -- Transaction Attributes & Financial Metrics
        s.product_category,
        s.quantity,
        s.unit_price,
        s.discount_amount,
        s.gross_revenue,
        s.net_revenue,

        -- Calculated Fields (Item-Level Metrics)
        SAFE_DIVIDE(s.discount_amount, s.gross_revenue) * 100 AS discount_percentage,
        SAFE_DIVIDE(s.net_revenue, s.quantity) AS effective_unit_price

    FROM `enterprise_dw.trade_and_retail` s
    LEFT JOIN `enterprise_dw.dim_dates` d 
        ON s.date_id = d.date_id
    LEFT JOIN `enterprise_dw.dim_customers` c 
        ON s.customer_id = c.customer_id
    LEFT JOIN `enterprise_dw.dim_locations` l 
        ON s.location_id = l.location_id
),

-- CTE for Windowed Metrics (Cumulative Revenue & Order Sequence Per Customer)
customer_analytics AS (
    SELECT
        *,
        -- Customer lifetime order count up to current transaction
        ROW_NUMBER() OVER (
            PARTITION BY customer_id 
            ORDER BY full_date, transaction_id
        ) AS customer_order_sequence,

        -- Cumulative Net Revenue per Customer over time
        SUM(net_revenue) OVER (
            PARTITION BY customer_id 
            ORDER BY full_date, transaction_id
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS customer_cumulative_revenue
    FROM base_sales
)

SELECT
    transaction_id,
    customer_id,
    customer_name,
    customer_segment,
    customer_signup_date,
    location_id,
    city,
    country,
    region,
    date_id,
    full_date,
    year,
    quarter,
    month,
    month_name,
    day_of_week,
    is_weekend,
    product_category,
    quantity,
    unit_price,
    discount_amount,
    gross_revenue,
    net_revenue,
    discount_percentage,
    effective_unit_price,
    customer_order_sequence,
    customer_cumulative_revenue,

    -- Business Logic Flags
    CASE 
        WHEN customer_order_sequence = 1 THEN 'New Customer'
        ELSE 'Repeat Customer'
    END AS customer_order_type,

    CASE 
        WHEN discount_amount > 0 THEN TRUE 
        ELSE FALSE 
    END AS is_discounted

FROM customer_analytics;