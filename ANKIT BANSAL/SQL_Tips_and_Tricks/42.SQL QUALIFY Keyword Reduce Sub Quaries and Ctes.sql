/*
Certainly! To reduce subqueries and CTEs (Common Table Expressions) and make the SQL queries more efficient, 
you can use the `QUALIFY` keyword in databases that support it, like Snowflake or some other SQL dialects. 
The `QUALIFY` keyword helps in filtering results from window functions more directly and concisely.
Here's how you can simplify some of the queries using the `QUALIFY` keyword:
*/

-- ### **1. Top 2 Highest-Paid Employees Per Department**

-- **Original Query:**
SELECT * FROM
(
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rn,
        DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rn_dense
    FROM emp
) x
WHERE rn <= 2;

-- **Reduced with QUALIFY: ON SNOWFLAKE**
SELECT *,
       ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rn
FROM emp
QUALIFY rn <= 2;

-- ### **2. Top 5 Products by Sales**

-- **Original Query:**
WITH CTE AS 
(
    SELECT product_id, SUM(sales) AS sales 
    FROM orders
    GROUP BY product_id
)
SELECT TOP 5 product_id, sales 
FROM CTE
ORDER BY sales DESC;

-- **Reduced with QUALIFY: ON SNOWFLAKE**
SELECT product_id, 
       SUM(sales) AS sales
FROM orders
GROUP BY product_id
QUALIFY ROW_NUMBER() OVER (ORDER BY sales DESC) <= 5;

-- ### **3. Top 5 Products by Sales from Each Category**

-- **Original Query:**
WITH CTE AS 
(
    SELECT category, product_id, SUM(sales) AS sales 
    FROM orders
    GROUP BY category, product_id
)
SELECT * FROM 
(
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY category ORDER BY sales DESC) AS RN
    FROM CTE
) X 
WHERE RN <= 5;

-- **Reduced with QUALIFY: ON SNOWFLAKE**
SELECT category, product_id, 
       SUM(sales) AS sales
FROM orders
GROUP BY category, product_id
QUALIFY ROW_NUMBER() OVER(PARTITION BY category ORDER BY sales DESC) <= 5;

-- ### **4. Year-Over-Year Growth**

-- **Original Query:**
WITH cte AS
(
    SELECT YEAR(order_date) AS Order_Year, 
           SUM(sales) AS sales  
    FROM orders
    GROUP BY YEAR(order_date)
),
cte2 AS
(
    SELECT *,
           LAG(sales, 1, sales) OVER(ORDER BY Order_Year) AS PreviousYearSales
    FROM cte
)
SELECT *,
       CONCAT((sales - PreviousYearSales) * 100.0 / PreviousYearSales, '%') AS YoyGrowth
FROM cte2;

-- **Reduced with QUALIFY: ON SNOWFLAKE**
SELECT Order_Year,
       sales,
       LAG(sales, 1, sales) OVER(ORDER BY Order_Year) AS PreviousYearSales,
       CONCAT(ROUND((sales - LAG(sales, 1, sales) OVER(ORDER BY Order_Year)) * 100.0 / NULLIF(LAG(sales, 1, sales) OVER(ORDER BY Order_Year), 0), 2), '%') AS YoyGrowth
FROM
(
    SELECT YEAR(order_date) AS Order_Year, 
           SUM(sales) AS sales  
    FROM orders
    GROUP BY YEAR(order_date)
) cte;

-- ### **5. Cumulative Sales**

-- **Original Query:**
WITH CTE AS 
(
    SELECT YEAR(order_date) AS Order_Year, 
           SUM(sales) AS sales  
    FROM orders
    GROUP BY YEAR(order_date)
)
SELECT *,
       SUM(sales) OVER(ORDER BY Order_Year) AS CUMULATIVE_SALES
FROM CTE;

-- **Reduced with QUALIFY: ON SNOWFLAKE**
SELECT YEAR(order_date) AS Order_Year, 
       SUM(sales) AS sales,
       SUM(SUM(sales)) OVER(ORDER BY YEAR(order_date)) AS CUMULATIVE_SALES
FROM orders
GROUP BY YEAR(order_date);


------------------------------------------------------------------------------------
/*To import data from your data.txt file into Snowflake, you can follow these steps:

	1.	Prepare the Snowflake Environment:
	•	Create a database, schema, and table in Snowflake where you will load the data.
	2.	Upload the Data File to Snowflake Stage:
	•	Use Snowflake’s internal or external stage to upload the file.
	3.	Load Data from the Stage to the Table:
	•	Use Snowflake’s COPY INTO command to load the data into the table.

Detailed Steps:
*/
-- Step 1: Create or Replace Database and Schema
CREATE OR REPLACE DATABASE DEMODB;
CREATE OR REPLACE SCHEMA PUBLIC;

-- Step 2: Create the Table
CREATE OR REPLACE TABLE DEMODB.PUBLIC.ORDERS (
    ORDER_ID STRING,
    ORDER_DATE DATE,
    PRODUCT_ID STRING,
    CATEGORY STRING,
    SALES FLOAT
);

-- Step 3: Create or Replace File Format
CREATE OR REPLACE FILE FORMAT MY_CSV_FORMAT
    TYPE = 'CSV'
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    FIELD_DELIMITER = '\t'  -- Use tab as delimiter
    SKIP_HEADER = 1;        -- Skip header row if present

-- Step 4: Create or Replace Stage
CREATE OR REPLACE STAGE MY_STAGE;

-- Step 5: Upload Data File to Stage
-- Ensure to use the correct path to your data file
PUT file:///Users/praveen/Downloads/data.txt @MY_STAGE;

-- Step 6: Load Data into Table
COPY INTO DEMODB.PUBLIC.ORDERS
    FROM @MY_STAGE/data.txt
    FILE_FORMAT = (FORMAT_NAME = MY_CSV_FORMAT)
    ON_ERROR = 'CONTINUE'; -- Optional, to handle errors gracefully

-- Step 7: Verify Data
SELECT * FROM DEMODB.PUBLIC.ORDERS LIMIT 5;