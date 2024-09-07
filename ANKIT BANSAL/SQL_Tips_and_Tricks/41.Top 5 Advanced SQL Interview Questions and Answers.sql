------------------------------------------------------------------------------------------------------
   -- Top 5 Advanced SQL Interview Questions and Answers | Frequently Asked SQL interview questions
------------------------------------------------------------------------------------------------------ 
-- Drop the table if it already exists to avoid errors
DROP TABLE IF EXISTS emp;

-- Creating the 'emp' table to store employee details
CREATE TABLE emp
(
    emp_id INT,                   -- Employee ID
    emp_name VARCHAR(20),         -- Employee Name
    department_id INT,            -- Department ID the employee belongs to
    salary INT,                   -- Salary of the employee
    manager_id INT,               -- Manager's Employee ID
    emp_age INT                   -- Age of the employee
);

-- Inserting data into the 'emp' table
INSERT INTO emp VALUES (1, 'Ankit', 100, 10000, 4, 39);
INSERT INTO emp VALUES (2, 'Mohit', 100, 15000, 5, 48);
INSERT INTO emp VALUES (3, 'Vikas', 100, 10000, 4, 37);
INSERT INTO emp VALUES (4, 'Rohit', 100, 5000, 2, 16);
INSERT INTO emp VALUES (5, 'Mudit', 200, 12000, 6, 55);
INSERT INTO emp VALUES (6, 'Agam', 200, 12000, 2, 14);
INSERT INTO emp VALUES (7, 'Sanjay', 200, 9000, 2, 13);
INSERT INTO emp VALUES (8, 'Ashish', 200, 5000, 2, 12);

-- Duplicate record
INSERT INTO emp VALUES (1, 'Saurabh', 900, 12000, 2, 51);

-- Selecting all records from the 'emp' table to verify the inserts
SELECT * FROM emp;

-------------------------------------------------------
 -- Q1: Top 3 Employees by Salary Within Department
-------------------------------------------------------
-- Query 1: Selecting the top 2 highest-paid employees per department using ROW_NUMBER
SELECT * FROM
(
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rn,
        DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rn_dense
    FROM emp
) x
WHERE rn <= 2;

-- Query 2: Selecting employees in the top 2 ranks per department using DENSE_RANK
SELECT * FROM
(
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rn,
        DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rn_dense
    FROM emp
) x
WHERE rn_dense <= 2;

-------------------------------------------------------
 -- Q2: Top 5 Products by Sales
-------------------------------------------------------
-- Define a Common Table Expression (CTE) to aggregate sales by product
WITH CTE AS 
(
    SELECT product_id, SUM(SALES) AS sales 
    FROM orders
    GROUP BY product_id
)
-- Select the top 5 products with the highest sales from the CTE
SELECT TOP 5 product_id, sales 
FROM CTE
ORDER BY sales DESC;

-------------------------------------------------------
 -- Q3: Top 5 Products by Sales from Each Category
-------------------------------------------------------
-- Define a Common Table Expression (CTE) to aggregate sales by category and product
WITH CTE AS 
(
    SELECT category, product_id, SUM(SALES) AS sales 
    FROM orders
    GROUP BY category, product_id
)
-- Apply the window function and select the top 5 products per category
SELECT * FROM 
(
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY category ORDER BY sales DESC) AS RN
    FROM CTE
) X 
WHERE RN <= 5;

-------------------------------------------------------
 -- Q4: Year-over-Year (YoY) Growth
-------------------------------------------------------
-- 1. YoY Growth for All Products

-- Define a Common Table Expression (CTE) to aggregate sales by year
WITH cte AS
(
    SELECT YEAR(order_date) AS Order_Year, 
           SUM(sales) AS sales  
    FROM orders
    GROUP BY YEAR(order_date)
),
-- Define the second CTE to calculate previous year's sales using LAG
cte2 AS
(
    SELECT *,
           LAG(sales, 1, sales) OVER (ORDER BY Order_Year) AS PreviousYearSales
    FROM cte
)
-- Final selection to calculate year-over-year growth and format as a percentage
SELECT *,
       CONCAT((sales - PreviousYearSales) * 100.0 / PreviousYearSales, '%') AS YoyGrowth
FROM cte2;


--2. YoY Growth by Category

-- Define a Common Table Expression (CTE) to aggregate sales by category and year
WITH cte AS
(
    SELECT category, 
           YEAR(order_date) AS Order_Year, 
           SUM(sales) AS sales  
    FROM orders
    GROUP BY category, YEAR(order_date)
),
-- Define the second CTE to calculate previous year's sales using LAG
cte2 AS
(
    SELECT *,
           LAG(sales, 1, sales) OVER (PARTITION BY category ORDER BY Order_Year) AS PreviousYearSales
    FROM cte
)
-- Final selection to calculate year-over-year growth and format as a percentage
SELECT *,
       CONCAT(ROUND((sales - PreviousYearSales) * 100.0 / PreviousYearSales, 2), '%') AS YoyGrowth
FROM cte2;

-- 3. YoY Growth by Product

-- Define a Common Table Expression (CTE) to aggregate sales by product and year
WITH cte AS
(
    SELECT product_id, 
           YEAR(order_date) AS Order_Year, 
           SUM(sales) AS sales  
    FROM orders
    GROUP BY product_id, YEAR(order_date)
),
-- Define the second CTE to calculate previous year's sales using LAG
cte2 AS
(
    SELECT *,
           LAG(sales, 1, sales) OVER (PARTITION BY product_id ORDER BY Order_Year) AS PreviousYearSales
    FROM cte
)
-- Final selection to calculate year-over-year growth and format as a percentage
SELECT *,
       CONCAT(
           ROUND(
               (sales - PreviousYearSales) * 100.0 / NULLIF(PreviousYearSales, 0),  -- Avoid division by zero
               2
           ), 
           '%'
       ) AS YoyGrowth
FROM cte2;
-------------------------------------------------------
 -- Q5: Running/Cumulative Sales and Rolling N Months Sales
-------------------------------------------------------
-- 1. Cumulative Sales Year-wise

-- Define a Common Table Expression (CTE) to calculate total sales per year
WITH CTE AS 
(
    SELECT YEAR(order_date) AS Order_Year, 
           SUM(sales) AS sales  
    FROM orders
    GROUP BY YEAR(order_date)
)
-- Calculate cumulative sales year-wise
SELECT *,
       SUM(sales) OVER (ORDER BY Order_Year) AS CUMULATIVE_SALES
FROM CTE;

--2. Cumulative Sales by Category Year-wise
-- Define a Common Table Expression (CTE) to calculate total sales per category and year
WITH CTE AS 
(
    SELECT CATEGORY, 
           YEAR(order_date) AS Order_Year, 
           SUM(sales) AS sales  
    FROM orders
    GROUP BY CATEGORY, YEAR(order_date)
)
-- Calculate cumulative sales year-wise within each category
SELECT *,
       SUM(sales) OVER (PARTITION BY CATEGORY ORDER BY Order_Year) AS CUMULATIVE_SALES
FROM CTE;

-- 3. Rolling Sales Over a 3-Month Window
-- Define a Common Table Expression (CTE) to aggregate sales by year and month
WITH CTE AS 
(
    SELECT 
        YEAR(ORDER_DATE) AS YEAR_ORDER,
        MONTH(ORDER_DATE) AS MONTH_ORDER,
        SUM(SALES) AS SALES  
    FROM orders
    GROUP BY 
        YEAR(ORDER_DATE),
        MONTH(ORDER_DATE)
)
-- Calculate rolling 3 months sales
SELECT *,
       SUM(SALES) OVER (
           ORDER BY YEAR_ORDER, MONTH_ORDER 
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS ROLLING_3_MONTHS_SALES
FROM CTE;

-- 4. Rolling Sales for the Previous 3 Months
-- Define a Common Table Expression (CTE) to aggregate sales by year and month
WITH CTE AS 
(
    SELECT 
        YEAR(ORDER_DATE) AS YEAR_ORDER,
        MONTH(ORDER_DATE) AS MONTH_ORDER,
        SUM(SALES) AS SALES  
    FROM orders
    GROUP BY 
        YEAR(ORDER_DATE),
        MONTH(ORDER_DATE)
)
-- Calculate rolling sales for the previous 3 months (excluding current month)
SELECT *,
       SUM(SALES) OVER (
           ORDER BY YEAR_ORDER, MONTH_ORDER 
           ROWS BETWEEN 3 PRECEDING AND 1 PRECEDING
       ) AS ROLLING_3_MONTHS_SALES
FROM CTE;
-------------------------------------------------------
 -- Q6: Pivoting
-------------------------------------------------------
--Q: Convert Rows into Columns for Each Category’s Sales by Year
-- Aggregate sales by year and category
SELECT 
    YEAR(ORDER_DATE) AS YEAR_ORDER,
    SUM(CASE WHEN category = 'Furniture' THEN sales ELSE 0 END) AS Furniture_SALES,
    SUM(CASE WHEN category = 'Office Supplies' THEN sales ELSE 0 END) AS Office_Supplies_SALES,
    SUM(CASE WHEN category = 'Technology' THEN sales ELSE 0 END) AS Technology_SALES
FROM orders
GROUP BY YEAR(ORDER_DATE);
-------------------------------------------------------
 -- Q7: Result of Joins
-------------------------------------------------------
-- (Example joins should be provided here based on specific needs, such as INNER JOIN, LEFT JOIN, etc.)
-- Example INNER JOIN
SELECT *
FROM table1 t1
INNER JOIN table2 t2 ON t1.id = t2.id;

-- Example LEFT JOIN
SELECT *
FROM table1 t1
LEFT JOIN table2 t2 ON t1.id = t2.id;
