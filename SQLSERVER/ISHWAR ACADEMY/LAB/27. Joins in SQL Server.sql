-- Query 1: Inner Join to retrieve movie details along with financial information
SELECT M.movie_id, M.title, M.studio, M.release_year, F.budget, F.revenue
FROM movies M
JOIN financials F ON M.movie_id = F.movie_id;

-- Query 2: Left Outer Join to find movies without financial data (budget is NULL)
SELECT M.movie_id, M.title, M.studio, M.release_year, F.budget, F.revenue, F.movie_id
FROM movies M
LEFT OUTER JOIN financials F ON M.movie_id = F.movie_id
WHERE budget IS NULL;

-- Query 3: Right Outer Join to find financial data without corresponding movie information (title is NULL)
SELECT M.movie_id, M.title, M.studio, M.release_year, F.budget, F.revenue, F.movie_id
FROM movies M
RIGHT OUTER JOIN financials F ON M.movie_id = F.movie_id
WHERE title IS NULL;


SELECT * FROM financials RIGHT JOIN movies ON financials.movie_id=movies.movie_id