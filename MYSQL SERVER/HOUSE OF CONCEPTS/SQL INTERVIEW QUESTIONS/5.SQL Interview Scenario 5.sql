--Scenario 5
--Write a query to fetch even and odd rows from EmployeeDetails table.

--Solutions

--------------------------------------------------
--1. % operator

SELECT * FROM EmployeeDetails WITH(NOLOCK)
WHERE EmpId % 2 =0
SELECT * FROM EmployeeDetails WITH(NOLOCK)
WHERE EmpId % 2 = 1



--------------------------------------------------
--2. ROW_NUMBER()

SELECT * FROM 
(
SELECT *,ROW_NUMBER() OVER (ORDER BY EmpId) row_num 
FROM EmployeeDetails WITH(NOLOCK)
) AS TempResult
WHERE row_num % 2 = 0


SELECT * FROM 
(
SELECT *,ROW_NUMBER() OVER (ORDER BY EmpId) row_num 
FROM EmployeeDetails WITH(NOLOCK)
) AS TempResult
WHERE row_num % 2 = 1