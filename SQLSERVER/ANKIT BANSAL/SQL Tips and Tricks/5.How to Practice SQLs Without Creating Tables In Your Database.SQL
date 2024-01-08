-- Switch to the DEMODB database
USE DEMODB;

-- Select all information about tables in the current database
SELECT *
FROM INFORMATION_SCHEMA.TABLES;

-- Practice SQL without creating tables

WITH emp AS (
    SELECT 1 AS emp_id, 1000 AS emp_salary, 1 AS dep_id
    UNION ALL
    SELECT 2 AS emp_id, 2000 AS emp_salary, 2 AS dep_id
    UNION ALL
    SELECT 3 AS emp_id, 3000 AS emp_salary, 3 AS dep_id
    UNION ALL
    SELECT 4 AS emp_id, 4000 AS emp_salary, 4 AS dep_id
),

dep AS (
    SELECT 1 AS dep_id, 'd1' AS dep_name
    UNION ALL
    SELECT 2 AS dep_id, 'd1' AS dep_name
    UNION ALL
    SELECT 3 AS dep_id, 'd2' AS dep_name
    UNION ALL
    SELECT 4 AS dep_id, 'd3' AS dep_name
)

SELECT * FROM emp
INNER JOIN DEP ON EMP.dep_id=DEP.dep_id;
