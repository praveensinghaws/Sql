USE DEMODB;

-- Drop the 'emp' table if it exists
DROP TABLE IF EXISTS emp;

-- Create the 'emp' table
CREATE TABLE emp
(
    emp_id INT,
    emp_name VARCHAR(20),
    dep_id INT,
    salary INT,
    manager_id INT,
    emp_age INT
);

-- Delete existing data from the 'emp' table (if any)
DELETE FROM emp;

-- Insert data into the 'emp' table
INSERT INTO emp
VALUES
    (1, 'Ankit', 100, 10000, 4, 39),
    (2, 'Mohit', 100, 15000, 5, 48),
    (3, 'Vikas', 100, 10000, 4, 37),
    (4, 'Rohit', 100, 5000, 2, 16),
    (5, 'Mudit', 200, 12000, 6, 55),
    (6, 'Agam', 200, 12000, 2, 14),
    (7, 'Sanjay', 200, 9000, 2, 13),
    (8, 'Ashish', 200, 5000, 2, 12),
    (9, 'Mukesh', 300, 6000, 6, 51),
    (10, 'Rakesh', 500, 7000, 6, 50);

-- Create the 'dept' table
CREATE TABLE dept
(
    dep_id INT,
    dep_name VARCHAR(20)
);

-- Insert data into the 'dept' table
INSERT INTO dept
VALUES
    (100, 'Analytics'),
    (200, 'IT'),
    (300, 'HR'),
    (400, 'Text Analytics');

-- LEFT OUTER JOIN MASTER CLASS

-- Retrieve all columns from EMP and DEPT where the department name is 'Analytics'
SELECT *
FROM EMP 
LEFT JOIN DEPT ON EMP.dep_id = DEPT.dep_id AND DEPT.dep_name = 'Analytics';

-- Retrieve all columns from EMP and a filtered DEPT table where the department name is 'Analytics'
SELECT *
FROM EMP 
LEFT JOIN (SELECT * FROM dept WHERE DEPT.dep_name = 'Analytics') DEPT ON EMP.dep_id = DEPT.dep_id;

-- Retrieve all columns from EMP and DEPT where the department name is 'Analytics'
-- Note: This query is equivalent to the first one but uses a different syntax
SELECT *
FROM EMP 
LEFT JOIN DEPT ON EMP.dep_id = DEPT.dep_id
WHERE DEPT.dep_name = 'Analytics';

-- Retrieve all columns from EMP and DEPT where the department name is 'Analytics' using INNER JOIN
-- Note: INNER JOIN might perform better in certain scenarios
SELECT *
FROM EMP 
INNER JOIN DEPT ON EMP.dep_id = DEPT.dep_id
WHERE DEPT.dep_name = 'Analytics';

-- Interview Question: Retrieve all columns from EMP where there is no corresponding department
SELECT *
FROM EMP 
LEFT JOIN DEPT ON EMP.dep_id = DEPT.dep_id
WHERE DEPT.dep_name IS NULL;

-- Retrieve all columns from EMP and DEPT where salary is 10000
SELECT *
FROM EMP 
LEFT JOIN DEPT ON EMP.dep_id = DEPT.dep_id AND EMP.salary = 10000;

-- Retrieve all columns from EMP where salary is 10000, ignoring DEPT
SELECT *
FROM EMP 
LEFT JOIN DEPT ON EMP.dep_id = DEPT.dep_id 
WHERE EMP.salary = 10000;

-- Retrieve all columns from EMP and DEPT where salary is 10000 using INNER JOIN
-- Note: INNER JOIN is preferred when filtering based on columns from both tables
SELECT *
FROM EMP 
INNER JOIN DEPT ON EMP.dep_id = DEPT.dep_id
WHERE EMP.salary = 10000;
