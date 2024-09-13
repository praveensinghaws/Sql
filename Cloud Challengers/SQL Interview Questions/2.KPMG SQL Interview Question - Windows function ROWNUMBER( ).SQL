-- Creating the students table
CREATE TABLE students (
    sname VARCHAR(50),
    sid VARCHAR(50),
    marks INT
);

-- Inserting values into the students table
INSERT INTO students (sname, sid, marks) 
VALUES 
    ('A', 'X', 75),
    ('A', 'Y', 75),
    ('A', 'Z', 80),
    ('B', 'X', 90),
    ('B', 'Y', 91),
    ('B', 'Z', 75);

-- Using a Common Table Expression (CTE) to calculate total marks for top 2 entries per student
WITH CTE AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY sname ORDER BY marks DESC) AS rn
    FROM students
)
SELECT 
    sname,
    SUM(marks) AS total_marks
FROM CTE
WHERE rn <= 2
GROUP BY sname;


-- Using subquery to calculate the total marks of the top 2 scores for each student
SELECT 
    sname,
    SUM(marks) AS total_marks
FROM (
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY sname ORDER BY marks DESC) AS rn
    FROM students
) AS X
WHERE rn <= 2
GROUP BY sname;