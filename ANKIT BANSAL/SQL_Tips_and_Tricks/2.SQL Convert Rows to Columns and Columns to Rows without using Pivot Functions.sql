-- 2. SQL Convert Rows to Columns and Columns to Rows without using Pivot Functions

-- Create the EmployeeDetails table
CREATE TABLE EmployeeDetails (
    EMP_ID INT,
    SALARY_COMPONENT_TYPE VARCHAR(20),
    VAL INT
);

-- Insert sample data into the EmployeeDetails table
INSERT INTO EmployeeDetails (EMP_ID, SALARY_COMPONENT_TYPE, VAL)
VALUES
(1, 'SALARY', 10000),
(1, 'BONUS', 5000),
(1, 'HIKE_PERCENT', 10),
(2, 'SALARY', 15000),
(2, 'BONUS', 7000),
(2, 'HIKE_PERCENT', 8),
(3, 'SALARY', 12000),
(3, 'BONUS', 6000),
(3, 'HIKE_PERCENT', 7);

-- Display all data from EmployeeDetails table
SELECT * FROM EmployeeDetails;

-- Calculate sums for each salary component for each employee and display the result
SELECT 
    EMP_ID,
    SUM(CASE WHEN SALARY_COMPONENT_TYPE = 'SALARY' THEN VAL END) AS SALARY,
    SUM(CASE WHEN SALARY_COMPONENT_TYPE = 'BONUS' THEN VAL END) AS BONUS,
    SUM(CASE WHEN SALARY_COMPONENT_TYPE = 'HIKE_PERCENT' THEN VAL END) AS HIKE_PERCENT
FROM 
    EmployeeDetails
GROUP BY 
    EMP_ID;


-- Create the EmployeeDetails_pivot table and insert the aggregated results into it
SELECT 
    EMP_ID, 
    SUM(CASE WHEN SALARY_COMPONENT_TYPE = 'SALARY' THEN VAL END) AS SALARY, 
    SUM(CASE WHEN SALARY_COMPONENT_TYPE = 'BONUS' THEN VAL END) AS BONUS, 
    SUM(CASE WHEN SALARY_COMPONENT_TYPE = 'HIKE_PERCENT' THEN VAL END) AS HIKE_PERCENT
INTO EmployeeDetails_pivot
FROM EmployeeDetails
GROUP BY EMP_ID;

-- Display all tables to verify the creation of EmployeeDetails_pivot
SELECT * FROM sys.tables;

-- Display all data from EmployeeDetails_pivot table
SELECT * FROM EmployeeDetails_pivot;

-- Combine salary components for each employee from the EmployeeDetails_pivot table
-- and order the result by EMP_ID and VAL in descending order
SELECT EMP_ID, 'SALARY' AS SALARY_COMPONENT_TYPE, SALARY AS VAL 
FROM EmployeeDetails_pivot
UNION ALL

SELECT EMP_ID, 'BONUS' AS SALARY_COMPONENT_TYPE, BONUS AS VAL 
FROM EmployeeDetails_pivot
UNION ALL

SELECT EMP_ID, 'HIKE_PERCENT' AS SALARY_COMPONENT_TYPE, HIKE_PERCENT AS VAL 
FROM EmployeeDetails_pivot

ORDER BY EMP_ID, VAL DESC;