-- QUERY 1: Calculate Rolling 3-Month Sum
-- Use AdventureWorksDW2014 database
USE AdventureWorksDW2014;

-- Create a Common Table Expression (CTE) to calculate yearly and monthly sales
WITH Year_Month_Sales AS (
    SELECT
        DATEPART(YEAR, OrderDate) as Year_order,
        DATEPART(MONTH, OrderDate) as Month_order,
        SUM(SalesAmount) as Sales
    FROM [AdventureWorksDW2014].[dbo].[FactInternetSales]
    GROUP BY DATEPART(YEAR, OrderDate), DATEPART(MONTH, OrderDate)
)
-- Select from the CTE and calculate rolling 3-month aggregates
SELECT *,
    SUM(SALES) OVER(ORDER BY Year_order ASC, Month_order ASC ROWS BETWEEN 2 PRECEDING AND 0 PRECEDING) AS Rolling_Sum,
    AVG(SALES) OVER(ORDER BY Year_order ASC, Month_order ASC ROWS BETWEEN 2 PRECEDING AND 0 PRECEDING) AS Rolling_Avg,
    MIN(SALES) OVER(ORDER BY Year_order ASC, Month_order ASC ROWS BETWEEN 2 PRECEDING AND 0 PRECEDING) AS Rolling_Min,
    MAX(SALES) OVER(ORDER BY Year_order ASC, Month_order ASC ROWS BETWEEN 2 PRECEDING AND 0 PRECEDING) AS Rolling_Max
FROM Year_Month_Sales;


--QUERY 2: Calculate Rolling 3-Month Sum
-- Use AdventureWorksDW2014 database
USE AdventureWorksDW2014;

-- Create a Common Table Expression (CTE) to calculate yearly and monthly sales
WITH Year_Month_Sales AS (
    SELECT
        DATEPART(YEAR, OrderDate) as Year_order,
        DATEPART(MONTH, OrderDate) as Month_order,
        SUM(SalesAmount) as Sales
    FROM [AdventureWorksDW2014].[dbo].[FactInternetSales]
    GROUP BY DATEPART(YEAR, OrderDate), DATEPART(MONTH, OrderDate)
)
-- Select from the CTE and calculate rolling 3-month aggregates
SELECT *,
    SUM(SALES) OVER(ORDER BY Year_order ASC, Month_order ASC ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS Rolling_Sum,
    AVG(SALES) OVER(ORDER BY Year_order ASC, Month_order ASC ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS Rolling_Avg,
    MIN(SALES) OVER(ORDER BY Year_order ASC, Month_order ASC ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS Rolling_Min,
    MAX(SALES) OVER(ORDER BY Year_order ASC, Month_order ASC ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS Rolling_Max
FROM Year_Month_Sales;
