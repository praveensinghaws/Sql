-- Switch to the 'companydb' database
USE companydb;

-- Create a trigger to update UPDATE_TIME column on UPDATE
DELIMITER //
CREATE TRIGGER before_employee_update
BEFORE UPDATE ON employee_details
FOR EACH ROW
SET NEW.UPDATE_TIME = CURRENT_TIMESTAMP;
//
DELIMITER ;

-- Retrieve all records from the 'employee_details' table
SELECT * FROM employee_details;

-- Update the 'Salary' column in the 'employee_details' table
-- Add 5000 to the existing values
UPDATE employee_details SET Salary = Salary + 5000;

-- Update the 'job' column to 'Youtuber' for the employee with the name 'Sanjay'
UPDATE employee_details SET Job = 'Youtuber' WHERE EmpName = 'Sanjay';

-- Update the 'Salary' column by adding 20000 for employees 
-- whose 'emp_id' ends with a digit greater than 3
UPDATE employee_details SET Salary = Salary - 20000 WHERE RIGHT(emp_id, 1) IN (3, 1);

-- Create a new table 'empnew' based on the data from 'employee_details'
CREATE TABLE empnew AS
SELECT * FROM employee_details;

-- Add a new column 'Emp_Category' to the 'employee_details' table
ALTER TABLE employee_details ADD Emp_Category varchar(20);

-- Update 'Emp_Category' based on the salary
UPDATE employee_details SET Emp_Category = 'Senior Employee' WHERE salary >= 40000;
UPDATE employee_details SET Emp_Category = 'Junior Employee' WHERE salary < 40000;

-- Retrieve all records from the 'employee_details' table after updates
SELECT * FROM employee_details;

