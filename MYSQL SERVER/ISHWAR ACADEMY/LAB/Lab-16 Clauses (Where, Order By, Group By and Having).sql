-- Clauses (Where, Order By, Group By and Having) : https://dev.mysql.com/doc/refman/8.0/en/select-optimization.html

-- Query 1: Selects revenue in INR and currency from the financials table where revenue is greater than 10000, ordered by revenue in descending order.
SELECT
    revenue AS Revenue_INR,
    currency
FROM
    financials
WHERE
    revenue > 10000
ORDER BY
    revenue DESC;

-- Query 2: Selects currency, unit, and the count of records grouped by currency and unit from the financials table, ordered by count in descending order.
SELECT
    currency,
    unit,
    COUNT(*) AS Cnt
FROM
    financials
GROUP BY
    currency,
    unit
ORDER BY
    Cnt DESC;

-- Query 3: Selects currency and the total revenue (sum of revenue) grouped by currency from the financials table, ordered by total revenue in descending order.
SELECT
    currency,
    SUM(revenue) AS Total_Revenue
FROM
    financials
GROUP BY
    currency
ORDER BY
    Total_Revenue DESC;
    


-- Selects information about movies grouped by release year
SELECT 
    release_year,                  -- Column: Release year
    COUNT(*) AS Count,             -- Column: Count of movies in each release year
    AVG(imdb_rating) AS Avg_rating, -- Column: Average IMDb rating in each release year
    MIN(imdb_rating) AS Min_rating, -- Column: Minimum IMDb rating in each release year
    MAX(imdb_rating) AS Max_rating  -- Column: Maximum IMDb rating in each release year
FROM
    movies
GROUP BY
    release_year                    -- Groups the results by release year
HAVING
    Count > 1                       -- Filters the results to only include years with more than one movie
ORDER BY
    release_year;                   -- Orders the results by release year in ascending order

