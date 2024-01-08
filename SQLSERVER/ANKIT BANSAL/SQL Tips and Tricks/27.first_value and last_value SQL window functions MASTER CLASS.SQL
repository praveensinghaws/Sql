--first_value and last_value SQL window functions MASTER CLASS | Advance SQL

USE DEMODB;

-- Drop the table if it already exists
IF OBJECT_ID('employee', 'U') IS NOT NULL
    DROP TABLE employee;

-- Create the employee table
CREATE TABLE employee (
    emp_id INT,
    emp_name VARCHAR(20),
    dept_id INT,
    salary INT,
    manager_id INT,
    emp_age INT
);

-- Insert data into the employee table
INSERT INTO employee VALUES (1, 'Ankit', 100, 10000, 4, 39);
INSERT INTO employee VALUES (2, 'Mohit', 100, 15000, 5, 48);
INSERT INTO employee VALUES (3, 'Vikas', 100, 10000, 4, 37);
INSERT INTO employee VALUES (4, 'Rohit', 100, 5000, 2, 16);
INSERT INTO employee VALUES (5, 'Mudit', 200, 12000, 6, 55);
INSERT INTO employee VALUES (6, 'Agam', 200, 12000, 2, 14);
INSERT INTO employee VALUES (7, 'Sanjay', 200, 9000, 2, 13);
INSERT INTO employee VALUES (8, 'Ashish', 200, 5000, 2, 12);
INSERT INTO employee VALUES (9, 'Mukesh', 300, 6000, 6, 51);
INSERT INTO employee VALUES (10, 'Rakesh', 500, 7000, 6, 50);


-- Query 1: Retrieve all employees with the youngest and oldest employee based on emp_age.
SELECT *,
    FIRST_VALUE(emp_name) OVER(ORDER BY emp_age) AS Youngest_Employee,
    LAST_VALUE(emp_name) OVER(ORDER BY emp_age) AS Oldest_Employee
FROM employee;

-- Query 2: Retrieve all employees with the youngest and oldest employee in each department based on emp_age.
SELECT *,
    -- Youngest employee in each department
    FIRST_VALUE(emp_name) OVER(PARTITION BY dept_id ORDER BY emp_age ASC) AS Youngest_Employee,
    
    -- Oldest employee in each department (ascending order)
    FIRST_VALUE(emp_name) OVER(PARTITION BY dept_id ORDER BY emp_age DESC) AS Oldest_Employee_1,
    
    -- Oldest employee in each department (descending order)
    LAST_VALUE(emp_name) OVER(PARTITION BY dept_id ORDER BY emp_age 
    ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS Oldest_Employee_2
FROM employee;

