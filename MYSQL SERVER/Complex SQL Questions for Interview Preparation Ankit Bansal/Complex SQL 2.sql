-- Create a table named 'customer_orders' with columns: order_id, customer_id, order_date, and order_amount
CREATE TABLE customer_orders (
    order_id INTEGER,
    customer_id INTEGER,
    order_date DATE,
    order_amount INTEGER
);

-- Insert data into the 'customer_orders' table
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

--***********************************************************************************************************************************


/*
The script provides a report on the number of new and repeat customers for each order date in the 'customer_orders' table.
 It achieves this by creating temporary tables and using them to calculate and aggregate the relevant information.
*/

-- Create a temporary table 'first_visit' to store the first visit date for each customer
WITH first_visit AS (
    SELECT 
        customer_id,
        MIN(order_date) AS First_Visit_Date
    FROM 
        customer_orders
    GROUP BY 
        customer_id
)

-- Create a temporary table 'visit_flag' to determine if a visit is the first or a repeat visit
, visit_flag AS (
    SELECT 
        co.customer_id,
        co.order_date,
        fv.first_visit_date,
        CASE WHEN co.order_date = fv.first_visit_date THEN 1 ELSE 0 END AS first_visit_flag,
        CASE WHEN co.order_date != fv.first_visit_date THEN 1 ELSE 0 END AS repeat_visit_flag
    FROM 
        customer_orders co
        INNER JOIN first_visit fv ON fv.customer_id = co.customer_id
)

-- Select the order date, the number of new customers, and the number of repeat customers
SELECT 
    order_date,
    SUM(first_visit_flag) AS No_of_New_Customer,
    SUM(repeat_visit_flag) AS No_of_Repeat_Customer
FROM 
    visit_flag
GROUP BY 
    order_date;
