-- Creating the employees table
CREATE TABLE employees (
    id INT
);

-- Inserting values into the employees table
INSERT INTO employees (id)
VALUES 
    (2),
    (5),
    (6),
    (6),
    (7),
    (8),
    (8);

-- Selecting the maximum id that appears only once
SELECT MAX(id) AS maxid 
FROM (
    SELECT id  
    FROM employees
    GROUP BY id 
    HAVING COUNT(id) = 1
) AS x;


-- Selecting the maximum id that appears only once
SELECT MAX(id) AS maxid 
FROM employees 
WHERE id NOT IN (
    SELECT id  
    FROM employees
    GROUP BY id 
    HAVING COUNT(id) > 1
);