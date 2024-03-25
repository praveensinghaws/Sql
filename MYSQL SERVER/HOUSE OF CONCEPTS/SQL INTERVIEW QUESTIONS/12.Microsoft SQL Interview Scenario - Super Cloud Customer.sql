--CREATE Script
CREATE TABLE [dbo].[AzureProducts](
	[ProductId] [int] NULL,
	[ProductCategory] [varchar](100) NULL,
	[ProductName] [varchar](100) NULL
)

CREATE TABLE [dbo].[AzureCustomers](
	[CustomerId] [int] NULL,
	[ProductId] [int] NULL,
	[Amount] [int] NULL
)

--INSERT Script
INSERT [dbo].[AzureProducts] ([ProductId], [ProductCategory], [ProductName]) 
VALUES (1, N'Databases', N'Azure Cache for Redis')
, (2, N'Databases', N'Azure Database Migration Service')
, (3, N'Databases', N'Azure SQL Database')
, (4, N'Integration', N'API Management')
, (5, N'Integration', N'Logic Apps')
, (6, N'DevOps', N'Azure DevOps')
, (7, N'DevOps', N'Azure Test Plans')
, (8, N'Containers', N'Azure Red Hat OpenShift')
, (9, N'Containers', N'Azure Container Registry')

INSERT [dbo].[AzureCustomers] ([CustomerId], [ProductId], [Amount]) 
VALUES (1, 2, 8000)
,(1, 4, 4000)
,(1, 3, 4000)
,(1, 1, 4000)
,(2, 6, 3000)
,(2, 9, 7000)
,(2, 8, 9000)
,(2, 7, 7000)
,(2, 5, 9000)
,(3, 2, 1000)
,(3, 5, 2000)
,(3, 6, 3000)
,(3, 9, 6000)
,(4, 2, 6800)

/*
 Scenario :
A Microsoft Azure Supercloud customer is a company which buys at least 1 product from each product category.

Write a query to report the company ID which is a Supercloud customer.
*/

-- Solution 1 Using CTE
WITH customer_product AS (
    SELECT 
        A.CustomerId,
        COUNT(DISTINCT B.PRODUCTCATEGORY) AS categoryCount
    FROM 
        AzureCustomers A
    INNER JOIN 
        AzureProducts B ON A.ProductId = B.ProductId
    GROUP BY 
        A.CustomerId
)

SELECT 
    CustomerId 
FROM 
    customer_product 
WHERE 
    categoryCount = (SELECT COUNT(DISTINCT ProductCategory) FROM AzureProducts);


-- Solution 2 Using Subquery 
SELECT 
    CustomerId 
FROM (
    SELECT 
        A.CustomerId, 
        COUNT(DISTINCT B.ProductCategory) AS Total_Count
    FROM 
        AzureCustomers A 
    INNER JOIN 
        AzureProducts B ON A.ProductId = B.ProductId
    GROUP BY 
        A.CustomerId
) AS TempResult
WHERE 
    Total_Count = 4;