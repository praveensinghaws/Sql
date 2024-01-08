-- Switch to the MoviesDB database
USE MoviesDB;

-- Common Table Expression (CTE) to calculate total revenue for each industry and studio
WITH
    SALES_VALUE
    AS
    (
        SELECT
            INDUSTRY,
            STUDIO,
            SUM(REVENUE_MLN_INR) AS TOTAL_REVENUE
        FROM
            MOVIE_FIN
        GROUP BY
            INDUSTRY,
            STUDIO
    )

-- Select the top 5 studios by total revenue within each industry
SELECT
    *
FROM
    (
        SELECT
            *,
            RANK() OVER(PARTITION BY INDUSTRY ORDER BY TOTAL_REVENUE DESC) AS RN
        FROM
            SALES_VALUE
    ) X
WHERE
    RN <= 5;

-- Alternative approach to achieve the same result using a subquery
SELECT
    *
FROM
    (
        SELECT
            INDUSTRY,
            STUDIO,
            SUM(REVENUE_MLN_INR) AS TOTAL_REVENUE,
            RANK() OVER(PARTITION BY INDUSTRY ORDER BY SUM(REVENUE_MLN_INR) DESC) AS RN
        FROM
            MOVIE_FIN
        GROUP BY
            INDUSTRY,
            STUDIO
    ) X
WHERE
    RN <= 5;
