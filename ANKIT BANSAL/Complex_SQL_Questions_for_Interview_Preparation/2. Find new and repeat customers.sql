-- Create the customer_orders table
CREATE TABLE customer_orders (
    order_id INTEGER,
    customer_id INTEGER,
    order_date DATE,
    order_amount INTEGER
);

-- Insert data into the customer_orders table
INSERT INTO customer_orders VALUES 
    (1, 100, CAST('2022-01-01' AS DATE), 2000),
    (2, 200, CAST('2022-01-01' AS DATE), 2500),
    (3, 300, CAST('2022-01-01' AS DATE), 2100),
    (4, 100, CAST('2022-01-02' AS DATE), 2000),
    (5, 400, CAST('2022-01-02' AS DATE), 2200),
    (6, 500, CAST('2022-01-02' AS DATE), 2700),
    (7, 100, CAST('2022-01-03' AS DATE), 3000),
    (8, 400, CAST('2022-01-03' AS DATE), 1000),
    (9, 600, CAST('2022-01-03' AS DATE), 3000);

-- Select all data from the customer_orders table
SELECT * FROM customer_orders;

-- METHOD-1:

WITH first_visit_cte AS (
    -- Find the first visit date for each customer
    SELECT 
        customer_id, 
        MIN(order_date) AS first_visit_date 
    FROM 
        customer_orders 
    GROUP BY 
        customer_id
),
visit_flag_cte AS (
    -- Join the customer orders with their first visit date to flag first and repeat visits
    SELECT 
        co.*, 
        fv.first_visit_date,
        CASE 
            WHEN co.order_date = fv.first_visit_date THEN 1 
            ELSE 0 
        END AS first_visit_flag,
        CASE 
            WHEN co.order_date != fv.first_visit_date THEN 1 
            ELSE 0 
        END AS repeat_visit_flag
    FROM 
        customer_orders co
    INNER JOIN 
        first_visit_cte fv 
    ON 
        co.customer_id = fv.customer_id
)
-- Summarize visits and amounts by order date
SELECT 
    order_date, 
    SUM(first_visit_flag) AS first_visit_count, 
    SUM(CASE WHEN first_visit_flag = 1 THEN order_amount ELSE 0 END) AS new_customer_amount,
    SUM(repeat_visit_flag) AS repeat_visit_count,
    SUM(CASE WHEN repeat_visit_flag = 1 THEN order_amount ELSE 0 END) AS repeat_customer_amount
FROM 
    visit_flag_cte
GROUP BY 
    order_date
ORDER BY 
    order_date;


-- METHOD-2:

WITH customer_orders_with_first_date AS (
    -- Determine the first order date for each customer
    SELECT 
        customer_id, 
        order_date, 
        order_amount, 
        MIN(order_date) OVER (PARTITION BY customer_id) AS first_order_date
    FROM 
        customer_orders
)
SELECT 
    order_date,
    SUM(CASE WHEN order_date = first_order_date THEN 1 ELSE 0 END) AS new_customer_count,
    SUM(CASE WHEN order_date != first_order_date THEN 1 ELSE 0 END) AS repeat_customer_count,
    SUM(CASE WHEN order_date = first_order_date THEN order_amount ELSE 0 END) AS new_customer_amount,
    SUM(CASE WHEN order_date != first_order_date THEN order_amount ELSE 0 END) AS repeat_customer_amount
FROM 
    customer_orders_with_first_date
GROUP BY 
    order_date
ORDER BY 
    order_date;

-- METHOD-3:

SELECT 
    order_date,
    SUM(CASE WHEN order_date = first_order_date THEN 1 ELSE 0 END) AS new_customer_count,
    SUM(CASE WHEN order_date != first_order_date THEN 1 ELSE 0 END) AS repeat_customer_count,
    SUM(CASE WHEN order_date = first_order_date THEN order_amount ELSE 0 END) AS new_customer_amount,
    SUM(CASE WHEN order_date != first_order_date THEN order_amount ELSE 0 END) AS repeat_customer_amount
FROM (
    SELECT 
        customer_id, 
        order_date, 
        order_amount, 
        MIN(order_date) OVER (PARTITION BY customer_id) AS first_order_date
    FROM 
        customer_orders
) AS subquery
GROUP BY 
    order_date
ORDER BY 
    order_date;