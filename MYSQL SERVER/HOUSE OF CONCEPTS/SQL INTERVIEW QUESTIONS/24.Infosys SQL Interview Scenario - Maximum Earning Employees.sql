--CREATE Script
CREATE TABLE emp
(
	empId INT,
	empName VARCHAR(200)
)
CREATE TABLE empsalary
(
	empId INT,
	months INT,
	salary INT
)

--INSERT Script
INSERT emp
VALUES
(4521,'Radhika'),
(3424,'Anuj'),
(5646,'Janvi'),
(8678,'Aparna'),
(9879,'Mohit'),
(6467,'Tarun'),
(7684,'Ishita'),
(2455,'Nitish'),
(8952,'Himanshu')

INSERT empsalary
VALUES 
(4521,14,56476),
(3424,17,65748),
(5646,19,66716),
(8678,14,23427),
(9879,16,78675),
(6467,18,54653),
(7684,11,56427),
(2455,9	,78465),
(8952,8	,31343)

--Scenario
--Here are two tables with employee's details and earnings to be their monthly salary X months worked. Maximum total earnings is the maximum total earnings for any employee. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings.

--Solution 1 :
WITH cte_earning AS
(
SELECT empId,months*salary earning,
RANK() OVER (ORDER BY months*salary DESC) earning_rank
from empsalary
)
SELECT earning maxEarning,COUNT(empId) nbrEmp FROM cte_earning
WHERE earning_rank = 1
GROUP BY earning;

--Solution 2 :

SELECT earning AS maxEarning, COUNT(empId) AS nbrEmp
FROM (
    SELECT empId, months * salary AS earning,
           RANK() OVER (ORDER BY months * salary DESC) AS earning_rank
    FROM empsalary
) AS subquery
WHERE earning_rank = 1
GROUP BY earning;

-- To check the schema of the table in SQL Server Management Studio :
EXEC sp_columns employeesalary;




