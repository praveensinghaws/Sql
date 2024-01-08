-- Switch to the 'employeeDB' database
USE employeeDB;

-- Select all records from the 'EMPLOYEE_INFO' table
SELECT * FROM EMPLOYEE_INFO;

-- Update job title to 'Data Analyst' for employees in the department with deptid = 103
UPDATE EMPLOYEE_INFO
SET job = 'Data Analyst'
WHERE deptid = 103;

-- Increase the salary of all employees in the 'employee_info' table by 500
UPDATE employee_info 
SET EmpSalary = EmpSalary + 500;
