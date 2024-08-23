-- Use the MoviesDB database
USE MoviesDB;

-- Select the top 3 records from the movies table
-- Order the results by IMDb rating in descending order
SELECT TOP 3 * FROM movies
ORDER BY imdb_rating DESC;
