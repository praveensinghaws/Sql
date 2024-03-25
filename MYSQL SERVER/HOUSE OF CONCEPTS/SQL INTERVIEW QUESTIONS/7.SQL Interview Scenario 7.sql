----CREATE Script
CREATE TABLE [dbo].[product_spend]
(
    [category] [varchar](100) NULL,
    [product] [varchar](100) NULL,
    [user_id] [int] NULL,
    [spend] [decimal](10, 2) NULL,
    [transaction_date] [datetime] NULL
) ON [PRIMARY]
GO


----INSERT Script

INSERT [dbo].[product_spend]
    ([category], [product], [user_id], [spend], [transaction_date])
VALUES
    (N'computers', N'laptop', 165, CAST(246.00 AS Decimal(10, 2)), CAST(N'2021-12-26T00:00:00.000' AS DateTime))
,
    (N'sports', N'wrist bands', 169, CAST(196.00 AS Decimal(10, 2)), CAST(N'2022-04-05T00:00:00.000' AS DateTime))
,
    (N'computers', N'printer', 123, CAST(299.99 AS Decimal(10, 2)), CAST(N'2022-03-02T00:00:00.000' AS DateTime))
,
    (N'computers', N'pen drive', 123, CAST(219.80 AS Decimal(10, 2)), CAST(N'2022-10-02T00:00:00.000' AS DateTime))
,
    (N'computers', N'keyboard', 678, CAST(356.00 AS Decimal(10, 2)), CAST(N'2022-05-02T00:00:00.000' AS DateTime))
,
    (N'computers', N'pen drive', 456, CAST(163.00 AS Decimal(10, 2)), CAST(N'2022-03-02T00:00:00.000' AS DateTime))
,
    (N'sports', N'water bottles', 178, CAST(152.00 AS Decimal(10, 2)), CAST(N'2022-04-05T00:00:00.000' AS DateTime))
,
    (N'books', N'fiction', 156, CAST(365.90 AS Decimal(10, 2)), CAST(N'2022-11-08T00:00:00.000' AS DateTime))
,
    (N'books', N'motivational', 263, CAST(486.90 AS Decimal(10, 2)), CAST(N'2022-12-06T00:00:00.000' AS DateTime))
,
    (N'books', N'school', 288, CAST(486.90 AS Decimal(10, 2)), CAST(N'2022-07-08T00:00:00.000' AS DateTime))
,
    (N'mobile', N'samsung', 758, CAST(788.00 AS Decimal(10, 2)), CAST(N'2022-07-15T00:00:00.000' AS DateTime))
,
    (N'mobile', N'apple', 189, CAST(1022.90 AS Decimal(10, 2)), CAST(N'2022-08-19T00:00:00.000' AS DateTime))
,
    (N'mobile', N'onplus', 989, CAST(256.00 AS Decimal(10, 2)), CAST(N'2021-07-15T00:00:00.000' AS DateTime))
,
    (N'mobile', N'powerbank', 355, CAST(226.90 AS Decimal(10, 2)), CAST(N'2022-08-19T00:00:00.000' AS DateTime))
GO


-- *********************************    Scenario 7    ***********************************

----Assume you are given the table containing information on Amazon customers and their spending on products in various categories.
----Identify the top two highest-grossing products within each category in 2022. Output the category, product, and total spend.


----Solution
-----------------------------------------------
--1. subquery
SELECT category, product, total_spend
FROM
    (
        SELECT
        category,
        product,
        SUM(spend) as total_spend,
        RANK() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) as rnk
    FROM
        product_spend
    WHERE 
            transaction_date BETWEEN '2022-01-01' AND '2022-12-31'
    GROUP BY 
            category, 
            product
    ) result
WHERE 
    rnk <= 2;

------------------------------------------
--2.CTE
WITH cte_spend AS (
    SELECT 
        category, 
        product, 
        SUM(spend) total_spend,
        ROW_NUMBER() OVER (PARTITION BY category ORDER BY SUM(spend) DESC) row_nbr
    FROM 
        product_spend
    WHERE 
        transaction_date BETWEEN '2022-01-01' AND '2022-12-31'
    GROUP BY 
        category, 
        product
)

SELECT category, product, total_spend
FROM 
    cte_spend
WHERE 
    row_nbr <= 2;


