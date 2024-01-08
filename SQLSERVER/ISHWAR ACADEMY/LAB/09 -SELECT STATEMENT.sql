-- Switch to the 'employeeDB' database
USE employeeDB;

-- Display a list of tables in the 'employeeDB' database using INFORMATION_SCHEMA
SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'employeeDB';

-- Selecting specific columns from the 'employee_info' table
SELECT EMPID, EMPNAME, empSALARY
FROM employee_info;
