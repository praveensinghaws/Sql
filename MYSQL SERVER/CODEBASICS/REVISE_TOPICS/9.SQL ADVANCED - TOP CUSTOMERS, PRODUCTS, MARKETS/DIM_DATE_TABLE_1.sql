USE GDB0041;
SHOW TABLES;
DROP TABLE IF EXISTS DIM_DATE;
-- CREATING DIM_DATE TABLE
CREATE TABLE DIM_DATE (
    date_id INT PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    quarter INT,
    year INT,
    day_of_week INT,
    day_of_month INT,
    day_of_year INT,
    week_of_year INT,
    is_weekend BOOLEAN,
    fiscal_year INT,
    fiscal_quarter INT
    -- Add more columns as needed
);

-- Populate DIM_DATE with data
-- The data population depends on the specific requirements and granularity needed in your use case.
-- You can use a script to populate the table with date information.

INSERT INTO DIM_DATE (date_id, full_date, day, month, quarter, year, day_of_week, day_of_month, day_of_year, week_of_year, is_weekend, fiscal_year, fiscal_quarter)
SELECT
    date_id,
    full_date,
    DAY(full_date) AS day,
    MONTH(full_date) AS month,
    QUARTER(full_date) AS quarter,
    YEAR(full_date) AS year,
    DAYOFWEEK(full_date) AS day_of_week,
    DAYOFMONTH(full_date) AS day_of_month,
    DAYOFYEAR(full_date) AS day_of_year,
    WEEK(full_date) AS week_of_year,
    CASE WHEN DAYOFWEEK(full_date) IN (1, 7) THEN TRUE ELSE FALSE END AS is_weekend,
    YEAR(DATE_ADD(full_date, INTERVAL 4 MONTH)) AS fiscal_year,
    CASE
        WHEN MONTH(full_date) IN (9, 10, 11) THEN 1
        WHEN MONTH(full_date) IN (12, 1, 2) THEN 2
        WHEN MONTH(full_date) IN (3, 4, 5) THEN 3
        WHEN MONTH(full_date) IN (6, 7, 8) THEN 4
        ELSE NULL
    END AS fiscal_quarter
FROM (
    SELECT
        ROW_NUMBER() OVER () AS date_id,
        full_date
    FROM (
        SELECT DATE('2020-01-01') + INTERVAL (a.a + (10 * b.a) + (100 * c.a)) DAY AS full_date
        FROM (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS a
        CROSS JOIN (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS b
        CROSS JOIN (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS c
    ) AS date_series
    WHERE full_date BETWEEN '2020-01-01' AND '2023-12-31'
) AS date_population;
