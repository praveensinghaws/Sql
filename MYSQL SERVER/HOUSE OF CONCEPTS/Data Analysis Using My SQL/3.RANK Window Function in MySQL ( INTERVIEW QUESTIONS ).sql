/*
******************************
RANK Window Function in MySQL
******************************

        #### KEY POINTERS #####
1) Assigns sequential rank to each row within a result set based on values of column/columns
2) Assign rank based on ORDER BY clause
3) Very useful when we want to identify tied values
4) Rank Assignment -> Non-Consecutive manner

1,
2,
3,
4
*/ /*
Problem Statment:
*********************
Identity Top Sales Representative by Region
*/
SELECT Region,
       round(sum(Revenue), 2) as Total_Revenue
from sales
GROUP by Region
ORDER BY Total_Revenue DESC
LIMIT 5;

-- *********************************** Basic Senerio -1 *****************************

SELECT *
from
    (SELECT *,
            Rank() OVER(
                        ORDER by salary DESC) as rnk
     from employee)x
where rnk = 1;

-- *********************************** Basic Senerio -2 *****************************

SELECT *
from
    (SELECT *,
            Rank() OVER(partition by department_name
                        ORDER by salary DESC) as rnk
     from employee)x
where rnk = 1;

-- *********************************** Advanced Senerio 1  *****************************
-- Identify Top  Sales Representative by Region
SELECT *
FROM
    (SELECT Region,
            Sales_Representative,
            ROUND(SUM(Revenue), 2) as Total_Revenue,
            Rank() OVER(PARTITION BY Region
                        ORDER BY SUM(Revenue) DESC) as rnk
     FROM SALES
     GROUP BY Region,
              Sales_Representative) x
WHERE rnk = 1;
-- *********************************** Advanced Senerio 2  *****************************

SELECT *
FROM
    (SELECT LEFT(DATE_FORMAT(STR_TO_DATE(date, '%m/%d/%Y'), '%b'), 3) AS Month,
            ROUND(SUM(Revenue), 2) AS Total_Revenue,
            RANK() OVER (
                         ORDER BY SUM(Revenue) DESC) AS rnk
     FROM sales
     GROUP BY Month) x
WHERE rnk < 4;

-- *********************************** Advanced Senerio 3  *****************************

SELECT *
FROM
    (SELECT YEAR(STR_TO_DATE(date, '%m/%d/%Y')) AS Year,
            LEFT(DATE_FORMAT(STR_TO_DATE(date, '%m/%d/%Y'), '%b'), 3) AS Month,
            ROUND(SUM(Revenue), 2) AS Total_Revenue,
            RANK() OVER (PARTITION BY YEAR(STR_TO_DATE(date, '%m/%d/%Y'))
                         ORDER BY SUM(Revenue) DESC) AS rnk
     FROM sales
     GROUP BY Year,
              Month) x
WHERE rnk < 6;

-- ***************************
-- | EXTRACT DATA FROM DATE |
-- ***************************

SELECT DAY(STR_TO_DATE('08-11-1990', '%m-%d-%Y')) AS Day_of_Month, # Extracts the day of the month
 DAYNAME(STR_TO_DATE('08-11-1990', '%m-%d-%Y')) AS Day_Name, # Extracts the day name
 LEFT(DATE_FORMAT(STR_TO_DATE('08-11-1990', '%m-%d-%Y'), '%b'), 6) AS Abbreviated_Month, # Extracts the abbreviated month name
 DATE_FORMAT(STR_TO_DATE('08-11-1990', '%m-%d-%Y'), '%M') AS Full_Month, # Extracts the full month name
 DATE_FORMAT(STR_TO_DATE('08-11-1990', '%m-%d-%Y'), '%Y') AS Year; # Extracts the year


SELECT *
FROM SALES;

--- OTHERS -----------

