-- Creating the cinema_tbl table
CREATE TABLE cinema_tbl (
    seat_id INT, 
    free INT
);

-- Inserting values into cinema_tbl
INSERT INTO cinema_tbl 
VALUES 
    (1, 1),
    (2, 0),
    (3, 1),
    (4, 0),
    (5, 1),
    (6, 1),
    (7, 1),
    (8, 0),
    (9, 1),
    (10, 1);

-- 1. Using LAG and LEAD with a CTE
-- Using LAG and LEAD functions with CTE to find seats adjacent to free seats
WITH cte AS (
    SELECT 
        seat_id, 
        free,
        LAG(free, 1, 0) OVER (ORDER BY seat_id) AS prev_free,
        LEAD(free, 1, 0) OVER (ORDER BY seat_id) AS next_free
    FROM 
        cinema_tbl
)
-- Selecting seat_id where either the previous or next seat is free
SELECT 
    seat_id 
FROM 
    cte 
WHERE 
    free = 1 
    AND (prev_free = 1 OR next_free = 1);

-- 2. Using SUM with Window Functions
-- Using SUM with window functions to find adjacent free seats
WITH cte AS (
    SELECT *,
        SUM(free) OVER (ORDER BY seat_id ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS prev_row,
        SUM(free) OVER (ORDER BY seat_id ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) AS next_row
    FROM cinema_tbl
)
SELECT 
    seat_id
FROM 
    cte
WHERE 
    prev_row = 2 OR next_row = 2;


--3. Self-contained Subquery
-- Using a self-contained subquery to find adjacent free seats
SELECT 
    seat_id 
FROM (
    SELECT 
        seat_id, 
        free, 
        LAG(free) OVER (ORDER BY seat_id) AS previous, 
        LEAD(free) OVER (ORDER BY seat_id) AS next_
    FROM 
        cinema_tbl
) AS a
WHERE 
    (free + previous >= 2) OR (free + next_ >= 2);
