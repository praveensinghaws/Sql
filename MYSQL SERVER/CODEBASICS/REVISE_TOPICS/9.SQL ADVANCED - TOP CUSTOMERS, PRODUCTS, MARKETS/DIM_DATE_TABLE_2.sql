-- Drop the table if it already exists
DROP TABLE IF EXISTS DIM_DATE;

-- Create DIM_DATE table
CREATE TABLE DIM_DATE (
    date_id INT PRIMARY KEY,                       -- Primary key for the table
    calendar_date DATE,                            -- Calendar date in DATE format
    fiscal_year INT                                -- Fiscal year
);

-- Populate DIM_DATE with data
INSERT INTO DIM_DATE (date_id, calendar_date, fiscal_year)
SELECT
    ROW_NUMBER() OVER () AS date_id,                                -- Generate a unique identifier for each date
    STR_TO_DATE(DATE_FORMAT(DATE('2017-09-01') + INTERVAL (a.a + (10 * b.a) + (100 * c.a)) MONTH, '%Y/%m/%d'), '%Y/%m/%d') AS calendar_date,  -- Format the calendar date
    YEAR(DATE_ADD(DATE_FORMAT(DATE('2017-09-01') + INTERVAL (a.a + (10 * b.a) + (100 * c.a)) MONTH, '%Y/%m/%d'), INTERVAL 4 MONTH)) AS fiscal_year  -- Calculate the fiscal year
FROM
    (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS a  -- Generate numbers from 0 to 9
    CROSS JOIN (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS b  -- Cross join to get combinations of numbers
    CROSS JOIN (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS c  -- Cross join to get combinations of numbers
WHERE
    DATE('2017-09-01') + INTERVAL (a.a + (10 * b.a) + (100 * c.a)) MONTH <= '2023-12-01';  -- Generate dates from September 1, 2017, to December 1, 2023

-- Select all records from DIM_DATE table, ordered by fiscal_year
SELECT * FROM DIM_DATE ORDER BY fiscal_year;
