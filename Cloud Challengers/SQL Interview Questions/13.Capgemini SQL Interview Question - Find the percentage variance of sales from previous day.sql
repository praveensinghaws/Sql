-- Create the table
CREATE TABLE salesvar_tbl (
    dt DATE, 
    sales INT
);

-- Insert data into the table
INSERT INTO salesvar_tbl VALUES 
('2023-10-03', 10),
('2023-10-04', 20),
('2023-10-05', 60),
('2023-10-06', 50),
('2023-10-07', 10);

--Solution 1: Using Subquery and CAST
-- Calculate percentage variation using LAG, replace NULL with 0, and filter non-negative values
SELECT * 
FROM (
    SELECT dt, 
           sales, 
           COALESCE(
               (sales - LAG(sales) OVER (ORDER BY dt)) / CAST(LAG(sales) OVER (ORDER BY dt) AS FLOAT) * 100, 
               0
           ) AS pct_var
    FROM salesvar_tbl
) x
WHERE pct_var >= 0;

--Solution 2: Using Subquery with Simplified Calculation
-- Calculate percentage variation using LAG and filter non-negative values
SELECT dt, 
       sales, 
       pct_var
FROM (
    SELECT dt, 
           sales, 
           COALESCE(
               (sales - LAG(sales) OVER (ORDER BY dt)) * 100 / LAG(sales) OVER (ORDER BY dt), 
               0
           ) AS pct_var
    FROM salesvar_tbl
) x
WHERE pct_var >= 0;

--Solution 3: Using Common Table Expression (CTE)
-- Calculate percentage variation using LAG and filter non-negative values
WITH SalesVariation AS (
    SELECT dt, 
           sales, 
           COALESCE(
               (sales - LAG(sales) OVER (ORDER BY dt)) * 100 / LAG(sales) OVER (ORDER BY dt), 
               0
           ) AS pct_var
    FROM salesvar_tbl
)
SELECT dt, 
       sales, 
       pct_var
FROM SalesVariation
WHERE pct_var >= 0;

--Solution 4: Using CTE with LAG and Calculating Variation Separately
-- Calculate percentage variation using LAG and filter non-negative values
-- Calculate percentage variation using LAG and filter non-negative values
-- Calculate percentage variation using LAG and filter non-negative values
WITH cte AS (
    -- Calculate the previous sales value using LAG
    SELECT dt, 
           sales, 
           LAG(sales) OVER (ORDER BY dt) AS prevsales
    FROM salesvar_tbl
)
-- Calculate percentage variation and filter non-negative values
SELECT dt, 
       sales, 
       COALESCE((sales - prevsales) * 100 / prevsales, 0) AS pct_var
FROM cte
WHERE COALESCE((sales - prevsales) * 100 / prevsales, 0) >= 0;

/*
• Solution 1 and Solution 2 are similar but differ in the use of CAST for type conversion.
• Solution 3 uses a CTE and is cleaner, particularly useful if you’re working with complex queries or need to reuse results.
• Solution 4 is a different approach using CTE to calculate prevsales first and then compute pct_var.
*/
