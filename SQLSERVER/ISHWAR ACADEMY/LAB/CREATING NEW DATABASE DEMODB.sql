USE MASTER;
DROP DATABASE IF EXISTS DEMODB;
CREATE DATABASE DEMODB;
USE DEMODB;

DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;

-- Creating Employee
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    EmpSalary DECIMAL(10, 2),
    EmpDeptID VARCHAR(10)
);

-- Creating Department
CREATE TABLE Department (
    DeptID VARCHAR(10) PRIMARY KEY,
    DeptName VARCHAR(50),
    DeptLocation VARCHAR(50)
);

-- Inserting 5 records into Employee
INSERT INTO Employee (EmpID, EmpName, EmpSalary, EmpDeptID)
VALUES 
    (1, 'STEVE', 65000.00, 'D1'),
    (2, 'ADAM', 58000.00, 'D2'),
    (3, 'JOHN', 80000.00, 'D3'),
    (4, 'MIKE', 75000.00, 'D2'),
    (5, 'PETER', 90000.00, 'D5');

-- Inserting 4 records into Department
INSERT INTO Department (DeptID, DeptName, DeptLocation)
VALUES
    ('D1', 'DEVLOPMENT', 'CALIFORNIA'),
    ('D2', 'MARKETING', 'MUMBAI'),
    ('D3', 'ACCOUNTS', 'NEW YORK'),
    ('D4', 'MANAGEMENT', 'SYDNEY');