-- Create the 'numbers' table and insert values.
CREATE TABLE numbers (n INT);

INSERT INTO numbers VALUES (1), (2), (3), (4), (5), (9), (11), (15);

SELECT * FROM numbers;

--------------------------------------
--  Recursive CTE Approach
--------------------------------------

-- Recursive CTE to repeat numbers according to their value
WITH cte AS (
    -- Anchor member: Start with each number and a counter initialized to 1
    SELECT n, 1 AS num_counter 
    FROM numbers
    UNION ALL
    -- Recursive member: Increment the counter and include rows while the counter is less than or equal to the number
    SELECT n, num_counter + 1 AS num_counter
    FROM cte
    WHERE num_counter + 1 <= n
)
-- Select the number from the CTE to get repeated values
SELECT n
FROM cte
ORDER BY n; -- Order by number to match the desired output

--------------------------------------
--  Non-Recursive CTE Approach
--------------------------------------

-- Non-recursive approach using a range of numbers to control repetitions
WITH repeat_counts AS (
    -- Generate a sequence of numbers from 1 to 15 for controlling repetitions
    SELECT 1 AS r
    UNION ALL SELECT 2
    UNION ALL SELECT 3
    UNION ALL SELECT 4
    UNION ALL SELECT 5
    UNION ALL SELECT 6
    UNION ALL SELECT 7
    UNION ALL SELECT 8
    UNION ALL SELECT 9
    UNION ALL SELECT 10
    UNION ALL SELECT 11
    UNION ALL SELECT 12
    UNION ALL SELECT 13
    UNION ALL SELECT 14
    UNION ALL SELECT 15
)
-- Join the numbers table with the repeat_counts to generate repeated values
SELECT num1.n
FROM numbers num1
JOIN repeat_counts rc
ON rc.r <= num1.n -- Ensure that each number is repeated according to its value
ORDER BY num1.n, rc.r; -- Order by number and repeat count to match the desired output