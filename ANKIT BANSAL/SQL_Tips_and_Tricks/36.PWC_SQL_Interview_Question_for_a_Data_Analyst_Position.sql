-- Create the 'source' table with 'id' as an integer and 'name' as a varchar(5)
CREATE TABLE source (
    id INT,
    name VARCHAR(5)
);

-- Create the 'target' table with 'id' as an integer and 'name' as a varchar(5)
CREATE TABLE target (
    id INT,
    name VARCHAR(5)
);

-- Insert sample data into the 'source' table
INSERT INTO source VALUES 
(1, 'A'), 
(2, 'B'), 
(3, 'C'), 
(4, 'D');

-- Insert sample data into the 'target' table
INSERT INTO target VALUES 
(1, 'A'), 
(2, 'B'), 
(4, 'X'), 
(5, 'F');

-- Solution 1: Compare the 'source' and 'target' tables using a FULL JOIN
-- The query identifies records that are mismatched or missing between the two tables
SELECT 
    COALESCE(source.id, target.id) AS ID, -- Use COALESCE to handle NULL values and display the 'id' from either table
    CASE 
        WHEN source.name IS NULL THEN 'New in Target' -- 'source.name' is NULL indicates the record is new in 'target'
        WHEN target.name IS NULL THEN 'New in Source' -- 'target.name' is NULL indicates the record is new in 'source'
        ELSE 'Mismatch' -- Both names exist but do not match
    END AS Comment
FROM source
FULL JOIN target ON source.id = target.id -- FULL JOIN to capture all mismatches and missing records
WHERE source.name != target.name -- Check for name mismatches
   OR source.name IS NULL        -- Check for records missing in 'source'
   OR target.name IS NULL;       -- Check for records missing in 'target'

-- Solution 2: Using a Common Table Expression (CTE) to compare the 'source' and 'target' tables

WITH cte AS (
    -- Combine records from both 'source' and 'target' tables into a single CTE
    -- Adding a 'TableName' column to identify the source of each record
    SELECT *, 'source' AS TableName FROM source
    UNION ALL
    SELECT *, 'target' AS TableName FROM target
)
SELECT 
    id, -- Select the 'id' column
    -- COUNT(*) AS name_cnt,          -- Uncomment to see the count of records per 'id'
    -- MIN(name) AS min_name,         -- Uncomment to see the minimum name for each 'id'
    -- MAX(name) AS max_name,         -- Uncomment to see the maximum name for each 'id'
    -- MIN(TableName) AS min_tname,   -- Uncomment to see the first occurrence of 'TableName'
    -- MAX(TableName) AS max_tname,   -- Uncomment to see the last occurrence of 'TableName'
    
    CASE 
        WHEN MIN(name) != MAX(name) THEN 'Mismatch' -- Indicates a name mismatch between 'source' and 'target'
        WHEN MIN(TableName) = 'source' THEN 'New in Source' -- Record is only present in 'source'
        ELSE 'New in Target' -- Record is only present in 'target'
    END AS Comment
FROM 
    cte
GROUP BY 
    id -- Group by 'id' to compare records with the same 'id' from both tables
HAVING 
    COUNT(*) = 1 -- Only one record present, indicating it's new in either 'source' or 'target'
    OR (COUNT(*) = 2 AND MIN(name) != MAX(name)); -- Both records exist but names do not match


-- Solution 3: Using FULL JOIN with explicit CASE logic to find mismatches and new entries

-- Combine 'source' and 'target' using FULL JOIN on 'id'
SELECT 
    COALESCE(source.id, target.id) AS ID, -- Use COALESCE to select non-NULL 'id' from either table
    source.name AS SourceName,  -- Select the 'name' from 'source' table
    target.name AS TargetName,  -- Select the 'name' from 'target' table
    CASE 
        WHEN source.name IS NULL THEN 'New in Target' -- If 'source.name' is NULL, the record is new in 'target'
        WHEN target.name IS NULL THEN 'New in Source' -- If 'target.name' is NULL, the record is new in 'source'
        WHEN source.name != target.name THEN 'Mismatch' -- If names differ, it's a mismatch
        ELSE 'Match' -- Both names are the same (optional, if you want to see matches)
    END AS Comment
FROM 
    source
FULL JOIN 
    target ON source.id = target.id -- Perform FULL JOIN on 'id' to include all mismatches
WHERE 
    source.name IS NULL            -- Include records only in 'target'
    OR target.name IS NULL         -- Include records only in 'source'
    OR source.name != target.name; -- Include records with name mismatches