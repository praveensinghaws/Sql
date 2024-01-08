-- Insert Statement: https://dev.mysql.com/doc/refman/8.0/en/insert.html

-- Switch to the 'companyDB' database
USE companyDB;

-- Display the list of tables in the current database
SHOW TABLES;

-- Drop the 'Employee_Details' table if it exists
DROP TABLE IF EXISTS Employee_Details;

-- Create the 'Employee_Details' table
CREATE TABLE Employee_Details 
(
    Emp_ID varchar(10),
    EmpName varchar(20),
    Job varchar(20),
    Salary decimal(10,2),
    DOJ date,
    UPDATE_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert data into the 'Employee_Details' table
INSERT INTO Employee_Details (Emp_ID, EmpName, Job, Salary, DOJ)
VALUES 
    ('Emp001', 'Praveen Singh', 'Data Analyst', 50000, '2023-01-31'),
    ('Emp002', 'Suman Yadav', 'Data Engineer', 40000, '2023-02-25'),
    ('Emp003', 'Rahul Pandey', 'Business Analyst', 45000, '2023-03-20'),
	('Emp004', 'Priyanka Debey', 'Devloper', 45000, curdate());
    
    
-- Insert a new record into the Employee_Details table
-- Columns: Emp_ID, EmpName, Job, Salary, DOJ
-- Use 'Emp001' as the employee ID, 'Praveen Singh' as the employee name
-- Set the salary to 50000 and use the current date for the Date of Joining (DOJ)
INSERT INTO Employee_Details (Emp_ID, EmpName,  Salary, DOJ)
VALUES 
    ('Emp005', 'Sanjay',  20000, CURRENT_DATE);

-- Retrieve all records from the 'Employee_Details' table
SELECT * FROM Employee_Details;
