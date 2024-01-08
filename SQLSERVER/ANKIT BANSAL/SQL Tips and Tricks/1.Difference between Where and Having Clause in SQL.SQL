-- Switch to the DEMODB database
USE DEMODB;
-- Select all information about tables in the current database
SELECT *
FROM INFORMATION_SCHEMA.TABLES;

-- Retrieve the average salary for each department where the average salary is greater than 75,000,
-- considering only employees with a salary greater than 70,000
SELECT EmpDeptID, AVG(EmpSalary) AS AVG_SALARY
FROM Employee
WHERE EmpSalary > 70000
GROUP BY EmpDeptID
HAVING AVG(EmpSalary) > 75000;
