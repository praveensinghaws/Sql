---------------------------------------------
     -- SQL Retail Sales Analysis - P1
---------------------------------------------

-- Enable advanced options
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;

-- Enable Ad Hoc Distributed Queries
EXEC sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;

-- Verify Ad Hoc Distributed Queries is enabled
EXEC sp_configure 'Ad Hoc Distributed Queries';

-- Create the database if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'sql_project1')
BEGIN
    CREATE DATABASE sql_project1;
END
GO

-- Switch to the new database
USE sql_project1;
GO

-- Create the table if it doesn't exist
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'retail_sales' AND xtype = 'U')
BEGIN
    CREATE TABLE retail_sales
    (
        transaction_id INT PRIMARY KEY,
        sale_date DATE,
        sale_time TIME,
        customer_id INT,
        gender VARCHAR(15),
        age INT,
        category VARCHAR(15),
        quantity INT,
        price_per_unit FLOAT,
        cogs FLOAT,
        total_sale FLOAT
    );
END
GO

-- Import CSV data into the table
BULK INSERT retail_sales
FROM '/var/opt/mssql/data/Retail_Sales_Analysis.csv'
WITH
(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
GO

----------------------------------------------------------------
-- Data Cleaning
-- Count total rows in the table
SELECT COUNT(*) AS total_rows FROM retail_sales;

-- Find rows with NULL values in specific columns
SELECT * FROM retail_sales WHERE transaction_id IS NULL;
SELECT * FROM retail_sales WHERE sale_date IS NULL;
SELECT * FROM retail_sales WHERE sale_time IS NULL;
SELECT * FROM retail_sales WHERE transaction_id IS NULL 
                              OR sale_date IS NULL 
                              OR sale_time IS NULL 
                              OR gender IS NULL 
                              OR category IS NULL 
                              OR quantity IS NULL 
                              OR cogs IS NULL 
                              OR total_sale IS NULL;

-- Delete rows with NULL values in specific columns
DELETE FROM retail_sales WHERE transaction_id IS NULL 
                              OR sale_date IS NULL 
                              OR sale_time IS NULL 
                              OR gender IS NULL 
                              OR category IS NULL 
                              OR quantity IS NULL 
                              OR cogs IS NULL 
                              OR total_sale IS NULL;
GO

-- Data Exploration
-- How many sales do we have?
SELECT COUNT(*) AS total_sales FROM retail_sales;

-- How many unique customers do we have?
SELECT COUNT(DISTINCT customer_id) AS total_customers FROM retail_sales;

-- List distinct categories
SELECT DISTINCT category FROM retail_sales;
GO

-- Data Analysis & Business Key Problems & Answers

-- Q1: Retrieve all columns for sales made on '2022-11-05'
SELECT * FROM retail_sales WHERE sale_date = '2022-11-05';

-- Q2: Retrieve transactions where the category is 'Clothing' and quantity > 10 in November 2022
SELECT * FROM retail_sales
WHERE category = 'Clothing'
AND YEAR(sale_date) = 2022
AND MONTH(sale_date) = 11
AND quantity > 3;

-- Q3: Calculate total sales for each category
SELECT category, SUM(total_sale) AS total_sales, COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;

-- Q4: Find average age of customers who purchased 'Beauty' category
SELECT ROUND(AVG(age), 2) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';

-- Q5: Find transactions where total_sale is greater than 1000
SELECT * FROM retail_sales WHERE total_sale > 1000;

-- Q6: Find total number of transactions by each gender in each category
SELECT category, gender, COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY category, gender
ORDER BY category;

-- Q7: Calculate average sale for each month and find the best-selling month in each year
SELECT year, month, avg_sale
FROM (
    SELECT YEAR(sale_date) AS year,
           MONTH(sale_date) AS month,
           AVG(total_sale) AS avg_sale,
           RANK() OVER (PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) AS rank_
    FROM retail_sales
    GROUP BY YEAR(sale_date), MONTH(sale_date)
) AS ranked_sales
WHERE rank_ = 1;

-- Q8: Find top 5 customers based on the highest total sales
SELECT TOP 5 customer_id, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC;

-- Q9: Find number of unique customers who purchased items from each category
SELECT category, COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;

-- Q10: Create shifts and count the number of orders (e.g., Morning <12, Afternoon 12-17, Evening >17)
WITH hourly_sale AS (
    SELECT *,
           CASE
               WHEN DATEPART(hour, sale_time) < 12 THEN 'Morning'
               WHEN DATEPART(hour, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
               ELSE 'Evening'
           END AS shift
    FROM retail_sales
)
SELECT shift, COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift;

-- End of project
GO