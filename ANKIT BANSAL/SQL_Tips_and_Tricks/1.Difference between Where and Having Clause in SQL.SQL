-- 1. Difference between WHERE and HAVING Clause in SQL

DROP TABLE IF EXISTS Employee;
-- Create the Employee table
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,        -- Unique ID for each employee
    EmpName VARCHAR(100),         -- Name of the employee
    EmpDeptID INT,                -- Department ID of the employee
    EmpSalary DECIMAL(18, 2)      -- Salary of the employee
);

-- Insert 8 rows into the Employee table with EmpID between 5000 and 15000 and only two department IDs
INSERT INTO Employee (EmpID, EmpName, EmpDeptID, EmpSalary)
VALUES 
(1, 'Alice Johnson', 201, 85000),
(2, 'Bob Williams', 202, 77000),
(3, 'Carol Taylor', 201, 91000),
(4, 'David Lee', 202, 68000),
(5, 'Eve Walker', 201, 82000),
(6, 'Frank Harris', 202, 76000),
(7, 'Grace Hall', 201, 89000),
(8, 'Henry Young', 202, 80000);

-- Select all data from the Employee table
SELECT *
FROM Employee ORDER BY EmpDeptID;

-- Retrieve the average salary for each department 
-- where the average salary is greater than 75,000,
-- considering only employees with a salary greater than 70,000
SELECT EmpDeptID, AVG(EmpSalary) AS AVG_SALARY
FROM Employee
-- WHERE EmpSalary > 70000
GROUP BY EmpDeptID
HAVING AVG(EmpSalary) > 75000;

