-- ***** QUERY 1 ******
-- Create a new table named MOVIESNEW
-- Copy all data from the movies table in the MoviesDB database
SELECT * INTO MOVIESNEW
FROM [MoviesDB].[dbo].[movies];

-- Select all records from the newly created MOVIESNEW table
SELECT * FROM MOVIESNEW; -- Corrected table name

-- ***** QUERY 2 ******
-- Switch to the employeeDB database
USE [employeeDB];

-- Create a new table named MOVIE_FIN in the employeeDB database
-- Select specific columns from the joined result of the movies and financials tables
-- The join is based on the 'movie_id' column
SELECT M.movie_id, M.title, M.industry, M.release_year, M.imdb_rating, M.studio, F.budget, F.revenue
INTO MOVIE_FIN
FROM [MoviesDB].[dbo].[movies] M
JOIN [MoviesDB].[dbo].[financials] F ON M.movie_id = F.movie_id;

-- Select all records from the newly created MOVIE_FIN table
SELECT * FROM MOVIE_FIN; -- Corrected table name


