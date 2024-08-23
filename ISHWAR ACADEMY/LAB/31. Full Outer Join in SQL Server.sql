-- Query: Full Outer Join to retrieve movie details along with financial information, including unmatched records from both tables
USE MoviesDB;

SELECT M.movie_id, M.title, M.studio, M.release_year, F.budget, F.revenue, F.movie_id
FROM movies M
FULL OUTER JOIN financials F ON M.movie_id = F.movie_id;

-- Query: Full Outer Join with condition to retrieve movie details along with financial information, including unmatched records from both tables and those with missing financial data or movie information
SELECT M.movie_id, M.title, M.studio, M.release_year, F.budget, F.revenue, F.movie_id
FROM movies M
FULL OUTER JOIN financials F ON M.movie_id = F.movie_id
WHERE budget IS NULL OR title IS NULL;


SELECT M.movie_id, M.title, M.studio, M.release_year, F.budget, F.revenue, F.movie_id
FROM movies M
FULL OUTER JOIN financials F ON M.movie_id = F.movie_id;