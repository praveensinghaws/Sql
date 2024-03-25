/*
*********
 NTILE :
**********
NTILE (n): Divides the rows of resultset into a groups [tiles] based on the values of a particular column.. Segment the data

Partition By: creates a partition of rows and then NTILE will form N groups within each partition
ORDER BY : orders the rows and then Numbers will be allocated to each group
**** Key: NTILE(n) always tries to allocate rows evenly in different tiles but when Total rows is Not divisible by n then allocation of rows will not be even
*/ -- USE CASES : [1. STUDENT GRADING SYSTEM, 2. MARKETING CAMPAIGN PERFORMANCE]
SHow Tables;

--*********************************************** SCENARIO 1 ********************************************************
-- Problem Statement : Identify Mutual Funds that remain consistently in Top Quantile

SELECT fund_name as Fund_Name,
       count(fund_id) as Fund_Cnt
FROM
    (SELECT *,
            NTILE(4) OVER(PARTITION BY YEAR
                          ORDER BY return_percentage DESC) as Quartiles
     FROM mutual_fund_returns)tqi
WHERE Quartiles = 1
GROUP BY fund_name
ORDER BY Fund_Cnt DESC;