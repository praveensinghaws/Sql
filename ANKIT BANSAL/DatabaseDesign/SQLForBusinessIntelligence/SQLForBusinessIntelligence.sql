-- SQL For Business Intelligence | YoY, QoQ, MTD, YTD, QTD etc. in a Single SQL

-- Verify Table Creation
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'calendar_table';

----------------------------------------------------------------------------------------
--                      CREATING TABLE AND INSERTING DATA
----------------------------------------------------------------------------------------
--STEP:1
CREATE TABLE dbo.order_details (
    order_id VARCHAR(50),
    order_date DATE,
    product_id VARCHAR(50),
    category VARCHAR(50),
    sales DECIMAL(10, 2)
);

--STEP:2
-- RUN BELOW COMMAND ON TERMINAL
-- docker cp /Users/praveen/Downloads/data.txt SqlServer:/data.txt

--STEP:3
-- Ensure that the path to the file is accessible by SQL Server
-- The path should be on the SQL Server machine or accessible to it

--STEP:4
BULK INSERT dbo.order_details
FROM '/data.txt'
WITH (
    FIELDTERMINATOR = '\t',  -- Tab-separated values
    ROWTERMINATOR = '\n',    -- New line separated rows
    FIRSTROW = 2             -- Skip the header row
);
SELECT * FROM order_details;

----------------------------------------------------------------------------------------
--                          WRITING QUERY
----------------------------------------------------------------------------------------

-- Define today's date and time variables
DECLARE @today DATE = CAST(GETDATE() AS DATE);
DECLARE @current_year INT = DATEPART(YEAR, @today);
DECLARE @current_quarter INT = DATEPART(QUARTER, @today);
DECLARE @current_month INT = DATEPART(MONTH, @today);
DECLARE @current_cal_year_day INT = DATEPART(DAYOFYEAR, @today);
DECLARE @current_cal_month_day INT = DATEPART(DAY, @today);

-- Timeframe SQL
WITH todays_data AS 
(
    SELECT * 
    FROM calendar_table 
    WHERE cal_date = @today
),
cal AS (
    SELECT c.*, 
           t.cal_year AS current_year,
           t.cal_date AS todays_date,
           t.cal_year_day AS current_cal_year_day,
           t.cal_quarter AS current_quarter,
           t.cal_month AS current_month, 
           t.cal_month_day AS current_cal_month_day
    FROM calendar_table c
    CROSS JOIN todays_data t
    WHERE c.cal_year BETWEEN t.cal_year - 2 AND t.cal_year
),
cte AS (
    SELECT 'FY' AS timeframe,
           'FY' AS timeframe_id,
           MIN(CASE WHEN cal_year = current_year THEN cal_date END) AS start_date_ty,
           MAX(CASE WHEN cal_year = current_year THEN cal_date END) AS end_date_ty,
           MIN(CASE WHEN cal_year = current_year - 1 THEN cal_date END) AS start_date_ly,
           MAX(CASE WHEN cal_year = current_year - 1 THEN cal_date END) AS end_date_ly,
           MIN(CASE WHEN cal_year = current_year - 2 THEN cal_date END) AS start_date_lly,
           MAX(CASE WHEN cal_year = current_year - 2 THEN cal_date END) AS end_date_lly
    FROM cal c
    UNION ALL
    SELECT 'QUARTER' AS timeframe,
           CAST(cal_quarter AS VARCHAR(3)) AS timeframe_id,
           MIN(CASE WHEN cal_year = current_year THEN cal_date END) AS start_date_ty,
           MAX(CASE WHEN cal_year = current_year THEN cal_date END) AS end_date_ty,
           MIN(CASE WHEN cal_year = current_year - 1 THEN cal_date END) AS start_date_ly,
           MAX(CASE WHEN cal_year = current_year - 1 THEN cal_date END) AS end_date_ly,
           MIN(CASE WHEN cal_year = current_year - 2 THEN cal_date END) AS start_date_lly,
           MAX(CASE WHEN cal_year = current_year - 2 THEN cal_date END) AS end_date_lly
    FROM cal c
    GROUP BY cal_quarter
    UNION ALL
    SELECT 'YTD' AS timeframe,
           'YTD' AS timeframe_id,
           MIN(CASE WHEN cal_year = current_year THEN cal_date END) AS start_date_ty,
           MAX(CASE WHEN cal_year = current_year THEN cal_date END) AS end_date_ty,
           MIN(CASE WHEN cal_year = current_year - 1 THEN cal_date END) AS start_date_ly,
           MAX(CASE WHEN cal_year = current_year - 1 THEN cal_date END) AS end_date_ly,
           MIN(CASE WHEN cal_year = current_year - 2 THEN cal_date END) AS start_date_lly,
           MAX(CASE WHEN cal_year = current_year - 2 THEN cal_date END) AS end_date_lly
    FROM cal c
    WHERE cal_year_day <= @current_cal_year_day
    UNION ALL
    SELECT 'QTD' AS timeframe,
           'QTD' AS timeframe_id,
           MIN(CASE WHEN cal_year = current_year THEN cal_date END) AS start_date_ty,
           MAX(CASE WHEN cal_year = current_year THEN cal_date END) AS end_date_ty,
           MIN(CASE WHEN cal_year = current_year - 1 THEN cal_date END) AS start_date_ly,
           MAX(CASE WHEN cal_year = current_year - 1 THEN cal_date END) AS end_date_ly,
           MIN(CASE WHEN cal_year = current_year - 2 THEN cal_date END) AS start_date_lly,
           MAX(CASE WHEN cal_year = current_year - 2 THEN cal_date END) AS end_date_lly
    FROM cal c
    WHERE cal_quarter = @current_quarter AND cal_year_day <= @current_cal_year_day
    UNION ALL
    SELECT 'MTD' AS timeframe,
           'MTD' AS timeframe_id,
           MIN(CASE WHEN cal_year = current_year THEN cal_date END) AS start_date_ty,
           MAX(CASE WHEN cal_year = current_year THEN cal_date END) AS end_date_ty,
           MIN(CASE WHEN cal_year = current_year - 1 THEN cal_date END) AS start_date_ly,
           MAX(CASE WHEN cal_year = current_year - 1 THEN cal_date END) AS end_date_ly,
           MIN(CASE WHEN cal_year = current_year - 2 THEN cal_date END) AS start_date_lly,
           MAX(CASE WHEN cal_year = current_year - 2 THEN cal_date END) AS end_date_lly
    FROM cal c
    WHERE cal_month = @current_month AND cal_month_day <= @current_cal_month_day
    UNION ALL
    SELECT 'month' AS timeframe,
           CAST(cal_month AS VARCHAR(2)) AS timeframe_id,
           MIN(CASE WHEN cal_year = current_year THEN cal_date END) AS start_date_ty,
           MAX(CASE WHEN cal_year = current_year THEN cal_date END) AS end_date_ty,
           MIN(CASE WHEN cal_year = current_year - 1 THEN cal_date END) AS start_date_ly,
           MAX(CASE WHEN cal_year = current_year - 1 THEN cal_date END) AS end_date_ly,
           MIN(CASE WHEN cal_year = current_year - 2 THEN cal_date END) AS start_date_lly,
           MAX(CASE WHEN cal_year = current_year - 2 THEN cal_date END) AS end_date_lly
    FROM cal c
    GROUP BY cal_month
)
-- Create the timeframes table
SELECT * INTO timeframes FROM cte;

SELECT * FROM timeframes;


----------------------------------------------------------------------------------------
--                                FINAL SQL QUERY
------------------------------------------------------------------------------------------
SELECT 
    o.category,
    t.timeframe,
    t.timeframe_id,
    SUM(CASE WHEN o.order_date BETWEEN t.start_date_ty AND t.end_date_ty THEN o.sales END) AS ty_sales,
    SUM(CASE WHEN o.order_date BETWEEN t.start_date_ly AND t.end_date_ly THEN o.sales END) AS ly_sales,
    SUM(CASE WHEN o.order_date BETWEEN t.start_date_lly AND t.end_date_lly THEN o.sales END) AS lly_sales
FROM 
    order_details o
INNER JOIN 
    timeframes t 
    ON o.order_date BETWEEN t.start_date_ty AND t.end_date_ty
    OR o.order_date BETWEEN t.start_date_ly AND t.end_date_ly
    OR o.order_date BETWEEN t.start_date_lly AND t.end_date_lly
GROUP BY 
    o.category,
    t.timeframe,
    t.timeframe_id
ORDER BY 
    o.category, 
    t.timeframe, 
    t.timeframe_id;

