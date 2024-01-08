-- All About SQL Aggregations | SQL Advance | Zero to Hero

-- Switch to the DEMODB database
USE DEMODB;

-- Select all information about tables in the current database
SELECT *
FROM INFORMATION_SCHEMA.TABLES;

-- DDL and DML:
CREATE TABLE [dbo].[int_orders](
 [order_number] [int] NOT NULL,
 [order_date] [date] NOT NULL,
 [cust_id] [int] NOT NULL,
 [salesperson_id] [int] NOT NULL,
 [amount] [float] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (30, CAST(N'1995-07-14' AS Date), 9, 1, 460)
INSERT [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (10, CAST(N'1996-08-02' AS Date), 4, 2, 540)
INSERT [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (40, CAST(N'1998-01-29' AS Date), 7, 2, 2400)
INSERT [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (50, CAST(N'1998-02-03' AS Date), 6, 7, 600)
INSERT [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (60, CAST(N'1998-03-02' AS Date), 6, 7, 720)
INSERT [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (70, CAST(N'1998-05-06' AS Date), 9, 7, 150)
INSERT [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (20, CAST(N'1999-01-30' AS Date), 4, 8, 1800)

-- QUERY 1
-- Calculate the total sales by summing the 'amount' column
SELECT SUM(amount) AS TOTAL_SALES 
FROM int_orders;

-- QUERY 2
-- Calculate the total sales for each salesperson by summing the 'amount' column, grouped by salesperson
SELECT SALESPERSON_ID, SUM(amount) AS TOTAL_SALES 
FROM int_orders
GROUP BY SALESPERSON_ID;

-- QUERY 3
-- Calculate the cumulative total sales for each salesperson using a window function
SELECT SALESPERSON_ID, order_number, order_date, amount,
       SUM(amount) OVER(PARTITION BY SALESPERSON_ID ORDER BY order_date) AS TOTAL_SALES
FROM int_orders;

-- QUERY 4
-- Calculate the rolling sum of sales over a specified window for each salesperson using a window function
SELECT SALESPERSON_ID, order_number, order_date, amount,
       SUM(amount) OVER(ORDER BY order_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS TOTAL_SALES
FROM int_orders;

-- QUERY 5
-- Calculate the rolling sum of sales over a specified window excluding the current row for each salesperson using a window function
SELECT SALESPERSON_ID, order_number, order_date, amount,
       SUM(amount) OVER(ORDER BY order_date ROWS BETWEEN 2 PRECEDING AND 1 PRECEDING) AS TOTAL_SALES
FROM int_orders;

-- QUERY 6
-- Calculate the cumulative sum of sales for each salesperson from the beginning to the current row using a window function
SELECT SALESPERSON_ID, order_number, order_date, amount,
       SUM(amount) OVER(ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS TOTAL_SALES
FROM int_orders;


-- QUERY 7
-- Calculate the cumulative sum of sales for each salesperson over a specified window using a window function
SELECT SALESPERSON_ID, order_number, order_date, amount,
       SUM(amount) OVER(PARTITION BY SALESPERSON_ID ORDER BY order_date ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS TOTAL_SALES
FROM int_orders;

-- QUERY 8
-- Calculate the rolling sum of sales for each salesperson over a window of the preceding row only using a window function
SELECT SALESPERSON_ID, order_number, order_date, amount,
       SUM(amount) OVER(ORDER BY order_date ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING) AS TOTAL_SALES
FROM int_orders;


-- QUERY 9
-- Calculate the rolling sum of sales for each salesperson over a window of the following row only using a window function
SELECT SALESPERSON_ID, order_number, order_date, amount,
       SUM(amount) OVER(ORDER BY order_date ROWS BETWEEN 1 FOLLOWING AND 1 FOLLOWING) AS TOTAL_SALES
FROM int_orders;

