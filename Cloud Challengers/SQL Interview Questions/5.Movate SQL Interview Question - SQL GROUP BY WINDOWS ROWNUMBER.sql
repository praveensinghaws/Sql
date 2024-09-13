-- Creating tablea and tableb
CREATE TABLE tablea (
    empid INT, 
    empname VARCHAR(50), 
    salary INT
);

CREATE TABLE tableb (
    empid INT, 
    empname VARCHAR(50), 
    salary INT
);

-- Inserting values into tablea
INSERT INTO tablea (empid, empname, salary)
VALUES
    (1, 'AA', 1000),
    (2, 'BB', 300);

-- Inserting values into tableb
INSERT INTO tableb (empid, empname, salary)
VALUES
    (2, 'BB', 400),
    (3, 'CC', 100);

-- Approach 1: Using a CTE with UNION ALL and ROW_NUMBER() to select rows with the minimum salary per empid
WITH cte AS (
    SELECT * 
    FROM tablea
    UNION ALL
    SELECT * 
    FROM tableb
)
SELECT empid, empname, salary 
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY empid ORDER BY salary ASC) AS rn
    FROM cte
) AS x
WHERE rn = 1;

-- Approach 2: Using UNION and GROUP BY to select the minimum salary per empid
WITH cte AS (
    SELECT * 
    FROM tablea
    UNION 
    SELECT * 
    FROM tableb
)
SELECT empid, empname, MIN(salary) AS salary 
FROM cte
GROUP BY empid, empname;

-- Approach 3: Using a CTE with UNION and ROW_NUMBER() to select rows with the minimum salary per empid
WITH cte AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY empid ORDER BY salary ASC) AS rn 
    FROM (
        SELECT * 
        FROM tablea
        UNION
        SELECT * 
        FROM tableb
    ) AS x
)
SELECT empid, empname, salary 
FROM cte 
WHERE rn = 1;