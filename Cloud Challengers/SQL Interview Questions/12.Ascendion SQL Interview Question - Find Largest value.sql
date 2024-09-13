CREATE TABLE tbl_maxval (
    col1 VARCHAR(50), 
    col2 INT, 
    col3 INT
);

INSERT INTO tbl_maxval VALUES 
('a', 10, 20),
('b', 50, 30);

-- Solution 1: Union All with Aggregation
SELECT col1 AS Col1, MAX(col2) AS Max_Val
FROM (
    SELECT col1, col2 FROM tbl_maxval
    UNION ALL
    SELECT col1, col3 FROM tbl_maxval
) x
GROUP BY col1;

--Solution 2: Using GREATEST Function
SELECT col1, GREATEST(col2, col3) AS Max_Val 
FROM tbl_maxval;

--Solution 3: Using CASE Statement
SELECT col1, 
CASE WHEN col2 >= col3 THEN col2 ELSE col3 END AS Max_Val 
FROM tbl_maxval;

--Solution 4: Using CROSS APPLY / LATERAL JOIN
SELECT col1, Max_Val
FROM tbl_maxval
CROSS APPLY (
    SELECT MAX(v) AS Max_Val
    FROM (VALUES (col2), (col3)) AS value_table(v)
) AS result;

-- Solution 5: Union All with Conditions
SELECT col1, col3 AS maxval 
FROM tbl_maxval 
WHERE col3 > col2
UNION ALL
SELECT col1, col2 AS maxval 
FROM tbl_maxval 
WHERE col2 > col3;

--Solution 6: Using CASE Statement for Comparison
SELECT col1, 
       CASE 
           WHEN col3 > col2 THEN col3 
           ELSE col2 
       END AS maxval
FROM tbl_maxval;