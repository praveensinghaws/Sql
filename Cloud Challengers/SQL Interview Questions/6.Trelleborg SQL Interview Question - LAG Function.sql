-- Creating the sales table
CREATE TABLE sales (
    month VARCHAR(50), 
    ytd_sales INT, 
    monthnum INT
);

-- Inserting values into the sales table
INSERT INTO sales 
VALUES 
    ('jan', 15, 1),
    ('feb', 22, 2),
    ('mar', 35, 3),
    ('apr', 45, 4),
    ('may', 60, 5);

-- Selecting all records from the sales table
SELECT * FROM sales;

-- 1. Using LAG()
-- Calculating the difference between ytd_sales and the previous month's sales
SELECT 
    month, 
    ytd_sales, 
    ytd_sales - prev_sales AS period_sales
FROM (
    SELECT 
        *,
        LAG(ytd_sales, 1, 0) OVER (ORDER BY monthnum) AS prev_sales
    FROM sales
) AS x;

-- 2. Using a Self-Join
SELECT 
    s1.month, 
    s1.ytd_sales, 
    s1.ytd_sales - COALESCE(s2.ytd_sales, 0) AS period_sales
FROM 
    sales s1
LEFT JOIN 
    sales s2 
ON 
    s1.monthnum = s2.monthnum + 1
ORDER BY 
    s1.monthnum;

-- 3. Using OUTER APPLY
SELECT 
    s1.month, 
    s1.ytd_sales, 
    s1.ytd_sales - COALESCE(s2.ytd_sales, 0) AS period_sales
FROM 
    sales s1
OUTER APPLY (
    SELECT TOP 1 ytd_sales 
    FROM sales s2 
    WHERE s2.monthnum < s1.monthnum
    ORDER BY s2.monthnum DESC
) s2
ORDER BY 
    s1.monthnum;