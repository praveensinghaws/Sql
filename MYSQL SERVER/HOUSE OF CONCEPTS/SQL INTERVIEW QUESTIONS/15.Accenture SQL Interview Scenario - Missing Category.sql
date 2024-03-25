--CREATE Script
CREATE TABLE ProductDetails
(
ProductId INT,
Category VARCHAR(100),
ProductName VARCHAR(100)
)

--INSERT Script
INSERT [dbo].[ProductDetails] ([ProductId], [Category], [ProductName]) 
VALUES 
(1, N'Mobile', N'Iphone')
,(2, NULL, N'Samsung Galaxy')
,(3, NULL, N'Vivo')
,(4, NULL, N'Oppo')
,(5, NULL, N'Infinix')
,(6, N'Jeans', N'Levis')
,(7, NULL, N'Tommy Hilfiger')
,(8, NULL, N'Wrangler')
,(9, N'Laptop', N'Dell')
,(10, NULL, N'Asus')
,(11, NULL, N'Apple')
,(12, NULL, N'Asus')
,(13, N'Shirt', N'Louis Philippe')
,(14, NULL, N'Pepe Jeans')
,(15, NULL, N'Blackberrys')
,(16, NULL, N'Arrow')

--Scenario
--When you log in to your retailer client's database, you notice that their product catalog data is full of gaps in the category column. Can you write a SQL query that returns the product catalog with the missing data filled in?

--Assumptions
--Each category is mentioned only once in a category column.
--All the products belonging to same category are grouped together.
--The first product from a product group will always have a defined category. Meaning that the first item from each category will not have a missing category value.

-- Solution 1:
WITH grouped_category AS (
    SELECT
        ProductID,
        Category,
        ProductName,
        COUNT(Category) OVER (ORDER BY ProductID ASC) as Category_Group
    FROM ProductDetails
)
SELECT 
    ProductID,
    ProductName,
    FIRST_VALUE(Category) OVER(PARTITION BY Category_Group ORDER BY ProductID ASC) as Filled_Category
FROM grouped_category;

-- Solution 2:
SELECT
    ProductID,
    ProductName,
    (
        SELECT TOP 1 Category
        FROM ProductDetails AS t2
        WHERE t2.ProductID <= t1.ProductID AND Category IS NOT NULL
        ORDER BY ProductID DESC
    ) AS Category
FROM
    ProductDetails AS t1;


