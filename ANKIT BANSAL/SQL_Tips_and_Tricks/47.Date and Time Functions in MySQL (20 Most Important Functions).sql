-- Creates a table named 'date_functions_demo' with columns to store various date and time values.
CREATE TABLE date_functions_demo (
    id INT,                     -- Primary identifier for each record.
    start_date DATE,            -- Stores the start date of a given period.
    end_date DATE,              -- Stores the end date of a given period.
    created_at TIMESTAMP,       -- Records the exact timestamp when a record was created.
    updated_at TIMESTAMP,       -- Records the exact timestamp when a record was last updated.
    system_date VARCHAR(10)     -- Stores a date as a string in 'MM/DD/YYYY' format, possibly representing a system date.
);

-- Inserts three records into the 'date_functions_demo' table with various date and timestamp values.
INSERT INTO date_functions_demo (id, start_date, end_date, created_at, updated_at, system_date) VALUES 
(1, '2024-01-01', '2024-12-31', '2024-01-01 10:00:00', '2024-12-31 23:59:59', '12/30/2024'),
(2, '2023-06-15', '2024-06-15', '2023-06-15 08:30:00', '2024-06-15 17:45:00', '08/15/2024'),
(3, '2022-05-20', '2023-05-20', '2022-05-20 12:15:00', '2023-05-20 18:00:00', '10/21/2024');


------------------------------------------------------------------------
-- Here are the 20 most important MYSQL date functions in one go:
------------------------------------------------------------------------
select * from date_functions_demo;


-- 1. NOW() / CURRENT_TIMESTAMP()
-- Retrieves the current date and time.
SELECT NOW();

-- Retrieves the current date and time, equivalent to NOW().
SELECT CURRENT_TIMESTAMP();

-- 2. CURRENT_DATE()
-- Selects all columns from 'date_functions_demo' and adds a column showing the current date.
SELECT *, CURRENT_DATE() AS CURRENT_DATE_COL 
FROM date_functions_demo;

-- 3. CURRENT_TIME()
-- Selects all columns from 'date_functions_demo' and adds a column showing the current time.
SELECT *, CURRENT_TIME() AS CURRENT_TIME_COL 
FROM date_functions_demo;

-- 4. DATE()
-- Selects the ID, created_at timestamp, and extracts the date from created_at using DATE() and CAST().
SELECT ID, created_at, DATE(created_at) AS extracted_date, CAST(created_at AS DATE) AS casted_date 
FROM date_functions_demo;

-- 5 DATE_FORMAT()
-- Formats the 'start_date' in 'dd/mm/yy' and 'dd-mm-yy' formats.
SELECT 
    ID, 
    start_date, 
    DATE_FORMAT(start_date, '%d/%m/%y') AS formatted_date_slash, 
    DATE_FORMAT(start_date, '%d-%m-%y') AS formatted_date_dash
FROM date_functions_demo;


--6. DATEDIFF()
-- Calculates the number of days between 'end_date' and 'start_date' and labels it as 'NO_OF_DAYS'.
SELECT 
    ID, 
    start_date, 
    end_date, 
    DATEDIFF(end_date, start_date) AS NO_OF_DAYS
FROM 
    date_functions_demo;


-- 7. DATE_ADD()
-- Adds various intervals to the 'end_date' and labels the results.
SELECT 
    ID, 
    start_date, 
    end_date, 
    DATE_ADD(end_date, INTERVAL 1 DAY) AS end_date_plus_one_day,  -- Adds 1 day to the 'end_date'.
    DATE_ADD(end_date, INTERVAL 1 MONTH) AS end_date_plus_one_month,  -- Adds 1 month to the 'end_date'.
    DATE_ADD(end_date, INTERVAL 5 YEAR) AS end_date_plus_five_year,  -- Adds 5 years to the 'end_date'.
    DATE_ADD(end_date, INTERVAL 5 HOUR) AS end_date_plus_five_hour  -- Adds 5 hours to the 'end_date'.
FROM 
    date_functions_demo;


-- 7. DATE_SUB()
-- Subtracts various intervals from the 'end_date' and labels the results.
SELECT 
    ID, 
    start_date, 
    end_date, 
    DATE_SUB(end_date, INTERVAL 1 DAY) AS end_date_minus_one_day,  -- Subtracts 1 day from the 'end_date'.
    DATE_SUB(end_date, INTERVAL 1 MONTH) AS end_date_minus_one_month,  -- Subtracts 1 month from the 'end_date'.
    DATE_SUB(end_date, INTERVAL 5 YEAR) AS end_date_minus_five_year,  -- Subtracts 5 years from the 'end_date'.
    DATE_SUB(end_date, INTERVAL 5 HOUR) AS end_date_minus_five_hour  -- Subtracts 5 hours from the 'end_date'.
FROM 
    date_functions_demo;


-- 9. DAY()
-- Extracts the day part from 'start_date' and labels it as 'Day'.
SELECT 
    start_date, 
    DAY(start_date) AS Day 
FROM 
    date_functions_demo;

-- 10. MONTH()
-- Extracts the month part from 'start_date' and labels it as 'Month'.
SELECT 
    start_date, 
    MONTH(start_date) AS Month 
FROM 
    date_functions_demo;

-- 11. YEAR()
-- Extracts the year part from 'start_date' and labels it as 'Year'.
SELECT 
    start_date, 
    YEAR(start_date) AS Year 
FROM 
    date_functions_demo;

-- 12. DAYOFWEEK()
-- Retrieves the day of the week for 'start_date' as a number (1=Sunday, 2=Monday, ..., 7=Saturday).
SELECT 
    start_date, 
    DAYOFWEEK(start_date) AS DayOfWeek 
FROM 
    date_functions_demo;

-- 13. DAYOFYEAR()
-- Retrieves the day of the year for 'start_date'.
SELECT 
    start_date, 
    DAYOFYEAR(start_date) AS DayOfYear 
FROM 
    date_functions_demo;

-- 14. DAYOFMANTH()
-- Retrieves the day of the month for 'start_date'.
SELECT 
    start_date, 
    DAY(start_date) AS DayOfMonth 
FROM 
    date_functions_demo;

-- 15. MONTHNAME()
-- Retrieves the full name of the month for 'start_date'.
SELECT 
    start_date, 
    MONTHNAME(start_date) AS MonthName 
FROM 
    date_functions_demo;

-- 16. DAYNAME()
-- Retrieves the full name of the day of the week for 'start_date'.
SELECT 
    start_date, 
    DAYNAME(start_date) AS DayName 
FROM 
    date_functions_demo;

-- 17. STR_TO_DATE()
-- Converts the 'system_date' string to a date using the format 'MM/DD/YYYY'.
SELECT 
    system_date, 
    STR_TO_DATE(system_date, '%m/%d/%Y') AS converted_date 
FROM 
    date_functions_demo;

-- 18. TIMESTAMPDIFF()
-- Calculates the difference in minutes, days, and months between 'end_date' and 'start_date'.
SELECT 
    ID, 
    start_date, 
    end_date, 
    TIMESTAMPDIFF(MINUTE, start_date, end_date) AS diff_minutes,  -- Difference in minutes.
    TIMESTAMPDIFF(DAY, start_date, end_date) AS diff_days,        -- Difference in days.
    TIMESTAMPDIFF(MONTH, start_date, end_date) AS diff_months      -- Difference in months.
FROM 
    date_functions_demo;

-- 19. LAST_DAY()
-- Retrieves the last day of the month for 'start_date'.
SELECT 
    start_date, 
    LAST_DAY(start_date) AS last_day_of_month 
FROM 
    date_functions_demo;

-- 20. EXTRACT()
-- Extracts the day, hour, and month from 'created_at' timestamp.
SELECT 
    created_at, 
    EXTRACT(DAY FROM created_at) AS extracted_day,  -- Extracts the day part.
    EXTRACT(HOUR FROM created_at) AS extracted_hour,  -- Extracts the hour part.
    EXTRACT(MONTH FROM created_at) AS extracted_month  -- Extracts the month part.
FROM 
    date_functions_demo;