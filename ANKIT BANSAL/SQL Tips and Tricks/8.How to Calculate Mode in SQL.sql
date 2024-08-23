-- Switch to the DEMODB database
USE DEMODB;
-- Select all information about tables in the current database
SELECT *
FROM INFORMATION_SCHEMA.TABLES;

-- How to Calculate Mode in SQL

-- Create a table named 'mode' with a single column 'id' of type integer
CREATE TABLE mode (id INT);

-- Insert values into the 'mode' table
INSERT INTO mode VALUES (1),(2),(2),(2),(2),(3),(3),(3),(3),(4),(5),(6);

-- Method 1: Using Common Table Expression (CTE)

-- Select all rows from the 'mode' table
SELECT * FROM mode;

-- Create a Common Table Expression (CTE) named 'freq_cte'
-- Calculate the total count of occurrences for each 'id' in the 'mode' table
WITH freq_cte AS (
  SELECT id, COUNT(*) AS freq FROM mode
  GROUP BY id
)

-- Select all rows from the 'frequency' CTE
-- Filter rows where the total count is equal to the maximum total count in the 'frequency' CTE
SELECT * FROM freq_cte
WHERE freq = (SELECT MAX(freq) FROM freq_cte);


-- Method 2: Using RANK

-- Create a Common Table Expression (CTE) named 'freq_cte'
-- Calculate the frequency (count) of each 'id' in the 'mode' table
WITH freq_cte AS (
  SELECT id, COUNT(*) AS freq FROM mode
  GROUP BY id
),

-- Select all columns from the 'freq_cte'
-- Use the RANK() window function to assign a rank to each row based on the frequency in descending order
-- Filter rows where the rank is equal to 1 (top-ranked, indicating the mode)
rnk_cte as (
  SELECT *,
         RANK() OVER(ORDER BY freq DESC) AS rn
  FROM freq_cte
)
SELECT * FROM rnk_cte
WHERE rn = 1;


