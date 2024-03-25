
--Scenario 4
--Write SQL query to find the 3rd highest salary from a table.

--Solutions

--------------------------------------------

--1. TOP and Subquery

SELECT TOP 1 FixedSalary _3rdHighestSalary 
FROM
(
SELECT DISTINCT TOP 3 FixedSalary 
FROM EmployeeSalary WITH(NOLOCK)
ORDER BY FixedSalary DESC
) AS TempResult
ORDER BY FixedSalary ASC

----------------------------------------------
--2. ROW_NUMBER using sub-query

SELECT FixedSalary _3rdHighestSalary
FROM 
(
SELECT FixedSalary,
ROW_NUMBER() OVER (ORDER BY FixedSalary DESC) row_num 
FROM EmployeeSalary WITH(NOLOCK)
) AS TempResult
WHERE row_num = 3

---------------------------------------
--3. DENSE_RANK() using sub-query

SELECT FixedSalary _3rdHighestSalary
FROM
(
SELECT FixedSalary,DENSE_RANK() OVER (ORDER BY FixedSalary DESC) rank_number FROM EmployeeSalary WITH(NOLOCK)
) AS TempResult
WHERE rank_number = 3