-- View in MS SQL Server


-- Create a view named V_MOVIE_FIN_DETAILS to summarize financial details of movies by industry and studio.
-- The view aggregates budget, revenue, and IMDb ratings from the MOVIES and financials tables.
-- The ORDER BY clause is omitted here, as it is not allowed in views; sorting can be applied when querying the view.
-- Usage: SELECT * FROM V_MOVIE_FIN_DETAILS ORDER BY industry ASC, Total_Revenue DESC, Total_Budget DESC, Avg_rating DESC;
CREATE VIEW V_MOVIE_FIN_DETAILS AS
WITH CTE AS (
    SELECT M.movie_id, M.title, M.industry, M.studio, M.imdb_rating,
           F.revenue, F.budget
    FROM MOVIES M
    JOIN financials F ON M.movie_id = F.movie_id
)
SELECT industry, studio, SUM(budget) AS Total_Budget,
       SUM(revenue) AS Total_Revenue, AVG(imdb_rating) AS Avg_rating
FROM CTE
GROUP BY industry, studio;

-- ====================================================================================================================

-- Create a view named V_MOVIE_FIN_DETAILS_NEW to consolidate financial details of movies by industry and studio.
-- The view utilizes a Common Table Expression (CTE) to join data from MOVIES and financials tables.
-- The result includes the industry, studio, total budget, total revenue, and average IMDb rating.
-- Only records with a non-null studio are considered in the aggregation.
CREATE VIEW V_MOVIE_FIN_DETAILS_NEW AS
WITH CTE AS (
    SELECT M.movie_id, M.title, M.industry, M.studio, M.imdb_rating,
           F.revenue, F.budget
    FROM MOVIES M
    JOIN financials F ON M.movie_id = F.movie_id
)
SELECT industry, studio, SUM(budget) AS Total_Budget,
       SUM(revenue) AS Total_Revenue, AVG(imdb_rating) AS Avg_rating
FROM CTE
WHERE studio IS NOT NULL 
GROUP BY industry, studio;

-- ====================================================================================================================

-- Create a view named AVG_GREATER9 to filter records from V_MOVIE_FIN_DETAILS_NEW where the average IMDb rating is greater than or equal to 9.
CREATE VIEW V_AVG_GREATER_85
AS
SELECT * FROM [dbo].[V_MOVIE_FIN_DETAILS_NEW] WHERE Avg_rating >8.5;

-- Retrieve records from AVG_GREATER9 view to get movies with an average IMDb rating greater than or equal to 9.
SELECT * FROM DBO.V_AVG_GREATER_85


