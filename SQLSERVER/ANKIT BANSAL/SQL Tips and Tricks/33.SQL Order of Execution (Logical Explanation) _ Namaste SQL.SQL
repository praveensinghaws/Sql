use MoviesDB;
select * from INFORMATION_SCHEMA.TABLES;
/*
FROM => JOIN-1 => JOIN-2 => WHERE => GROUP BY => HAVING => SELECT => ORDER BY => LIMIT OR TOP => 



*/

SELECT TOP 5
studio , AVG(imdb_rating) AS AVG_RATING , SUM(F.budget) AS TOTAL_BUDGET, SUM(F.revenue) AS TOTAL_REVENUE
FROM movies M
JOIN financials F ON M.movie_id=F.movie_id
JOIN movie_actor MA ON MA.movie_id=M.movie_id
WHERE studio IS NOT NULL
GROUP BY studio
HAVING AVG(imdb_rating)>8
ORDER BY studio;


