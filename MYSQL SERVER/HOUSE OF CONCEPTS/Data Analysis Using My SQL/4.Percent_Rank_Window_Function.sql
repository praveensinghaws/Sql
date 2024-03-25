/*
*********************************
   Percent_Rank window function
*********************************
Percent_Rank) window function in MySQL can be used to calculate the "relative rank of a row" within a result set,
based on a "specified column ordering".

It returns a value between 0 and 1, where O "represents the lowest rank and 1 represents the highest rank".

********
 Key :
********
Percent_Rank function can be useful for analyzing the "distribution of data" within a result set,
and identifying "outliers or other anomalies".

-------------------------------------------------------------------------------------------------------

*********************************
   Percent_Rank window function :
*********************************

1) Understanding of Percentile ->
-----------------------------------
Exam: Student A has 60 Percentile {Student A is better than or equal to 60% of students who attempt the test}
50 Percentile is Median: Half values above it and Half values below it
Important for identifying outliers

2) Percent_ Rank) -›Percentile Rank of a row within a resultset
---------------------------------------------------------------
Identity relative position of value within a dataset

3) Use Cases ->
-----------------
Employee relative Performance Evaluation, Student Relative Performance,
Website Traffic Analysis to identify relative popularity of pages
*/ -- Step 1:
-- Update the format of the Date column

UPDATE website_pageviews
SET Date = STR_TO_DATE(Date, '%m/%d/%Y');

-- Step 2:
-- Change the data type of the Date column to DATE

ALTER TABLE website_pageviews MODIFY COLUMN Date DATE;

---******************************** Basic Scenario ******************************************************

SELECT Page,
       ROUND(SUM(Views), 2) AS Total_Views,
       CONCAT(ROUND(Percent_Rank() OVER (
                                         ORDER BY SUM(Views)), 2) * 100, '%') AS Percentile
FROM website_pageviews
GROUP BY Page;

---******************************** Advanced Scenario ******************************************************
-- Identify Percentile Rank of a Page specific to a particular Year.
SELECT
    Page,
    YEAR(Date) AS Year,
    ROUND(SUM(Views), 2) AS Total_Views,
    CONCAT(ROUND(Percent_Rank() OVER (PARTITION BY YEAR(Date) ORDER BY SUM(Views)), 2) * 100, '%') AS Percentile
FROM
    website_pageviews
GROUP BY
    Page, YEAR(Date);

---******************************** Advanced Scenario ******************************************************
-- Identify Percentile Rank of Every Page for a Particular Year
SELECT
    Page,
    YEAR(Date) AS Year,
    ROUND(SUM(Views), 2) AS Total_Views,
    CONCAT(ROUND(Percent_Rank() OVER (PARTITION BY Page ORDER BY SUM(Views)), 2) * 100, '%') AS Percentile
FROM
    website_pageviews
GROUP BY
    Page, YEAR(Date);
