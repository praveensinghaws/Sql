CREATE TABLE brands (category VARCHAR(50), brand_name VARCHAR(50));

INSERT INTO brands 
VALUES 
    ('chocolates', '5-star'),
    (NULL, 'dairy milk'),
    (NULL, 'perk'),
    (NULL, 'eclair'),
    ('Biscuits', 'Britania'),
    (NULL, 'good day'),
    (NULL, 'boost');

--Solution 1: Using CTEs with ROW_NUMBER and FIRST_VALUE
WITH cte AS (
    SELECT *,
        ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS rn
    FROM brands
),
cte2 AS (
    SELECT *,
        COUNT(category) OVER(ORDER BY rn) AS cnt
    FROM cte
)
SELECT 
    FIRST_VALUE(category) OVER (PARTITION BY cnt ORDER BY rn) AS Category, 
    brand_name
FROM cte2;


