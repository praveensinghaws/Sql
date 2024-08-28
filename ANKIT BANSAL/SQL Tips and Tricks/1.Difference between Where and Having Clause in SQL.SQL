-- 1. Difference between WHERE and HAVING Clause in SQL

-- Create the Employee table
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,        -- Unique ID for each employee
    EmpName VARCHAR(100),         -- Name of the employee
    EmpDeptID INT,                -- Department ID of the employee
    EmpSalary DECIMAL(18, 2)      -- Salary of the employee
);

-- Insert sample data into the Employee table
INSERT INTO Employee (EmpID, EmpName, EmpDeptID, EmpSalary)
VALUES 
(1, 'John Doe', 101, 80000),
(2, 'Jane Smith', 102, 72000),
(3, 'Mike Brown', 101, 78000),
(4, 'Lisa White', 103, 71000),
(5, 'Tom Black', 102, 90000);

-- Select all data from the Employee table
SELECT *
FROM Employee;

-- Retrieve the average salary for each department 
-- where the average salary is greater than 75,000,
-- considering only employees with a salary greater than 70,000
SELECT EmpDeptID, AVG(EmpSalary) AS AVG_SALARY
FROM Employee
WHERE EmpSalary > 70000
GROUP BY EmpDeptID
HAVING AVG(EmpSalary) > 75000;