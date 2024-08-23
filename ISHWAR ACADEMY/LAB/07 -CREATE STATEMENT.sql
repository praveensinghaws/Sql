
-- Drop the database without checking if it exists
DROP DATABASE IF EXISTS employeeDB;


-- Create a new database named employeeDB
 
CREATE DATABASE employeeDB;

-- Switch to the employeeDB database
USE employeeDB;

-- Create a table named employee_info
CREATE TABLE employee_info (
    EmpId       INTEGER     PRIMARY KEY,
    EmpName     VARCHAR(20) NOT NULL,
    EmpSalary   DECIMAL(10,2) NOT NULL,
    Job         VARCHAR(20),
    Phone       VARCHAR(15) UNIQUE,
    DeptID      INTEGER NOT NULL
);

-- Create a table named department_info
CREATE TABLE department_info (
    DeptId          INTEGER     NOT NULL,
    deptname        VARCHAR(20) NOT NULL,
    deptLocation    VARCHAR(50)
);


-- Execute the query to display tables
SELECT table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE';
