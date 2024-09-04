-- LAB ON POSTGRESQL
-- Normal Views vs Materialized Views

SELECT * from information_schema.VIEWS WHERE table_schema = 'public';
-- Step 1: Create the orders Table

-- Drop the orders table if it exists
DROP TABLE IF EXISTS orders;

-- Create the orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE,
    product_name VARCHAR(50),
    sales DECIMAL(10, 2)
);

-- Insert 10 records into the orders table
INSERT INTO orders (order_date, product_name, sales) VALUES
    ('2024-09-01', 'iphone13', 40000),
    ('2024-09-02', 'iphone14', 70000),
    ('2024-09-03', 'iphone15', 60000),
    ('2024-09-04', 'iphone16', 100000),
    ('2024-09-05', 'ipad', 30000),
    ('2024-09-06', 'macbook', 120000),
    ('2024-09-07', 'apple watch', 25000),
    ('2024-09-08', 'airpods', 15000),
    ('2024-09-09', 'mac mini', 70000),
    ('2024-09-10', 'mac studio', 200000);

-- Check the data in the orders table
SELECT * FROM orders;

-- Step 2: Create the returns Table

-- Drop the returns table if it exists
DROP TABLE IF EXISTS returns;

-- Create the returns table
CREATE TABLE returns (
    return_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    return_date DATE
);

-- Insert at least 3 records into the returns table
INSERT INTO returns (order_id, return_date) VALUES
    (1, '2024-09-05'),
    (4, '2024-09-07'),
    (7, '2024-09-09');

-- Check the data in the returns table
SELECT * FROM returns;

-------------------------
-- Creating Normal Views
-------------------------

-- Create a view that combines orders and returns using a LEFT JOIN
CREATE VIEW vw_orders AS
SELECT o.*, r.return_date
FROM orders o 
LEFT JOIN returns r 
ON o.order_id = r.order_id
ORDER BY o.order_id;

-- Display the content of the view to check the current data
SELECT * FROM vw_orders;

-- Insert a new record into the orders table
INSERT INTO orders (order_date, product_name, sales) VALUES
    ('2024-09-01', 'MacMiniM2', 49999);

-- Display the updated view to see the new record
SELECT * FROM vw_orders;

-- Delete a specific record from the orders table
DELETE FROM orders WHERE order_id = 11;

-- Display the view again to check the result after deletion
SELECT * FROM vw_orders;

-- Method 1: Using pg_catalog.pg_views
SELECT schemaname, viewname
FROM pg_catalog.pg_views
WHERE schemaname = 'public'
ORDER BY schemaname, viewname;

-- Method 2: Using information_schema.views
SELECT table_schema, table_name
FROM information_schema.views
WHERE table_schema = 'public'
ORDER BY table_schema, table_name;

-- Method 3: Using \dv Command in psql
\dv
-------------------------------
-- Creating Materialized Views
-------------------------------

-- Create a materialized view that combines orders and returns
CREATE MATERIALIZED VIEW mvw_orders AS
SELECT o.*, r.return_date
FROM orders o 
LEFT JOIN returns r 
ON o.order_id = r.order_id
ORDER BY o.order_id;

-- Display the content of the materialized view to check the current data
SELECT * FROM mvw_orders;

-- Insert a new record into the orders table
INSERT INTO orders (order_date, product_name, sales) VALUES
    ('2024-09-01', 'MacMiniM2', 49999);

-- Display the materialized view; it won't show the new record yet
SELECT * FROM mvw_orders;

-- Refresh the materialized view to include the latest changes from the orders table
REFRESH MATERIALIZED VIEW mvw_orders;

-- Display the materialized view after refreshing to see the new record
SELECT * FROM mvw_orders;

-- Drop the existing materialized view
DROP MATERIALIZED VIEW mvw_orders;

-- Recreate the materialized view with no initial data
CREATE MATERIALIZED VIEW mvw_orders AS
SELECT o.*, r.return_date
FROM orders o 
LEFT JOIN returns r 
ON o.order_id = r.order_id
ORDER BY o.order_id
WITH NO DATA;

-- Display the empty materialized view
SELECT * FROM mvw_orders;

-- Refresh the materialized view (no data will be included yet)
REFRESH MATERIALIZED VIEW mvw_orders;

-- Display the materialized view; it will still be empty
SELECT * FROM mvw_orders;

-- Delete a specific record from the orders table
DELETE FROM orders WHERE order_id = 12;

-- Display the materialized view; it will still be empty since it was created with NO DATA
SELECT * FROM mvw_orders;

-- Refresh the materialized view to reflect the current state (still empty)
REFRESH MATERIALIZED VIEW mvw_orders;

-- Display the materialized view after refreshing; it remains empty
SELECT * FROM mvw_orders;

-- Method 1: Using pg_catalog.pg_matviews
SELECT schemaname, matviewname
FROM pg_catalog.pg_matviews
ORDER BY schemaname, matviewname;

-- Method 2: Using information_schema  
-- Note that this method might not be available in all versions of PostgreSQL, 
-- as information_schema might not include materialized views by default.

SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_type = 'MATVIEW'
ORDER BY table_schema, table_name;

-- Method 3: Using psql Command Line
\dm