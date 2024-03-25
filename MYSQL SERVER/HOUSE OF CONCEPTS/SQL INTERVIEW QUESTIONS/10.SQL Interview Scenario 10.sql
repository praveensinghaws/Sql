--CREATE Script
CREATE TABLE [dbo].[MonthlyCardsIssued](
	[CardName] [varchar](100) NULL,
	[IssueMonth] [int] NULL,
	[IssueYear] [int] NULL,
	[IssuedQuantity] [int] NULL
) 
GO

--INSERT Script

INSERT [dbo].[MonthlyCardsIssued] ([CardName], [IssueMonth], [IssueYear], [IssuedQuantity]) 
VALUES 
(N'Southwest Rapid Rewards', 1, 2022, 1700)
, (N'United Club', 1, 2022, 895)
, (N'Southwest Rapid Rewards', 2, 2022, 1899)
, (N'Southwest Rapid Rewards', 3, 2022, 2630)
, (N'United Club', 2, 2022, 6369)
, (N'United Club', 3, 2022, 1200)
, (N'United Gateway', 1, 2022, 6632)
, (N'United Gateway', 2, 2022, 9996)
, (N'United Gateway', 3, 2022, 1524)
, (N'Rewards Visa', 1, 2022, 9630)
, (N'Southwest Rapid Rewards', 4, 2022, 5986)
, (N'United Club', 4, 2022, 1236)
, (N'United Club', 5, 2022, 3636)
, (N'Rewards Visa', 2, 2022, 1236)
, (N'Rewards Visa', 3, 2022, 6332)
, (N'Rewards Visa', 4, 2022, 2632)
, (N'Rewards Visa', 5, 2022, 8998)
GO
/*
--Scenario 10
Your team at JPMorgan Chase is soon launching a new credit card, and to gain some context, 
you are analyzing how many credit cards were issued each month.

Write a query that outputs the name of each credit card and the difference in issued amount between the month 
with the most cards issued, and the least cards issued. 
Order the results according to the biggest difference.
*/

--Solution 1: 
SELECT CardName,MAX(IssuedQuantity) - MIN(IssuedQuantity) QtyDifference
FROM MonthlyCardsIssued
GROUP BY CardName
ORDER BY QtyDifference DESC;

--Solution 2: 
SELECT 
    CardName, MAXQty - MINQty AS QtyDifference
FROM (
    SELECT 
        CardName,
        MAX(IssuedQuantity) AS MAXQty,
        MIN(IssuedQuantity) AS MINQty
    FROM MonthlyCardsIssued
        GROUP BY CardName
) AS subquery
ORDER BY QtyDifference DESC;


--Solution 3: 
WITH cte_CardsIssued as
(
SELECT CardName,
        MAX(IssuedQuantity) as Max_Qty,
        MIN(IssuedQuantity) as Min_Qty
FROM MonthlyCardsIssued
GROUP BY CardName
)
SELECT CardName, Max_Qty - Min_Qty as QtyDifference
FROM cte_CardsIssued
ORDER BY QtyDifference DESC