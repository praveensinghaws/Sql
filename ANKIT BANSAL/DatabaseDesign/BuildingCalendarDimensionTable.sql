-- Check if the table exists and drop it if it does
IF OBJECT_ID('dbo.calendar_table', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.calendar_table;
    PRINT 'Table calendar_table dropped successfully.';
END
ELSE
BEGIN
    PRINT 'Table calendar_table does not exist.';
END;

-- Create calendar_table using Recursive CTE
WITH cte AS (
    SELECT CAST('2000-01-01' AS date) AS cal_date
    UNION ALL
    SELECT DATEADD(DAY, 1, cal_date) AS cal_date
    FROM cte
    WHERE cal_date < CAST('2050-12-30' AS date)
)
SELECT 
    cal_date,
    DATEPART(YEAR, cal_date) AS cal_year,
    DATEPART(dayofyear, cal_date) AS cal_year_day,
    DATEPART(quarter, cal_date) AS cal_quarter,
    DATEPART(month, cal_date) AS cal_month,
    DATENAME(month, cal_date) AS cal_month_name,
    DATEPART(day, cal_date) AS cal_month_day,
    DATEPART(week, cal_date) AS cal_week,
    DATEPART(weekday, cal_date) AS cal_week_day,
    DATENAME(weekday, cal_date) AS cal_day_name
INTO calendar_table
FROM cte
OPTION (MAXRECURSION 32676);

-- Verify Table Creation
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'calendar_table';

-- Viewing Data in calendar_table
SELECT TOP 3 * FROM calendar_table;


-- Viewing Totalrows in calendar_table
SELECT COUNT(*) as TotalRows FROM calendar_table;
