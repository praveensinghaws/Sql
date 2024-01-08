-- User-Defined SQL Functions

-- Drop the function if it already exists to avoid conflicts
DROP FUNCTION IF EXISTS get_fiscal_year;

-- Create a new function named 'get_fiscal_year'
CREATE FUNCTION `get_fiscal_year` (calender_date DATE)
RETURNS INTEGER DETERMINISTIC
BEGIN
    -- Declare a variable to store the fiscal year
    DECLARE fiscal_year INT;

    -- Calculate the fiscal year by adding 4 months to the input date
    SET fiscal_year = YEAR(DATE_ADD(calender_date, INTERVAL 4 MONTH));

    -- Return the calculated fiscal year
    RETURN fiscal_year;
END;

-->>>>>>>

-- Drop the function if it already exists to avoid conflicts
DROP FUNCTION IF EXISTS get_fiscal_quarter;

-- Create a new function named 'get_fiscal_quarter' with quarters starting from September
CREATE FUNCTION `get_fiscal_quarter` (calender_date DATE)
RETURNS INTEGER DETERMINISTIC
BEGIN
    -- Declare a variable to store the fiscal quarter
    DECLARE fiscal_quarter INT;

    -- Calculate the fiscal quarter based on a September start
    SET fiscal_quarter = CASE
        WHEN MONTH(calender_date) IN (9, 10, 11) THEN 1  -- Q1
        WHEN MONTH(calender_date) IN (12, 1, 2) THEN 2    -- Q2
        WHEN MONTH(calender_date) IN (3, 4, 5) THEN 3      -- Q3
        WHEN MONTH(calender_date) IN (6, 7, 8) THEN 4      -- Q4
        ELSE NULL
    END;

    -- Return the calculated fiscal quarter
    RETURN fiscal_quarter;
END;



