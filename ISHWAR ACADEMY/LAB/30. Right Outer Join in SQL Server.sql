
-- Query 3: Right Outer Join to find financial data without corresponding movie information (title is NULL)
SELECT M.movie_id, M.title, M.studio, M.release_year, F.budget, F.revenue, F.movie_id
FROM movies M
RIGHT OUTER JOIN financials F ON M.movie_id = F.movie_id
WHERE title IS NULL;
