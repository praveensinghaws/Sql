-- Switch to the DEMODB database
USE DEMODB;

-- Select all information about tables in the current database
SELECT *
FROM INFORMATION_SCHEMA.TABLES;

CREATE TABLE EmployeeDetails (
    EMP_ID INT,
    SALARY_COMPONENT_TYPE VARCHAR(20),
    VAL INT
);

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

-- Calculate sums for each salary component for each employee and insert the result into a new table 'EmpDetails'
SELECT 
    EMP_ID,
    SUM(CASE WHEN SALARY_COMPONENT_TYPE = 'SALARY' THEN VAL END) AS SALARY,
    SUM(CASE WHEN SALARY_COMPONENT_TYPE = 'BONUS' THEN VAL END) AS BONUS,
    SUM(CASE WHEN SALARY_COMPONENT_TYPE = 'HIKE_PERCENT' THEN VAL END) AS HIKE_PERCENT
INTO 
    EmpDetails
FROM 
    EmployeeDetails
GROUP BY 
    EMP_ID;

SELECT * FROM EmpDetails;
-- Combine salary components for each employee from the 'EmpDetails' table and order the result by EMP_ID and VAL in descending order
SELECT 
    EMP_ID, 
    'SALARY' AS SALARY_COMPONENT_TYPE, 
    SALARY AS VAL 
FROM 
    EmpDetails
UNION ALL
SELECT 
    EMP_ID, 
    'BONUS' AS SALARY_COMPONENT_TYPE, 
    BONUS AS VAL 
FROM 
    EmpDetails
UNION ALL
SELECT 
    EMP_ID, 
    'HIKE_PERCENT' AS SALARY_COMPONENT_TYPE, 
    HIKE_PERCENT AS VAL 
FROM 
    EmpDetails
ORDER BY 
    EMP_ID, 
    VAL DESC;

