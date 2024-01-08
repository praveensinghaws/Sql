-- Retrieve all employees ordered by salary in descending order
USE demodb;
SELECT * FROM EMPLOYEE
ORDER BY SALARY DESC;

-- Retrieve details of the employee with the highest salary
SELECT TOP 1 *
FROM employee
ORDER BY salary DESC;

-- Retrieve details of the employee with the highest salary using subquery
SELECT *
FROM employee
WHERE salary = (SELECT MAX(salary) FROM employee);

-- Retrieve details of the second highest salary employee using OFFSET-FETCH
SELECT *
FROM employee
ORDER BY salary DESC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY;

-- Retrieve details of the second highest salary employee using subquery
SELECT *
FROM employee
WHERE salary = (
    SELECT MAX(salary)
    FROM employee
    WHERE salary < (SELECT MAX(salary) FROM employee)
);

-- Retrieve details of the second highest salary employee using ROW_NUMBER()
WITH RankedEmployees AS (
    SELECT
        *,
        ROW_NUMBER() OVER (ORDER BY salary DESC) AS SalaryRank
    FROM employee
)
SELECT *
FROM RankedEmployees
WHERE SalaryRank = 2;

-- Retrieve details of the employee with the second highest salary using NOT IN
SELECT *
FROM employee
WHERE salary = (
    SELECT MAX(salary)
    FROM employee
    WHERE salary NOT IN (SELECT MAX(salary) FROM employee)
);

-- QUERY 1
WITH RankedEmployees AS (
  SELECT
    EMP_ID,EMP_NAME,SALARY,Dept_name,
    RANK() OVER (PARTITION BY Dept_name ORDER BY SALARY DESC) AS RankOrder FROM EMPLOYEE
)
SELECT EMP_ID,EMP_NAME,SALARY,Dept_name
FROM RankedEmployees WHERE  RankOrder = 1;

-- QUERY 2
WITH CTE AS 
(SELECT EMP_NAME, DEPT_NAME, SALARY,
 ROW_NUMBER() OVER (PARTITION BY DEPT_NAME ORDER BY SALARY DESC) AS ROW_NUM FROM EMPLOYEE)
SELECT EMP_NAME, DEPT_NAME, SALARY
FROM CTE WHERE ROW_NUM = 1;

-- QUERY 3
SELECT E1.EMP_NAME, E1.DEPT_NAME, E1.SALARY
FROM EMPLOYEE E1
WHERE E1.SALARY = (
    SELECT MAX(E2.SALARY)
    FROM EMPLOYEE E2
    WHERE E2.DEPT_NAME = E1.DEPT_NAME
);




