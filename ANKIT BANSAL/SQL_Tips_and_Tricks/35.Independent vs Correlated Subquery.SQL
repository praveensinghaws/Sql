select * from INFORMATION_SCHEMA.TABLES
-- Create the emp table
CREATE TABLE emp (
    emp_id int,
    emp_name varchar(20),
    department_id int,
    salary int,
    manager_id int,
    emp_age int
);

-- Insert data into the emp table
INSERT INTO emp VALUES (1, 'Ankit', 100, 10000, 4, 39);
INSERT INTO emp VALUES (2, 'Mohit', 100, 15000, 5, 48);
INSERT INTO emp VALUES (3, 'Vikas', 100, 10000, 4, 37);
INSERT INTO emp VALUES (4, 'Rohit', 100, 5000, 2, 16);
INSERT INTO emp VALUES (5, 'Mudit', 200, 12000, 6, 55);
INSERT INTO emp VALUES (6, 'Agam', 200, 12000, 2, 14); 
INSERT INTO emp VALUES (7, 'Sanjay', 200, 9000, 2, 13);
INSERT INTO emp VALUES (8, 'Ashish', 200, 5000, 2, 12);
INSERT INTO emp VALUES (9, 'Mukesh', 300, 6000, 6, 51);
INSERT INTO emp VALUES (10, 'Rakesh', 300, 7000, 6, 50);

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- Q. Write a SQL to print employee details whose salary is more than the department average salary.

-- SOLUTION 1
SELECT e.*,d.avg_dep_salary
FROM emp e
-- Inner joining with a subquery that calculates the average salary for each department
INNER JOIN (
    SELECT department_id, AVG(salary) AS avg_dep_salary
    FROM emp
    -- Grouping by department_id to calculate the average salary for each department
    GROUP BY department_id
) d ON e.department_id = d.department_id
-- Filtering records based on the salary criterion
WHERE e.salary > d.avg_dep_salary;

-- Comments:
-- 1. The query is designed to be run independently to retrieve the desired records.
-- 2. It runs only once and efficiently calculates the average salary for each department before comparing with individual salaries.


-- SOLUTION 2
-- Selecting records from the "EMP" table where the salary is greater than the average salary of the corresponding department
-- Using a correlated subquery to calculate the average salary for each department

SELECT * 
FROM EMP E1
-- Filtering records based on the salary criterion with a correlated subquery
WHERE SALARY > (
    -- Correlated subquery to calculate the average salary for the current department of the outer query
    SELECT AVG(E2.salary)
    FROM EMP E2
    -- Correlation by matching the department_id of the outer and inner queries
    WHERE E1.department_id = E2.department_id
);

-- Comments:
-- This query retrieves employee records where the salary is greater than the average salary of their respective departments.
-- The correlated subquery dynamically calculates the average salary for each department in the outer query.
-- This approach provides a flexible way to compare salaries based on department averages.
