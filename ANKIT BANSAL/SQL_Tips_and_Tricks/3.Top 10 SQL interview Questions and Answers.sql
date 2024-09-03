-- Drop existing tables to avoid conflicts
IF OBJECT_ID('emp', 'U') IS NOT NULL
BEGIN
    DROP TABLE emp;
END;

IF OBJECT_ID('empnew', 'U') IS NOT NULL
BEGIN
    DROP TABLE empnew;
END;

IF OBJECT_ID('dept', 'U') IS NOT NULL
BEGIN
    DROP TABLE dept;
END;

-- Create the emp table with relevant columns and data types
CREATE TABLE emp (
    emp_id INT,           -- Unique identifier for each employee
    emp_name VARCHAR(50), -- Name of the employee
    department_id INT,    -- Department ID of the employee
    salary DECIMAL(10, 2),-- Salary of the employee
    manager_id INT        -- Manager ID of the employee
);

-- Insert data into the emp table
INSERT INTO emp (emp_id, emp_name, department_id, salary, manager_id)
VALUES
(1, 'Ankit', 100, 10000, 4),
(2, 'Mohit', 100, 15000, 5),
(3, 'Vikas', 100, 10000, 4),
(4, 'Rohit', 100, 5000, 2),
(5, 'Mudit', 200, 12000, 6),
(6, 'Agam', 200, 12000, 2),
(7, 'Sanjay', 200, 9000, 2),
(8, 'Ashish', 200, 5000, 2),
(1, 'Saurabh', 900, 12000, 2);  

-- Create the empnew table with relevant columns and data types
CREATE TABLE empnew (
    emp_id INT PRIMARY KEY, -- Unique identifier for each employee
    emp_name VARCHAR(50),   -- Name of the employee
    department_id INT,      -- Department ID of the employee
    salary DECIMAL(10, 2),  -- Salary of the employee
    manager_id INT          -- Manager ID of the employee
);

-- Insert data into the empnew table
INSERT INTO empnew (emp_id, emp_name, department_id, salary, manager_id)
VALUES
(1, 'Ankit', 500, 10000, 4),
(2, 'Mohit', 100, 15000, 5),
(3, 'Vikas', 100, 10000, 4),
(4, 'Rohit', 100, 5000, 2),
(5, 'Mudit', 200, 12000, 6),
(6, 'Agam', 200, 12000, 2),
(7, 'Sanjay', 200, 9000, 2),
(8, 'Ashish', 200, 5000, 2),
(9, 'Saurabh', 900, 12000, 2);  

-- Create the dept table with relevant columns and data types
CREATE TABLE dept (
    department_id INT PRIMARY KEY,      -- Unique identifier for each department
    department_name VARCHAR(100)        -- Name of the department
);

-- Insert sample data into the dept table
INSERT INTO dept (department_id, department_name)
VALUES
(100, 'Engineering'),
(200, 'Sales'),
(900, 'Administration');

-- Q1: Find duplicates in a given table
SELECT emp_id, COUNT(*) AS cnt
FROM emp
GROUP BY emp_id
HAVING COUNT(*) > 1;

-- Q2: Delete duplicates
WITH cte AS (
    SELECT emp_id,
           ROW_NUMBER() OVER(PARTITION BY emp_id ORDER BY emp_id) AS rn
    FROM emp
)
DELETE FROM emp
WHERE emp_id IN (
    SELECT emp_id
    FROM cte
    WHERE rn > 1
);

-- Q3: Difference between UNION and UNION ALL
SELECT manager_id FROM emp
UNION
SELECT manager_id FROM empnew;

SELECT manager_id FROM emp
UNION ALL
SELECT manager_id FROM empnew;

-- Q4: Difference between RANK, ROW_NUMBER, and DENSE_RANK
-- RANK: Assigns ranks with gaps if there are ties.
-- ROW_NUMBER: Assigns unique row numbers regardless of ties.
-- DENSE_RANK: Assigns ranks without gaps if there are ties.

-- Example:
WITH ranked AS (
    SELECT emp_id, salary,
           RANK() OVER(ORDER BY salary DESC) AS rank,
           ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_number,
           DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank
    FROM emp
)
SELECT * FROM ranked;

-- Q5: Employees who are not present in the department table
-- 1. Slow Performance using subquery
SELECT *
FROM empnew
WHERE department_id NOT IN (SELECT department_id FROM dept);

-- 2. Best Way using LEFT JOIN
SELECT empnew.*, dept.department_name
FROM empnew
LEFT JOIN dept ON empnew.department_id = dept.department_id
WHERE dept.department_name IS NULL;

-- Q6: Second highest salary in each department
WITH cte AS (
    SELECT department_id, salary,
           dense_rank() OVER(PARTITION BY department_id ORDER BY salary DESC) AS rnk
    FROM empnew
)
SELECT department_id, salary
FROM cte
WHERE rnk = 2;

-- Q7: Find all transactions done by 'Shilpa'

-- Step 1: Create the Orders table
CREATE TABLE Orders (
    customer_name NVARCHAR(50),
    order_date DATE,
    order_amount INT,
    customer_gender NVARCHAR(10)
);

-- Step 2: Insert data into the Orders table
INSERT INTO Orders (customer_name, order_date, order_amount, customer_gender)
VALUES
    ('Shilpa', '2020-01-01', 10000, 'Male'),
    ('Rahul', '2020-01-02', 12000, 'Female'),
    ('SHILPA', '2020-01-02', 12000, 'Male'),
    ('Rohit', '2020-01-03', 15000, 'Female'),
    ('shilpa', '2020-01-03', 14000, 'Male');

-- Assuming there is a column indicating transaction details in the 'Orders' table.
-- Since there is no column for transactions or 'Shilpa', this is a placeholder example:

SELECT *
FROM Orders
WHERE upper(customer_name) = 'SHILPA';

-- Q8 -> Self Join manager salary > emp salary.
-- Self Join on empnew to compare manager and employee salaries
SELECT 
    e.emp_id AS employee_id,
    e.emp_name AS employee_name,
    e.salary AS employee_salary,
    m.emp_id AS manager_id,
    m.emp_name AS manager_name,
    m.salary AS manager_salary
FROM 
    empnew e
JOIN 
    empnew m ON e.manager_id = m.emp_id
WHERE 
    m.salary > e.salary;

-- Q9 -> Join Left join/Inner join.

-- Example of INNER JOIN
SELECT 
    e.emp_id,
    e.emp_name,
    e.department_id,
    d.department_name
FROM 
    empnew e
INNER JOIN 
    dept d ON e.department_id = d.department_id;

-- Example of LEFT JOIN
SELECT 
    e.emp_id,
    e.emp_name,
    e.department_id,
    d.department_name
FROM 
    empnew e
LEFT JOIN 
    dept d ON e.department_id = d.department_id;

-- Q 10 ->  Update query to swap gender values in the Orders table
UPDATE Orders
SET customer_gender = 
    CASE 
        WHEN customer_gender = 'Male' THEN 'Female'
        WHEN customer_gender = 'Female' THEN 'Male'
    END
WHERE customer_gender IN ('Male', 'Female');
