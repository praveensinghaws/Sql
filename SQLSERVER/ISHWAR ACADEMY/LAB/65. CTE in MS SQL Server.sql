--  CTE in MS SQL Server

-- Create a Common Table Expression (CTE) named cte_avg_imdb_rating to calculate the average IMDb rating for each studio.
-- Only consider records where the studio is not null and the average rating is greater than 8.
WITH cte_avg_imdb_rating AS
(
    SELECT 
        studio AS STUDIO_NAME, 
        AVG(IMDB_RATING) AS AVG_RATING
    FROM movies 
    WHERE studio IS NOT NULL 
    GROUP BY studio
    HAVING AVG(IMDB_RATING) > 8
)

-- Create another CTE named CTE_AVGGREATER8 to encapsulate the results of cte_avg_imdb_rating.
-- This CTE is used for clarity and can be extended for further processing.
, CTE_AVGGREATER8 AS 
(
    SELECT * FROM cte_avg_imdb_rating
)

-- Select all records from CTE_AVGGREATER8 to retrieve the calculated average IMDb ratings for each studio.
SELECT TOP 5 * FROM CTE_AVGGREATER8;
