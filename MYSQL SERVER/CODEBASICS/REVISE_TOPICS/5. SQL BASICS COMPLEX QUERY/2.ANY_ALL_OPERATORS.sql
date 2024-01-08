-- Query 1: Using IN Clause with Subquery
-- Retrieve all columns from 'actors' where actor_id matches any actor_id 
-- in the result set obtained from 'movie_actor' for specified movie_ids.
SELECT *
FROM actors
WHERE actor_id IN (
    SELECT actor_id
    FROM movie_actor
    WHERE movie_id IN (101, 110, 121)
);

-- Query 2: Using EXISTS Clause
-- Retrieve all columns from 'actors' where there exists a record in 'movie_actor' 
-- with the same actor_id and specified movie_ids.
SELECT *
FROM actors a
WHERE EXISTS (
    SELECT 1
    FROM movie_actor ma
    WHERE ma.actor_id = a.actor_id
    AND ma.movie_id IN (101, 110, 121)
);

-- Query 3: Using INNER JOIN
-- Retrieve distinct columns from 'actors' using INNER JOIN with 'movie_actor' 
-- based on matching actor_id and specified movie_ids.
SELECT DISTINCT a.*
FROM actors a
INNER JOIN movie_actor ma ON a.actor_id = ma.actor_id
WHERE ma.movie_id IN (101, 110, 121);

-- Query 4: Using INNER JOIN with IN Clause
-- Retrieve all columns from 'actors' where actor_id matches any actor_id 
-- in the result set obtained from 'movie_actor' using INNER JOIN for specified movie_ids.
SELECT *
FROM actors
WHERE actor_id IN (
    SELECT actor_id
    FROM movie_actor
    WHERE movie_id IN (101, 110, 121)
);

-- Query 5: Using JOIN with WHERE Clause
-- Retrieve all columns from 'actors' using JOIN with 'movie_actor' 
-- based on matching actor_id and specified movie_ids.
SELECT *
FROM actors
JOIN movie_actor ON actors.actor_id = movie_actor.actor_id
WHERE movie_actor.movie_id IN (101, 110, 121);

-- Query 6: Using EXISTS with Correlated Subquery
-- Retrieve all columns from 'actors' where there exists a record in 'movie_actor' 
-- with the same actor_id and specified movie_ids using a correlated subquery.
SELECT *
FROM actors a
WHERE EXISTS (
    SELECT 1
    FROM movie_actor ma
    WHERE ma.actor_id = a.actor_id
    AND ma.movie_id IN (101, 110, 121)
);

-- Query7: Using ANY
--Retrieve all columns from 'actors' where actor_id matches any actor_id 
-- in the result set obtained from 'movie_actor' for specified movie_ids.
SELECT *
FROM actors
WHERE actor_id = ANY (
    SELECT actor_id
    FROM movie_actor
    WHERE movie_id IN (101, 110, 121)
);

--++++++++++++++++++++++++++++++++++++++++++--
-- Query 1: Retrieve all columns from 'movies' where IMDB_RATING is greater than any IMDB_RATING 
--           from movies produced by 'MARVEL STUDIOS', ordered by IMDB_RATING.
SELECT *
FROM movies
WHERE IMDB_RATING > ANY (
    SELECT IMDB_RATING
    FROM movies
    WHERE STUDIO = 'MARVEL STUDIOS'
)
ORDER BY IMDB_RATING;

-- Query 2: Retrieve all columns from 'movies' where IMDB_RATING is greater than the minimum IMDB_RATING 
--           from movies produced by 'MARVEL STUDIOS', ordered by IMDB_RATING.
SELECT *
FROM movies
WHERE IMDB_RATING > (
    SELECT MIN(IMDB_RATING) 
    FROM movies
    WHERE STUDIO = 'MARVEL STUDIOS'
)
ORDER BY IMDB_RATING;

-- Query 3: Retrieve all columns from 'movies' where IMDB_RATING is greater than some IMDB_RATING 
--           from movies produced by 'MARVEL STUDIOS', ordered by IMDB_RATING.
SELECT *
FROM movies
WHERE IMDB_RATING > SOME (
    SELECT IMDB_RATING
    FROM movies
    WHERE STUDIO = 'MARVEL STUDIOS'
)
ORDER BY IMDB_RATING;

-- Query 4: Retrieve all columns from 'movies' where IMDB_RATING is greater than all IMDB_RATING 
--           from movies produced by 'MARVEL STUDIOS', ordered by IMDB_RATING.
SELECT *
FROM movies
WHERE IMDB_RATING > ALL (
    SELECT IMDB_RATING
    FROM movies
    WHERE STUDIO = 'MARVEL STUDIOS'
)
ORDER BY IMDB_RATING;

-- Query 5: Retrieve all columns from 'movies' where IMDB_RATING is greater than the maximum IMDB_RATING 
--           from movies produced by 'MARVEL STUDIOS', ordered by IMDB_RATING.
SELECT *
FROM movies
WHERE IMDB_RATING >  (
    SELECT MAX(IMDB_RATING)
    FROM movies
    WHERE STUDIO = 'MARVEL STUDIOS'
)
ORDER BY IMDB_RATING;
