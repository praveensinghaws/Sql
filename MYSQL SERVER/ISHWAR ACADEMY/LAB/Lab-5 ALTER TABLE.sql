-- Alter Table: https://dev.mysql.com/doc/refman/8.0/en/alter-table-examples.html

-- Switch to the 'employeeDB' database
USE employeeDB;

-- Display the list of tables in the current database
SHOW TABLES;

-- Display the structure of the 'employee' table
DESC employee;

-- Retrieve all records from the 'employee' table
SELECT * FROM employee;

-- Add the 'email' column to the 'employee' table with a default value of null
ALTER TABLE employee ADD email varchar(50) DEFAULT NULL;

-- Add 'city' and 'country' columns to the 'employee' table
ALTER TABLE employee ADD (city varchar(50), country varchar(50));

-- Modify the 'name' column in the 'employee' table to allow up to 100 characters
ALTER TABLE employee MODIFY name varchar(100);

-- Change the name of the 'name' column to 'emp_name' in the 'employee' table
ALTER TABLE employee CHANGE name emp_name varchar(50);
