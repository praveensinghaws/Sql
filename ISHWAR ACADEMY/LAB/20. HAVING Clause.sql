
-- Selecting the studio and the average IMDb rating for movies grouped by studio
SELECT studio, AVG(imdb_rating) AS AvgRating

-- From the 'movies' table
FROM movies

-- Grouping the results by the 'studio' column
GROUP BY studio

-- Filtering the grouped results to include only those with an average IMDb rating greater than 8.5
HAVING AVG(imdb_rating) > 8.5;
