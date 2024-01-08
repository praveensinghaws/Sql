-- Switching the current database context to TESTDB
USE TESTDB;

-- Create product_master table
create table product_master
(
    product_id int,
    product_name varchar(100)
);

-- Insert data into product_master table
insert into product_master
values(100, 'iphone5'),
    (200, 'hp laptop'),
    (300, 'dell laptop');

-- Create orders_usa table
create table orders_usa
(
    order_id int,
    product_id int,
    sales int
);

-- Insert data into orders_usa table
insert into orders_usa
values
    (1, 100, 500);
insert into orders_usa
values
    (7, 100, 500);

-- Create orders_europe table
create table orders_europe
(
    order_id int,
    product_id int,
    sales int
);

-- Insert data into orders_europe table
insert into orders_europe
values
    (2, 200, 600);

-- Create orders_india table
create table orders_india
(
    order_id int,
    product_id int,
    sales int
);

-- Insert data into orders_india table
insert into orders_india
values
    (3, 100, 500);
insert into orders_india
values
    (4, 200, 600);
insert into orders_india
values
    (8, 100, 500);

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- LAB 
SELECT * FROM orders_usa;
SELECT * FROM orders_europe;
SELECT * FROM orders_india;
SELECT * FROM product_master;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- QUERY-1: Combining sales data from different regions for specific orders

-- Selecting product_id and calculating sales for each region
SELECT 
  COALESCE(U.product_id, E.product_id, I.product_id) as product_id,
  COALESCE(SUM(U.sales), 0) AS SALES_USA,  -- Summing USA sales and handling NULL with COALESCE
  COALESCE(SUM(E.sales), 0) AS SALES_EUROPE,  -- Summing Europe sales and handling NULL with COALESCE
  COALESCE(SUM(I.sales), 0) AS SALES_INDIA  -- Summing India sales and handling NULL with COALESCE
FROM 
  (SELECT * FROM orders_usa WHERE order_id IN (1, 7)) U  -- Selecting USA orders with specific order_ids
  FULL JOIN (SELECT * FROM orders_europe WHERE order_id IN (2)) E ON U.product_id = E.product_id  -- Joining with Europe orders with a specific order_id
  FULL JOIN (SELECT * FROM orders_india WHERE order_id IN (3, 4)) I ON I.product_id = COALESCE(U.product_id, E.product_id)  -- Joining with India orders and handling NULL in product_id
GROUP BY COALESCE(U.product_id, E.product_id, I.product_id);  -- Grouping by the combined product_id to aggregate sales



-- QUERY-2: [ANOTHER WAY]
-- Selecting product_id and aggregated sales data for each region

SELECT 
  COALESCE(U.product_id, E.product_id, I.product_id) as product_id,  -- Using COALESCE to handle NULL values in product_id
  U.sales AS SALES_USA,  -- Selecting USA sales
  E.sales AS SALES_EUROPE,  -- Selecting Europe sales
  I.sales AS SALES_INDIA  -- Selecting India sales
FROM 
  (SELECT product_id, SUM(sales) as Sales FROM orders_usa GROUP BY product_id) U  -- Aggregating USA sales data by product_id
  FULL JOIN (SELECT product_id, SUM(sales) as Sales FROM orders_europe GROUP BY product_id) E ON U.product_id = E.product_id  -- Joining with aggregated Europe sales data
  FULL JOIN (SELECT product_id, SUM(sales) as Sales FROM orders_india GROUP BY product_id) I ON COALESCE(U.product_id, E.product_id) = I.product_id;  -- Joining with aggregated India sales data using COALESCE

-- QUERY-3: [ANOTHER WAY]

-- Creating a Common Table Expression (CTE) named sales_data to combine sales data from different regions

WITH sales_data AS (
  SELECT 
    COALESCE(U.product_id, E.product_id, I.product_id) AS product_id,  -- Handling NULL values in product_id using COALESCE
    U.sales AS SALES_USA,  -- Selecting USA sales
    E.sales AS SALES_EUROPE,  -- Selecting Europe sales
    I.sales AS SALES_INDIA  -- Selecting India sales
  FROM 
    (SELECT product_id, SUM(sales) AS Sales FROM orders_usa GROUP BY product_id) U  -- Aggregating USA sales data by product_id
    FULL JOIN (SELECT product_id, SUM(sales) AS Sales FROM orders_europe GROUP BY product_id) E ON U.product_id = E.product_id  -- Joining with aggregated Europe sales data
    FULL JOIN (SELECT product_id, SUM(sales) AS Sales FROM orders_india GROUP BY product_id) I ON COALESCE(U.product_id, E.product_id) = I.product_id  -- Joining with aggregated India sales data using COALESCE
)

-- Selecting product_name and combined sales data using a RIGHT JOIN with product_master
SELECT pm.product_name, sd.*
FROM sales_data sd
RIGHT JOIN product_master pm ON sd.product_id = pm.product_id;


-- QUERY-4: [ANOTHER WAY]

-- Selecting product_id, product_name, and aggregated sales data for each region

SELECT 
  pm.product_id,
  pm.product_name,
  U.sales AS SALES_USA,  -- Selecting USA sales
  E.sales AS SALES_EUROPE,  -- Selecting Europe sales
  I.sales AS SALES_INDIA  -- Selecting India sales
FROM product_master pm

-- Left join with orders_usa to include USA sales data
LEFT JOIN (SELECT product_id, SUM(sales) as Sales FROM orders_usa GROUP BY product_id) U ON pm.product_id = U.product_id

-- Left join with orders_europe to include Europe sales data
LEFT JOIN (SELECT product_id, SUM(sales) as Sales FROM orders_europe GROUP BY product_id) E ON pm.product_id = E.product_id

-- Left join with orders_india to include India sales data
LEFT JOIN (SELECT product_id, SUM(sales) as Sales FROM orders_india GROUP BY product_id) I ON pm.product_id = I.product_id

-- Filtering out rows where all sales values (USA, Europe, and India) are NULL
WHERE NOT (U.Sales IS NULL AND E.Sales IS NULL AND I.Sales IS NULL);


-- QUERY-5: [ANOTHER WAY]
-- Creating a Common Table Expression (CTE) named sales_data to combine sales data from different regions

WITH sales_data AS (
  SELECT 
    COALESCE(U.product_id, E.product_id, I.product_id) AS product_id,  -- Handling NULL values in product_id using COALESCE
    U.sales AS SALES_USA,  -- Selecting USA sales
    E.sales AS SALES_EUROPE,  -- Selecting Europe sales
    I.sales AS SALES_INDIA  -- Selecting India sales
  FROM (
    SELECT product_id, SUM(sales) AS sales
    FROM orders_usa
    GROUP BY product_id
  ) U  -- Subquery to aggregate USA sales data by product_id
  FULL JOIN (
    SELECT product_id, SUM(sales) AS sales
    FROM orders_europe
    GROUP BY product_id
  ) E ON U.product_id = E.product_id  -- Joining with aggregated Europe sales data
  FULL JOIN (
    SELECT product_id, SUM(sales) AS sales
    FROM orders_india
    GROUP BY product_id
  ) I ON U.product_id = I.product_id OR E.product_id = I.product_id  -- Joining with aggregated India sales data using OR condition
)

-- Selecting product_name and combined sales data using a RIGHT JOIN with product_master
SELECT pm.product_name, sd.*
FROM sales_data sd
RIGHT JOIN product_master pm ON sd.product_id = pm.product_id;

-- QUERY-6: [ANOTHER WAY]
-- Selecting product_id, product_name, and aggregated sales data for each region

SELECT 
  pm.product_id,
  U.sales AS SALES_USA,  -- Selecting USA sales
  E.sales AS SALES_EUROPE,  -- Selecting Europe sales
  I.sales AS SALES_INDIA  -- Selecting India sales
FROM (
  SELECT PRODUCT_ID FROM orders_usa 
  UNION 
  SELECT PRODUCT_ID FROM orders_europe 
  UNION 
  SELECT PRODUCT_ID FROM orders_india
) pm

-- Left join with orders_usa to include USA sales data
LEFT JOIN (
  SELECT product_id, SUM(sales) as Sales 
  FROM orders_usa 
  GROUP BY product_id
) U ON pm.product_id = U.product_id

-- Left join with orders_europe to include Europe sales data
LEFT JOIN (
  SELECT product_id, SUM(sales) as Sales 
  FROM orders_europe 
  GROUP BY product_id
) E ON pm.product_id = E.product_id

-- Left join with orders_india to include India sales data
LEFT JOIN (
  SELECT product_id, SUM(sales) as Sales 
  FROM orders_india 
  GROUP BY product_id
) I ON pm.product_id = I.product_id;

-- QUERY-7: [ANOTHER WAY]

WITH CTE AS (
  SELECT PRODUCT_ID, SALES AS USA_SALES, NULL AS EUROPE_SALES, NULL AS INDIA_SALES FROM orders_usa
  UNION ALL
  SELECT PRODUCT_ID, NULL AS USA_SALES, SALES AS EUROPE_SALES, NULL AS INDIA_SALES FROM orders_europe
  UNION ALL
  SELECT PRODUCT_ID, NULL AS USA_SALES, NULL AS EUROPE_SALES, SALES AS INDIA_SALES FROM orders_india
)

SELECT 
  PRODUCT_ID,
  SUM(USA_SALES) AS USA_SALES,
  SUM(EUROPE_SALES) AS EUROPE_SALES,
  SUM(INDIA_SALES) AS INDIA_SALES
FROM CTE
GROUP BY PRODUCT_ID;
