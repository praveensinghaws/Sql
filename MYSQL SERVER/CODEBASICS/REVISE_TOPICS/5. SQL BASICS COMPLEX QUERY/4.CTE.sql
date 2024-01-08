-- CTE: Calculate age for actors based on birth_year
WITH ACTORS_AGE AS (
    SELECT *,
           YEAR(CURDATE()) - birth_year AS Age
    FROM actors
)

-- Query: Select actors with ages between 70 and 85 from the CTE and order by age
SELECT *
FROM ACTORS_AGE
WHERE Age > 70 AND Age < 85
ORDER BY Age;

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ANOTHER WAY TO WRITE SAME QUERY --
-- Query 1: Using Subquery
WITH ActorsAgeSubquery AS (
    SELECT *,
           YEAR(CURDATE()) - birth_year AS Age
    FROM actors
)
SELECT *
FROM ActorsAgeSubquery
WHERE Age > 70 AND Age < 85
ORDER BY Age;

-- Query 2: Using DATEDIFF
WITH ActorsAgeDatediff AS (
    SELECT *,
           FLOOR(DATEDIFF(CURDATE(), STR_TO_DATE(CONCAT(birth_year, '-01-01'), '%Y-%m-%d')) / 365.25) AS Age
    FROM actors
)
SELECT *
FROM ActorsAgeDatediff
WHERE Age > 70 AND Age < 85
ORDER BY Age;

-- Query 3: Using BETWEEN Clause
WITH ActorsAgeBetween AS (
    SELECT *,
           YEAR(CURDATE()) - birth_year AS Age
    FROM actors
)
SELECT *
FROM ActorsAgeBetween
WHERE Age BETWEEN 71 AND 84
ORDER BY Age;

-- Query 4: Using HAVING Clause
WITH ActorsAgeHaving AS (
    SELECT *,
           YEAR(CURDATE()) - birth_year AS Age
    FROM actors
)
SELECT *
FROM ActorsAgeHaving
HAVING Age > 70 AND Age < 85
ORDER BY Age;

-- Query 5: Directly in WHERE Clause
WITH ActorsAgeDirect AS (
    SELECT *,
           YEAR(CURDATE()) - birth_year AS Age
    FROM actors
)
SELECT *
FROM ActorsAgeDirect
WHERE Age > 70 AND Age < 85
ORDER BY Age;

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- QUESTION: Movies that produced 500% profit and their rating was less than the avg rating for all movies.

-- Original Query with Alternative Formulations

WITH cte1 AS (
    SELECT m.movie_id, m.title,
           (f.revenue - f.budget) AS Profit,
           ROUND((f.revenue - f.budget) / f.budget * 100, 2) AS Profit_pct
    FROM movies m
    JOIN financials f ON m.movie_id = f.movie_id
    WHERE IMDB_RATING < (SELECT AVG(IMDB_RATING) FROM movies)
)

-- Query 1: Select movies from the CTE with a profit percentage greater than 500%.
SELECT *
FROM cte1
WHERE Profit_pct > 500;

-- Query 2: Using Subquery in WHERE Clause
SELECT m.movie_id, m.title,
       (f.revenue - f.budget) AS Profit,
       ROUND((f.revenue - f.budget) / f.budget * 100, 2) AS Profit_pct
FROM movies m
JOIN financials f ON m.movie_id = f.movie_id
WHERE IMDB_RATING < (SELECT AVG(IMDB_RATING) FROM movies)
  AND (f.revenue - f.budget) / f.budget * 100 > 500;

-- Query 3: Using HAVING Clause
SELECT m.movie_id, m.title,
       (f.revenue - f.budget) AS Profit,
       ROUND((f.revenue - f.budget) / f.budget * 100, 2) AS Profit_pct
FROM movies m
JOIN financials f ON m.movie_id = f.movie_id
WHERE IMDB_RATING < (SELECT AVG(IMDB_RATING) FROM movies)
HAVING Profit_pct > 500;

-- Query 4: Without CTE
SELECT m.movie_id, m.title,
       (f.revenue - f.budget) AS Profit,
       ROUND((f.revenue - f.budget) / f.budget * 100, 2) AS Profit_pct
FROM movies m
JOIN financials f ON m.movie_id = f.movie_id
WHERE IMDB_RATING < (SELECT AVG(IMDB_RATING) FROM movies)
  AND (f.revenue - f.budget) / f.budget * 100 > 500;

-- Query 5: Using Window Function
SELECT movie_id, title, Profit, Profit_pct
FROM (
    SELECT m.movie_id, m.title,
           (f.revenue - f.budget) AS Profit,
           ROUND((f.revenue - f.budget) / f.budget * 100, 2) AS Profit_pct,
           AVG(IMDB_RATING) OVER () AS Avg_Rating
    FROM movies m
    JOIN financials f ON m.movie_id = f.movie_id
) AS subquery
WHERE IMDB_RATING < (SELECT AVG(IMDB_RATING) FROM movies) AND Profit_pct > 500;


