USE MOVIESDB;

-- Query 1: Subquery with WHERE Clause
-- Calculate age using a subquery and filter the results based on age.
SELECT name, Age FROM 
(
  SELECT *, YEAR(CURDATE()) - birth_year AS Age
  FROM actors
) x
WHERE Age > 70 AND Age < 85
ORDER BY Age;

-- Query 2: HAVING Clause
-- Use HAVING clause to filter results based on calculated age.
SELECT name, YEAR(CURDATE()) - birth_year AS Age
FROM actors
HAVING Age > 70 AND Age < 85
ORDER BY Age;

-- Query 3: BETWEEN Clause
-- Filter results using the BETWEEN clause for age range.
SELECT name, YEAR(CURDATE()) - birth_year AS Age
FROM actors
WHERE YEAR(CURDATE()) - birth_year BETWEEN 71 AND 84
ORDER BY Age;

-- Query 4: Common Table Expression (CTE)
-- Use a CTE to calculate age and filter results in the main query.
WITH ActorAge AS (
  SELECT name, YEAR(CURDATE()) - birth_year AS Age
  FROM actors
)
SELECT name, Age
FROM ActorAge
WHERE Age > 70 AND Age < 85
ORDER BY Age;

-- Query 5: DATEDIFF Function
-- Calculate age using DATEDIFF function and filter results with HAVING clause.
SELECT name, FLOOR(DATEDIFF(CURDATE(), STR_TO_DATE(CONCAT(birth_year, '-01-01'), '%Y-%m-%d')) / 365.25) AS Age
FROM actors
HAVING Age > 70 AND Age < 85
ORDER BY Age;

-- Query 6: Direct WHERE Clause
-- Calculate age directly in the WHERE clause and filter the results.
SELECT name, YEAR(CURDATE()) - birth_year AS Age
FROM actors
WHERE YEAR(CURDATE()) - birth_year > 70 AND YEAR(CURDATE()) - birth_year < 85
ORDER BY Age;
