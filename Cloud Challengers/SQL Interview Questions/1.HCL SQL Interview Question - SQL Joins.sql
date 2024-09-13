-- Creating table1
CREATE TABLE table1 (
    id INT
);

-- Inserting values into table1
INSERT INTO table1 (id)
VALUES
    (1),
    (1),
    (2),
    (NULL),
    (NULL);

-- Creating table2
CREATE TABLE table2 (
    id INT
);

-- Inserting values into table2
INSERT INTO table2 (id)
VALUES
    (1),
    (3),
    (NULL);

-------------------------------------------------------------------------------
-- SQL JOINS
-------------------------------------------------------------------------------

-- 1. INNER JOIN: Matching records from both tables.
SELECT *
FROM table1
INNER JOIN table2
ON table1.id = table2.id;

-- 2. LEFT JOIN: Matching records from both tables + non-matching from the left table.
SELECT *
FROM table1
LEFT JOIN table2
ON table1.id = table2.id;

-- 3. RIGHT JOIN: Matching records from both tables + non-matching from the right table.
SELECT *
FROM table1
RIGHT JOIN table2
ON table1.id = table2.id;

-- 4. FULL JOIN: INNER JOIN + non-matching from the left table + non-matching from the right table.
SELECT *
FROM table1
FULL JOIN table2
ON table1.id = table2.id;

-- 5. CROSS JOIN: Cartesian product of table1 and table2. (5 rows from table1 x 3 rows from table2 = 15 records)
SELECT *
FROM table1
CROSS JOIN table2;