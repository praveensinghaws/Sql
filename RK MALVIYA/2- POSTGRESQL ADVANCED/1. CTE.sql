--Common Table Expression (CTE): 
-- Create a Common Table Expression (CTE) to count the total movies for each actor
WITH CTE_ACTOR_MOVIE_CNT AS (
    SELECT
        fa.actor_id,
        COUNT(f.title) AS Total_movie
    FROM
        public.film f
    JOIN
        public.film_actor fa ON fa.film_id = f.film_id
    GROUP BY
        fa.actor_id
    ORDER BY
        Total_movie DESC
)
-- Select concatenated actor name and total movies
SELECT
    CONCAT(a.first_name, ' ', a.last_name) AS Actor_name,
    cte.Total_movie
FROM
    CTE_ACTOR_MOVIE_CNT cte
JOIN
    actor a ON cte.actor_id = a.actor_id;
