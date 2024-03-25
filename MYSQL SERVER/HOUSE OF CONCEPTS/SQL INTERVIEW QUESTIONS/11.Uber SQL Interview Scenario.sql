--CREATE Script
CREATE TABLE TransactionDetails
(
UserId INT,
Amount MONEY,
TransactionDate DATETIME
)

--INSERT Script
INSERT TransactionDetails
VALUES
(125,463,'2022-01-26'),
(345,321,'2022-12-22'),
(222,567,'2022-12-20'),
(678,543,'2022-12-14'),
(989,234,'2022-01-16'),
(345,765,'2022-12-18'),
(125,234,'2022-04-20'),
(222,341,'2022-05-19'),
(125,900,'2022-06-10'),
(989,784,'2022-07-11'),
(345,987,'2022-11-29'),
(678,348,'2022-01-30'),
(989,123,'2022-10-31'),
(345,409,'2022-09-08'),
(678,506,'2022-09-07'),
(222,909,'2022-02-05'),
(989,500,'2022-01-06')
/*
Scenario :
Assume you are given the table below on Uber transactions made by users. 
Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date.
*/

-- Solution 1 Using Subquery :

SELECT UserId,Amount,TransactionDate
FROM
(
SELECT UserId,Amount,TransactionDate ,
ROW_NUMBER() OVER (PARTITION BY UserId ORDER BY TransactionDate ASC) transactions
FROM TransactionDetails
) AS TempResult
WHERE transactions = 3;


-- Solution 2 Using CTE
WITH RankedTransactions AS (
    SELECT 
        UserId, 
        Amount, 
        TransactionDate,
        ROW_NUMBER() OVER (PARTITION BY UserId ORDER BY TransactionDate ASC) AS transactions
    FROM 
        TransactionDetails
)
SELECT 
    UserId, 
    Amount, 
    TransactionDate
FROM 
    RankedTransactions
WHERE 
    transactions = 3;