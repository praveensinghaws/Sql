-- Using a Common Table Expression (CTE) to filter unique ids
WITH cte AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) AS rn 
    FROM employees
)
-- Selecting the maximum id where the id appears only once
SELECT MAX(id) AS maxid 
FROM cte 
WHERE id NOT IN (
    SELECT id 
    FROM cte 
    WHERE rn > 1
);

