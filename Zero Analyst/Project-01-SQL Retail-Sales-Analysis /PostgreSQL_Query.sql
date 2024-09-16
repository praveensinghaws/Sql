---------------------------------------------
     -- SQL Retail Sales Analysis - P1
---------------------------------------------

-- SQL Retail Sales Analysis - P1

-- Create the database
CREATE DATABASE sql_project1;

-- Switch to the new databasea
\c sql_project1

-- Drop the table if it already exists
DROP TABLE IF EXISTS retail_sales;

-- Create the table
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

-- Upload the CSV file into the table
-- Ensure the CSV file is placed in /Users/praveen/Downloads
\copy retail_sales(transaction_id, sale_date, sale_time, customer_id, gender, age, category, quantity, price_per_unit, cogs, total_sale)
FROM '/Users/praveen/Downloads/SQL - Retail Sales Analysis_utf .csv'
DELIMITER ',' CSV HEADER;

----------------------------------------------------------------

-- Data Cleaning
-- Count total rows in the table
SELECT COUNT(*) FROM retail_sales;

-- Find rows with NULL values in specific columns
SELECT * FROM retail_sales WHERE transaction_id IS NULL;
SELECT * FROM retail_sales WHERE sale_date IS NULL;
SELECT * FROM retail_sales WHERE sale_time IS NULL;
SELECT * FROM retail_sales WHERE transaction_id IS NULL OR sale_date IS NULL OR sale_time IS NULL OR gender IS NULL OR category IS NULL OR quantity IS NULL OR cogs IS NULL OR total_sale IS NULL;

-- Delete rows with NULL values in specific columns
DELETE FROM retail_sales WHERE transaction_id IS NULL OR sale_date IS NULL OR sale_time IS NULL OR gender IS NULL OR category IS NULL OR quantity IS NULL OR cogs IS NULL OR total_sale IS NULL;

-- Data Exploration
-- How many sales do we have?
SELECT COUNT(*) AS total_sales FROM retail_sales;

-- How many unique customers do we have?
SELECT COUNT(DISTINCT customer_id) AS total_customers FROM retail_sales;

-- List distinct categories
SELECT DISTINCT category FROM retail_sales;

-- Data Analysis & Business Key Problems & Answers

-- Q1: Retrieve all columns for sales made on '2022-11-05'
SELECT * FROM retail_sales WHERE sale_date = '2022-11-05';

-- Q2: Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in November 2022
SELECT * FROM retail_sales
WHERE category = 'Clothing'
AND TO_CHAR(sale_date, 'YYYY-MM')= '2022-11'
AND quantity > 3;

-- OR
SELECT * FROM retail_sales
WHERE category = 'Clothing'
AND EXTRACT(YEAR FROM sale_date) = 2022
AND EXTRACT(MONTH FROM sale_date) = 11
AND quantity > 3;

-- Q3: Calculate the total sales (total_sale) for each category
SELECT category, SUM(total_sale) AS total_sales, COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;

-- Q4: Find the average age of customers who purchased items from the 'Beauty' category
SELECT ROUND(AVG(age), 2) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';

-- Q5: Find all transactions where the total_sale is greater than 1000
SELECT * FROM retail_sales WHERE total_sale > 1000;

-- Q6: Find the total number of transactions (transaction_id) made by each gender in each category
SELECT category, gender, COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY category, gender
ORDER BY category;

-- Q7: Calculate the average sale for each month and find out the best-selling month in each year
SELECT year, month, avg_sale
FROM (
    SELECT EXTRACT(YEAR FROM sale_date) AS year,
           EXTRACT(MONTH FROM sale_date) AS month,
           AVG(total_sale) AS avg_sale,
           RANK() OVER (PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) AS rank_
    FROM retail_sales
    GROUP BY year, month
) AS ranked_sales
WHERE rank_ = 1;

-- Q8: Find the top 5 customers based on the highest total sales
SELECT customer_id, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

-- Q9: Find the number of unique customers who purchased items from each category
SELECT category, COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;

-- Q10: Create shifts and count the number of orders (e.g., Morning <12, Afternoon 12-17, Evening >17)
WITH hourly_sale AS (
    SELECT *,
           CASE
               WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
               WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
               ELSE 'Evening'
           END AS shift
    FROM retail_sales
)
SELECT shift, COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift;

-- End of project
