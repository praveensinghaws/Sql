-- Query 1: Retrieve actor information along with the count of movies they are associated with,
--           ordered by the movie count in descending order.
SELECT actor_id, NAME,
    (SELECT COUNT(*) FROM movie_actor WHERE actor_id = actors.actor_id) AS MOVIES_COUNT
FROM actors
ORDER BY MOVIES_COUNT DESC;

-- Query 2: Using JOIN with IFNULL to handle NULL values
SELECT a.actor_id, NAME, COUNT(IFNULL(ma.actor_id, 0)) AS MOVIES_COUNT
FROM actors a
LEFT JOIN movie_actor ma ON a.actor_id = ma.actor_id
GROUP BY a.actor_id, NAME
ORDER BY MOVIES_COUNT DESC;

-- Query 3: Using LEFT JOIN with IFNULL to handle NULL values
SELECT actors.actor_id, NAME, COUNT(IFNULL(movie_actor.actor_id, 0)) AS MOVIES_COUNT
FROM actors
LEFT JOIN movie_actor ON actors.actor_id = movie_actor.actor_id
GROUP BY actors.actor_id, NAME
ORDER BY MOVIES_COUNT DESC;

-- Query 4: Using CTE with IFNULL to handle NULL values
WITH ActorMoviesCount AS (
    SELECT actor_id, COUNT(*) AS MOVIES_COUNT
    FROM movie_actor
    GROUP BY actor_id
)
SELECT actors.actor_id, actors.NAME, COALESCE(ActorMoviesCount.MOVIES_COUNT, 0) AS MOVIES_COUNT
FROM actors
LEFT JOIN ActorMoviesCount ON actors.actor_id = ActorMoviesCount.actor_id
ORDER BY MOVIES_COUNT DESC;
