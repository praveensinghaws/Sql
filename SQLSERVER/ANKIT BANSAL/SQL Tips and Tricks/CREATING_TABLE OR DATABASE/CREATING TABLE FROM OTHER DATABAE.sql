-- CREATING TABLE FROM OTHER DATABAE
CREATE DATABASE DEMODB;
-- Use the DEMODB database
USE DEMODB;


-- Check if the ORDERS table exists
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'ORDERS';

-- Create the ORDERS table if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ORDERS')
BEGIN
    CREATE TABLE dbo.ORDERS (
        CustomerKey INT,
        OrderDate DATE,
        SalesTerritoryRegion NVARCHAR(MAX),
        Cust_name NVARCHAR(MAX),
        SalesAmount DECIMAL(18, 2)
        -- Add other columns as needed
    );
END;

-- Insert data into the ORDERS table
INSERT INTO DEMODB.dbo.ORDERS (CustomerKey, OrderDate, SalesTerritoryRegion ,Cust_name, SalesAmount)
SELECT
    s.CustomerKey,
    s.OrderDate,
    st.SalesTerritoryRegion,
    CONCAT(c.FirstName, c.LastName) as Cust_name,
    s.SalesAmount
FROM
   AdventureWorksDW2014. [dbo].[DimCustomer] c
JOIN
   AdventureWorksDW2014. [dbo].[FactInternetSales] s ON c.CustomerKey = s.CustomerKey
   JOIN AdventureWorksDW2014. [dbo].[DimSalesTerritory] st on st.SalesTerritoryKey = s.SalesTerritoryKey;
  
