USE DEMOBD;
-- PROBLEM STATEMENT : FIND TOP 25 AND BOTTOM 25 PERCENT CUSTOMERS BY SALES

/* The NTILE Analytical function is used to divide a result set into a specified number of groups or buckets based on a specific column
    Each row in The result set is assigned a group number that represents its position within the ordered Set set Data. */

-- QUERY:1

-- Common Table Expression (CTE) to calculate total sales for each customer
WITH CTE AS (
    SELECT TOP 16
        CUST_NAME,
        SUM(SALESAMOUNT) AS TOTAL_SALES
    FROM
        ORDERS
    GROUP BY
        CUST_NAME
    ORDER BY
        TOTAL_SALES DESC
)
-- Select from the CTE and apply NTILE to divide customers into groups
SELECT
    *,
    NTILE(4) OVER (ORDER BY TOTAL_SALES DESC) AS CUST_GROUPS
FROM
    CTE;

-- QUERY:2
-- Common Table Expression (CTE) to calculate total sales for each customer
WITH CTE AS (
    -- Select the top 16 customers based on descending total sales
    SELECT TOP 16
        CUST_NAME,
        SUM(SALESAMOUNT) AS TOTAL_SALES
    FROM
        ORDERS
    GROUP BY
        CUST_NAME
    ORDER BY
        TOTAL_SALES DESC
)
-- Select from the CTE and apply NTILE to divide customers into groups
SELECT
    *,
    CUST_GROUPS
FROM (
    SELECT
        *,
        NTILE(4) OVER (ORDER BY TOTAL_SALES DESC) AS CUST_GROUPS
    FROM
        CTE
) X
WHERE
    CUST_GROUPS = 1;


-- QUERY:3
-- Common Table Expression (CTE) to calculate total sales for each customer
WITH CTE AS (
    -- Select the top 17 customers based on descending total sales
    SELECT TOP 17
        CUST_NAME,
        SUM(SALESAMOUNT) AS TOTAL_SALES
    FROM
        ORDERS
    GROUP BY
        CUST_NAME
    ORDER BY
        TOTAL_SALES DESC
)
-- Select from the CTE and apply NTILE to divide customers into groups
SELECT
    *,
    NTILE(4) OVER (ORDER BY TOTAL_SALES DESC) AS CUST_GROUPS
FROM
    CTE;


-- QUERY:4
-- Common Table Expression (CTE) to calculate total sales for each customer
WITH CTE AS (
    -- Select the top 18 customers based on descending total sales
    SELECT TOP 18
        CUST_NAME,
        SUM(SALESAMOUNT) AS TOTAL_SALES
    FROM
        ORDERS
    GROUP BY
        CUST_NAME
    ORDER BY
        TOTAL_SALES DESC
)
-- Select from the CTE and apply NTILE to divide customers into groups
SELECT
    *,
    NTILE(4) OVER (ORDER BY TOTAL_SALES DESC) AS CUST_GROUPS
FROM
    CTE;

-- QUERY:5
-- Common Table Expression (CTE) to calculate total sales for each customer
WITH CTE AS (
    -- Select the top 40 customers based on descending total sales
    SELECT TOP 40
        CUST_NAME,
        SUM(SALESAMOUNT) AS TOTAL_SALES
    FROM
        ORDERS
    GROUP BY
        CUST_NAME
    ORDER BY
        TOTAL_SALES DESC
)
-- Select from the CTE and apply NTILE to divide customers into groups
SELECT
    *,
    NTILE(10) OVER (ORDER BY TOTAL_SALES DESC) AS CUST_GROUPS
FROM
    CTE;
---==============
-- QUERY:6
-- Common Table Expression (CTE) to calculate total sales for each customer in each sales territory
WITH CTE AS (
    -- Select the top 40 customers in each sales territory based on descending total sales
    SELECT TOP 40
        CUST_NAME,
        SalesTerritoryRegion,
        SUM(SALESAMOUNT) AS TOTAL_SALES
    FROM
        ORDERS
    GROUP BY
        CUST_NAME, SalesTerritoryRegion
    ORDER BY
        SalesTerritoryRegion, TOTAL_SALES DESC
)
-- Select from the CTE and apply NTILE to divide customers into groups
SELECT
    *,
    NTILE(10) OVER (ORDER BY TOTAL_SALES DESC) AS CUST_GROUPS
FROM
    CTE;


    -- QUERY:7
-- Common Table Expression (CTE) to calculate total sales for each customer in each sales territory
WITH CTE AS (
    -- Select the top 40 customers in each sales territory based on descending total sales
    SELECT TOP 40
        CUST_NAME,
        SalesTerritoryRegion,
        SUM(SALESAMOUNT) AS TOTAL_SALES
    FROM
        ORDERS
    GROUP BY
        CUST_NAME, SalesTerritoryRegion
    )
-- Select from the CTE and apply NTILE to divide customers into groups
SELECT
    *,
    NTILE(4) OVER (partition by SalesTerritoryRegion ORDER BY TOTAL_SALES DESC) AS CUST_GROUPS
FROM
    CTE;



