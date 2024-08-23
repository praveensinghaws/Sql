-- Switch to the DEMODB database
USE DEMODB;

-- Select all information about tables in the current database
SELECT *
FROM INFORMATION_SCHEMA.TABLES;


CREATE table t1 (id1 int);
CREATE table t2 (id2 int);

INSERT into t1 VALUES (1),(1),(2),(2),(4),(null);
INSERT into t2 VALUES (1),(1),(1),(3),(2),(2),(null);

SELECT * From t1;
SELECT * From t2;

-- Inner Join: Retrieves rows from both tables where the specified condition is met
SELECT * FROM t1
INNER JOIN t2 ON t1.id1 = t2.id2;

-- Left Join: Retrieves all rows from the left table and the matching rows from the right table. Non-matching rows in the right table will contain NULL values.
SELECT * FROM t1
LEFT JOIN t2 ON t1.id1 = t2.id2;

-- Right Join: Retrieves all rows from the right table and the matching rows from the left table. Non-matching rows in the left table will contain NULL values.
SELECT * FROM t1
RIGHT JOIN t2 ON t1.id1 = t2.id2;

-- Full Join: Retrieves all rows when there is a match in either the left or right table. Non-matching rows in either table will contain NULL values.
SELECT * FROM t1
FULL JOIN t2 ON t1.id1 = t2.id2; -- select 3*2 + 2*2 + 1 + 1


