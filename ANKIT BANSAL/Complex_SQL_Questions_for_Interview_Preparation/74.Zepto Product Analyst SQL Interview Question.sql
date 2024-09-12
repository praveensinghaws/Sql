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

-----------------------------------------
--  Non-Recursive CTE Approach - ANKIT-1
-----------------------------------------

-- Recursive CTE to generate a descending sequence from the max value in 'numbers' to 1
WITH cte AS (
    -- Anchor member: Start with the maximum number from the 'numbers' table
    SELECT MAX(n) AS n 
    FROM numbers
    UNION ALL
    -- Recursive member: Decrement the value by 1 until it reaches 1
    SELECT n - 1 
    FROM cte 
    WHERE n - 1 >= 1
)
-- Join 'numbers' with the generated sequence to repeat each number according to its value
SELECT num1.n, num2.n  
FROM numbers num1
INNER JOIN cte num2 
    ON num1.n >= num2.n -- Join condition ensures each number is repeated according to its value
ORDER BY num1.n, num2.n; -- Order by both columns to match the desired output

-----------------------------------------
--  Non-Recursive CTE Approach - ANKIT-2
-----------------------------------------

-- Using system views to generate a sequence
WITH cte AS (
    -- Generate a sequence using ROW_NUMBER over a large enough set
    SELECT ROW_NUMBER() OVER(Order by (SELECT NULL)) AS n 
    FROM sys.all_columns
)
-- Join the numbers table with the generated sequence to repeat numbers according to their values
SELECT num1.n, num2.n  
FROM numbers num1
INNER JOIN cte num2 
    ON num1.n >= num2.n 
WHERE num2.n <= (SELECT MAX(n) FROM numbers) -- Limit the sequence up to the maximum value in the 'numbers' table
ORDER BY num1.n, num2.n; -- Order by number and generated sequence


/*
Key Points:
• Recursive CTE Approach: Uses a recursive CTE to incrementally build sequences for each number.
• Non-Recursive CTE Approach: Uses a manual sequence creation with UNION ALL to repeat each number by joining with the sequence.
• Non-Recursive CTE Approach - ANKIT-1: Uses a recursive CTE to generate a descending sequence from the maximum number down to 1.
• Non-Recursive CTE Approach - ANKIT-2: Utilizes ROW_NUMBER() over sys.all_columns to generate a sequence and control repetitions by joining with the numbers table.
*/