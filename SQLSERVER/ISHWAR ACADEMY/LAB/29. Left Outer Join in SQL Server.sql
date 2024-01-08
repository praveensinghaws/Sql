
-- Query 2: Left Outer Join to find movies without financial data (budget is NULL)
SELECT M.movie_id, M.title, M.studio, M.release_year, F.budget, F.revenue, F.movie_id
FROM movies M
LEFT OUTER JOIN financials F ON M.movie_id = F.movie_id
WHERE budget IS NULL;

