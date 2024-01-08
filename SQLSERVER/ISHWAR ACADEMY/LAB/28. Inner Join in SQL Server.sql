-- Query 1: Inner Join to retrieve movie details along with financial information
SELECT M.movie_id, M.title, M.studio, M.release_year, F.budget, F.revenue
FROM movies M
JOIN financials F ON M.movie_id = F.movie_id;

