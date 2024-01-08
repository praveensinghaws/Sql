-- Rename Table: https://dev.mysql.com/doc/refman/8.0/en/rename-table.html

-- Switch to the 'employeeDB' database
USE employeeDB;

-- Display the list of tables in the current database
SHOW TABLES;

-- Display the structure of the 'employee_information' table
DESC employee_information;

-- RENAME SINGLE TABLE:
-- Rename the 'employee' table to 'employee_information' or 'emp_details'
RENAME TABLE employee TO employee_information; 
-- OR 
ALTER TABLE employee_information RENAME emp_details;

-- RENAME MULTIPLE TABLES:
-- Create a dummy table for demonstration
CREATE TABLE dummy (id INT);

-- Rename the 'emp_details' table to 'employeeDetails' and the 'dummy' table to 'temp'
RENAME TABLE emp_details TO employeeDetails,
            dummy TO temp;

-- Display the list of tables after renaming
SHOW TABLES;
