-- Data Types: https://dev.mysql.com/doc/refman/8.0/en/data-types.html
-- Create Table: https://dev.mysql.com/doc/refman/8.0/en/create-table.html

-- Switch to the 'employeeDB' database
USE employeeDB;

-- Create the 'employee' table with specified columns and data types
CREATE TABLE employee 
(
    emp_number varchar(10),
    name varchar(50),
    job varchar(50),
    salary decimal(10,2),
    date_of_joining date
); 

-- Display the list of tables in the current database
SHOW TABLES;

-- Display the structure of the 'employee' table
DESC employee;
