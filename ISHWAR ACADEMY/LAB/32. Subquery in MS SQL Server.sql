
USE DEMO;
DROP TABLE IF EXISTS EmployeeTable;
DROP TABLE IF EXISTS DepartmentTable;

-- Creating EmployeeTable
CREATE TABLE EmployeeTable (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    EmpSalary DECIMAL(10, 2),
    EmpDeptID VARCHAR(10)
);

-- Creating DepartmentTable
CREATE TABLE DepartmentTable (
    DeptID VARCHAR(10) PRIMARY KEY,
    DeptName VARCHAR(50),
    DeptLocation VARCHAR(50)
);

-- Inserting 5 records into EmployeeTable
INSERT INTO EmployeeTable (EmpID, EmpName, EmpSalary, EmpDeptID)
VALUES 
    (1, 'STEVE', 35000.00, 'D1'),
    (2, 'ADAM', 28000.00, 'D2'),
    (3, 'JOHN', 50000.00, 'D3'),
    (4, 'MIKE', 45000.00, 'D2'),
    (5, 'PETER', 60000.00, 'D5');

-- Inserting 4 records into DepartmentTable
INSERT INTO DepartmentTable (DeptID, DeptName, DeptLocation)
VALUES
    ('D1', 'DEVLOPMENT', 'CALIFORNIA'),
    ('D2', 'MARKETING', 'MUMBAI'),
    ('D3', 'ACCOUNTS', 'NEW YORK'),
    ('D4', 'MANAGEMENT', 'SYDNEY');


-- Selecting all records from EmployeeTable and DepartmentTable
SELECT * FROM EmployeeTable;
SELECT * FROM DepartmentTable;


-- Q1. DISPLAY NAME SALARY OF EMPLOYEE WHOSE SALARY IS GREATER THAN MIKS'S SALARY ... 

-- Query: Selecting employee names and salaries where the salary is greater than MIKE's salary
SELECT EmpName, EmpSalary
FROM EmployeeTable
WHERE EmpSalary > (SELECT EmpSalary FROM EmployeeTable WHERE EmpName = 'MIKE');
-- Subquery to get MIKE's salary


-- Q2. DISPLAY NAME SALARY OF EMPLOYEE WHOSE SALARY IS GREATER THAN ADAM'S SALARY AND DEPTNO SAME AS ADAM'S DEPTNO....

-- Query: Selecting employee names and salaries where the salary is greater than ADAM's salary in the same department
SELECT EmpName, EmpSalary
FROM EmployeeTable
WHERE EmpSalary > (SELECT EmpSalary FROM EmployeeTable WHERE EmpName = 'ADAM') 
      -- Subquery to get ADAM's salary
AND EmpDeptID = (SELECT EmpDeptID FROM EmployeeTable WHERE EmpName = 'ADAM');
      -- Subquery to get ADAM's department ID

-- Q3. DISPLAY THE EMPLOYEE INFORMATION WHOSE DEPARTMENT IS LOCATED AT NEW YORK....

-- Query: Selecting employee information for those whose department is located in New York using a subquery
SELECT *
FROM EmployeeTable
WHERE EmpDeptID IN (SELECT DeptID FROM DepartmentTable WHERE DeptLocation = 'NEW YORK');

-- OR OTHER WAY TO DO THIS 
-- Query: Selecting employee information for those whose department is located in New York
SELECT E.*
FROM EmployeeTable E
JOIN DepartmentTable D ON E.EmpDeptID = D.DeptID
WHERE D.DeptLocation = 'NEW YORK';
