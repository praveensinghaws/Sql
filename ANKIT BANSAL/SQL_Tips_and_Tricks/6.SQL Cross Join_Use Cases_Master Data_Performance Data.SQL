-- Switch to the DEMODB database
USE DEMODB;

-- Select all information about tables in the current database
SELECT *
FROM INFORMATION_SCHEMA.TABLES;

-- Create the PRODUCTS table
CREATE TABLE PRODUCTS (
    ID INT,
    NAME VARCHAR(10)
);

-- Insert values into the PRODUCTS table
INSERT INTO PRODUCTS VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E');


-- Create the COLORS table
CREATE TABLE COLORS (
    COLOR_ID INT,
    COLOR VARCHAR(10)
);

-- Insert values into the COLORS table
INSERT INTO COLORS VALUES
(1, 'BLUE'),
(2, 'GREEN'),
(3, 'ORANGE');

-- Create the SIZES table
CREATE TABLE SIZES (
    SIZE_ID INT,
    SIZE VARCHAR(10)
);

-- Insert values into the SIZES table
INSERT INTO SIZES VALUES
(1, 'M'),
(2, 'L'),
(3, 'XL');

-- Create the TRANSACTIONS table
CREATE TABLE TRANSACTIONS (
    ORDER_ID INT,
    PRODUCT_NAME VARCHAR(10),
    COLOR VARCHAR(10),
    SIZE VARCHAR(2),
    AMOUNT INT
);

-- Insert values into the TRANSACTIONS table
INSERT INTO TRANSACTIONS VALUES
(1, 'A', 'BLUE', 'L', 300),
(2, 'B', 'BLUE', 'XL', 150),
(3, 'B', 'GREEN', 'L', 250),
(4, 'C', 'BLUE', 'L', 250),
(5, 'E', 'GREEN', 'L', 270),
(6, 'D', 'ORANGE', 'L', 200),
(7, 'D', 'GREEN', 'M', 250);


--- >>>>>>>>

SELECT * FROM PRODUCTS;
SELECT * FROM COLORS;
SELECT * FROM SIZES;
-- Retrieve a Cartesian product of all rows from the PRODUCTS and COLORS tables
SELECT P.*, C.* , S.* FROM PRODUCTS P, COLORS C , SIZES S;

--  USE CASE 1: PREPARE MASTER DATA

SELECT PRODUCT_NAME , COLOR , SIZE , SUM(AMOUNT) AS TOTAL FROM TRANSACTIONS
GROUP BY PRODUCT_NAME , COLOR , SIZE;

-- >>>>>

-- Create a CTE named MASTER_DATA to combine data from PRODUCTS, COLORS, and SIZES
WITH MASTER_DATA AS 
(
    SELECT P.NAME, C.COLOR, S.[SIZE] FROM PRODUCTS P, COLORS C, SIZES S
),

-- Create a CTE named SALES to calculate the total sales for each product, color, and size combination
SALES AS
(
    SELECT PRODUCT_NAME, COLOR, SIZE, SUM(AMOUNT) AS TOTAL FROM TRANSACTIONS
    GROUP BY PRODUCT_NAME, COLOR, SIZE
)

-- Retrieve data from MASTER_DATA and join it with SALES to get total amounts, ordering the result by total amount in descending order
SELECT MD.NAME, MD.COLOR, MD.SIZE, ISNULL(S.TOTAL, 0) AS TOTAL_AMOUNT
FROM MASTER_DATA MD 
LEFT JOIN SALES S ON MD.NAME = S.PRODUCT_NAME AND MD.COLOR = S.COLOR AND MD.SIZE = S.SIZE
ORDER BY TOTAL_AMOUNT DESC;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--  USE CASE 2: PREPARE LARGR NO OF ROWS FOR PERFORMAING TESTING

-- Retrieve all rows from the TRANSACTIONS table
SELECT * FROM TRANSACTIONS;

-- Retrieve all rows from the FactInternetSales table in the AdventureWorksDW2014 database
SELECT * FROM [AdventureWorksDW2014].[dbo].[FactInternetSales];

-- Create a new table TRANSACTIONS_TEST with the same structure as TRANSACTIONS and no data
SELECT * INTO TRANSACTIONS_TEST FROM TRANSACTIONS WHERE 1=2;

-- Retrieve all rows from the newly created TRANSACTIONS_TEST table
SELECT * FROM TRANSACTIONS_TEST;

-- Insert data into TRANSACTIONS_TEST with modified SIZE values based on the order of TRANSACTION_TEST rows
INSERT INTO TRANSACTIONS_TEST
SELECT
    ROW_NUMBER() OVER(ORDER BY T.ORDER_ID) AS ORDER_ID,
    T.PRODUCT_NAME, T.COLOR,
    CASE WHEN ROW_NUMBER() OVER(ORDER BY T.ORDER_ID) % 3 = 0 THEN 'L' ELSE 'XL' END AS SIZE,
    T.AMOUNT
FROM
    TRANSACTIONS T, [AdventureWorksDW2014].[dbo].[FactInternetSales] O, TRANSACTIONS T1;
