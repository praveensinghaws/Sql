-- Switch to the DEMODB database
USE DEMODB;

-- Select all information about tables in the current database
SELECT *
FROM INFORMATION_SCHEMA.TABLES;

-- Create Products table
CREATE TABLE Products
(
    product_id VARCHAR(10) PRIMARY KEY,
    cost INT NOT NULL
);

-- Insert data into Products table
INSERT INTO Products
    (product_id, cost)
VALUES
    ('P1', 200),
    ('P2', 300),
    ('P3', 300),
    ('P4', 500),
    ('P5', 800);

-- >>>>>>>
-- Problem with Running sum

-- Query 1: Calculate running cost with cumulative sum ordered by cost and product_id
SELECT *,
    SUM(cost) OVER(ORDER BY cost, product_id) AS RUNNING_COST
FROM Products;

-- Query 2: Calculate running cost with cumulative sum ordered by cost, considering all rows up to the current row
SELECT *,
    SUM(cost) OVER(ORDER BY cost ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RUNNING_COST
FROM Products;
