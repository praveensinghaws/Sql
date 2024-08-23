-- Switch to the DEMODB database
USE DEMODB;

-- Create the 'employee' table with columns: emp_id, emp_name, dept_id, salary
CREATE TABLE employee
(
    emp_id INT,
    emp_name VARCHAR(20),
    dept_id INT,
    salary INT
);

-- Insert data into the 'employee' table
INSERT INTO employee
VALUES
    (1, 'Ankit', 100, 10000);
INSERT INTO employee
VALUES
    (2, 'Mohit', 100, 15000);
INSERT INTO employee
VALUES
    (3, 'Vikas', 100, 10000);
INSERT INTO employee
VALUES
    (4, 'Rohit', 100, 5000);
INSERT INTO employee
VALUES
    (5, 'Mudit', 200, 12000);
INSERT INTO employee
VALUES
    (6, 'Agam', 200, 12000);
INSERT INTO employee
VALUES
    (7, 'Sanjay', 200, 9000);
INSERT INTO employee
VALUES
    (8, 'Ashish', 200, 5000);


-- Rank employees based on salary in descending order
SELECT emp_id, emp_name, dept_id, salary,
    RANK() OVER(ORDER BY SALARY DESC) AS rnk,
    DENSE_RANK() OVER(ORDER BY SALARY DESC) AS dense_rnk,
    ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS row_num
FROM employee;

-- Rank employees based on salary within each department in descending order
SELECT emp_id, emp_name, dept_id, salary,
    RANK() OVER(PARTITION BY dept_id ORDER BY SALARY DESC) AS rnk,
    DENSE_RANK() OVER(PARTITION BY dept_id ORDER BY SALARY DESC) AS dense_rnk,
    ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY SALARY DESC) AS row_num
FROM employee;

-- Find employees with the highest salary in each department
SELECT * FROM (
    SELECT emp_id, emp_name, dept_id, salary,
        RANK() OVER(PARTITION BY dept_id ORDER BY SALARY DESC) AS rnk
    FROM employee
) X
WHERE X.rnk = 1;
