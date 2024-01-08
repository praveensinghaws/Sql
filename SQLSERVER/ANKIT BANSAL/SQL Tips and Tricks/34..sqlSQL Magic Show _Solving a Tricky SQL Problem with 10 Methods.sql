select *
from INFORMATION_SCHEMA.TABLES
USE TESTDB;

CREATE TABLE students
(
    student_id INT,
    skill VARCHAR(20)
);

INSERT INTO students
VALUES
    (1, 'sql'),
    (1, 'python'),
    (1, 'tableau'),
    (2, 'sql'),
    (3, 'sql'),
    (3, 'python'),
    (4, 'tableau'),
    (5, 'python'),
    (5, 'tableau');


-- QUESTION: TO FIND STUDENTS WHO ONLY KNOW SQL AND PYTHON

-- SOLUTION 1
-- Using a Common Table Expression (CTE) to assign a binary value (1) to students who know SQL or Python
-- Grouping the results by student_id and filtering to include only students with exactly 2 skills (SQL and Python)
WITH CTE AS (
    SELECT 
        student_id,
        CASE 
            WHEN SKILL = 'SQL' THEN 1
            WHEN SKILL = 'PYTHON' THEN 1
            ELSE NULL
        END AS SKILL_CNT
    FROM students
)
SELECT student_id
FROM CTE 
GROUP BY student_id
HAVING COUNT(SKILL_CNT) = 2 AND COUNT(student_id) = 2;

-- SOLUTION 2
-- Using a Common Table Expression (CTE) to calculate the total number of skills and the number of SQL and Python skills for each student
-- Filtering the results to include only students with exactly 2 total skills and 2 SQL or Python skills
WITH CTE AS (
    SELECT 
        student_id,
        COUNT(*) AS TOTAL_SKILL,
        COUNT(CASE WHEN SKILL IN ('SQL', 'PYTHON') THEN SKILL ELSE NULL END) AS SP_SKILL
    FROM students
    GROUP BY student_id
)
SELECT student_id 
FROM CTE  
WHERE TOTAL_SKILL = 2 AND SP_SKILL = 2;

-- SOLUTION 3
-- Selecting students who know exactly 2 skills, where both skills are either SQL or Python
-- Using the HAVING clause to filter students based on the count of total skills and the count of SQL or Python skills
SELECT 
    student_id
FROM students
GROUP BY student_id
HAVING COUNT(*) = 2 AND COUNT(CASE WHEN SKILL IN ('SQL', 'PYTHON') THEN SKILL ELSE NULL END) = 2;


-- SOLUTION 4
-- Selecting students who know exactly 2 skills, and both skills are either SQL or Python
-- Using the HAVING clause to filter students based on the count of total skills and the count of non-SQL or non-Python skills
SELECT 
    student_id
FROM students
GROUP BY student_id
HAVING COUNT(*) = 2 AND COUNT(CASE WHEN SKILL NOT IN ('SQL', 'PYTHON') THEN SKILL ELSE NULL END) = 0;

-- SOLUTION 5
-- Selecting students who know exactly 2 skills, and both skills are either SQL or Python
-- Using a WHERE clause to filter students based on the absence of non-SQL or non-Python skills
-- Using the HAVING clause to ensure the count of total skills is 2
SELECT 
    student_id
FROM students
WHERE student_id NOT IN (SELECT student_id FROM students WHERE SKILL NOT IN ('SQL', 'PYTHON'))
GROUP BY student_id
HAVING COUNT(*) = 2;

-- SOLUTION 6
-- Selecting students who know exactly 2 skills, and both skills are either SQL or Python
-- Using the HAVING clause to filter students based on the count of total skills
-- Using the EXCEPT operator to exclude students with non-SQL or non-Python skills
SELECT 
    student_id
FROM students
GROUP BY student_id
HAVING COUNT(*) = 2
EXCEPT
SELECT STUDENT_ID FROM students  WHERE SKILL NOT IN ('SQL', 'PYTHON');

-- SOLUTION 7
-- Selecting students who know exactly 2 skills, and both skills are either SQL or Python
-- Using the NOT EXISTS clause to check if there are no non-SQL or non-Python skills for each student
-- Using the GROUP BY and HAVING clauses to ensure the count of total skills is 2
SELECT 
    student_id
FROM students S1
WHERE NOT EXISTS (
    SELECT student_id 
    FROM students S2 
    WHERE S2.skill NOT IN ('SQL', 'PYTHON') 
    AND S1.student_id = S2.student_id
)
GROUP BY student_id
HAVING COUNT(*) = 2;

-- SOLUTION 8
-- Using Common Table Expressions (CTEs) to create separate sets of students with skills in SQL, Python, and others
-- Joining the sets to find students who know both SQL and Python and have no other skills
WITH SQL AS (SELECT * FROM students WHERE SKILL = 'SQL'),
PYTHON AS (SELECT * FROM students WHERE SKILL = 'PYTHON'),
OTHERS AS (SELECT * FROM students WHERE SKILL NOT IN ('SQL', 'PYTHON'))

SELECT S.student_id
FROM SQL S 
INNER JOIN PYTHON P ON S.student_id = P.student_id
LEFT JOIN OTHERS O ON S.student_id = O.student_id
WHERE O.student_id IS NULL;


-- SOLUTION 9
-- Using multiple joins to find students who know both SQL and Python and have no other skills
-- Inner join to match students with SQL skill (S.skill = 'SQL')
-- Inner join to match students with Python skill (P.skill = 'PYTHON')
-- Left join to match students with other skills (O.skill NOT IN ('SQL', 'PYTHON')) and ensure there are none
-- Using WHERE clauses to filter the results
SELECT S.student_id
FROM students S 
INNER JOIN students P ON S.student_id = P.student_id
LEFT JOIN students O ON S.student_id = O.student_id AND O.skill NOT IN ('SQL', 'PYTHON')
WHERE S.skill = 'SQL' AND P.skill = 'PYTHON' AND O.student_id IS NULL;

-- SOLUTION 10
-- Using Common Table Expressions (CTEs) to create separate sets of students with skills in SQL, Python, and others
-- Utilizing the INTERSECT operator to find students who have both SQL and Python skills
-- Using the EXCEPT operator to exclude students with skills other than SQL or Python
WITH SQL AS (SELECT * FROM students WHERE SKILL = 'SQL'),
PYTHON AS (SELECT * FROM students WHERE SKILL = 'PYTHON'),
OTHERS AS (SELECT * FROM students WHERE SKILL NOT IN ('SQL', 'PYTHON'))

SELECT student_id
FROM SQL  
INTERSECT 
SELECT student_id FROM PYTHON
EXCEPT 
SELECT student_id FROM OTHERS;

-- SOLUTION 11 [favorite]
-- Using a Common Table Expression (CTE) to calculate the count of SQL and Python skills for each student
-- Assigning a value of 1 for SQL or Python skills and 5 for other skills to effectively count only SQL and Python skills
-- Using the SUM function to calculate the total count of SQL and Python skills for each student
-- Filtering the results to include only students with exactly 2 SQL or Python skills
WITH CTE AS (
    SELECT 
        student_id,        
        SUM(CASE WHEN SKILL IN ('SQL', 'PYTHON') THEN 1 ELSE 5 END) AS SP_SKILL
    FROM students
    GROUP BY student_id
)
SELECT student_id 
FROM CTE  
WHERE SP_SKILL = 2;







