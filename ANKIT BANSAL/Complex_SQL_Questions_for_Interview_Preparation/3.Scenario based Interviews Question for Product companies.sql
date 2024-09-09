-- Create the entries table
CREATE TABLE entries (
    name VARCHAR(20),
    address VARCHAR(20),
    email VARCHAR(20),
    floor INT,
    resources VARCHAR(10)
);

-- Insert data into the entries table
INSERT INTO entries 
VALUES 
    ('A', 'Bangalore', 'A@gmail.com', 1, 'CPU'),
    ('A', 'Bangalore', 'A1@gmail.com', 1, 'CPU'),
    ('A', 'Bangalore', 'A2@gmail.com', 2, 'DESKTOP'),
    ('B', 'Bangalore', 'B@gmail.com', 2, 'DESKTOP'),
    ('B', 'Bangalore', 'B1@gmail.com', 2, 'DESKTOP'),
    ('B', 'Bangalore', 'B2@gmail.com', 1, 'MONITOR');

---------------------------------------------------------------------------------------------------
--                  SOLUTION:1
---------------------------------------------------------------------------------------------------
WITH cte_floor_visit AS (
    -- Determine the visit count per floor for each name
    SELECT 
        name,
        [floor],
        COUNT(*) AS visit_count
    FROM 
        entries
    GROUP BY 
        name, [floor]
),
cte_max_floor_visit AS (
    -- Determine the maximum visit count per name
    SELECT
        name,
        MAX(visit_count) AS max_visit_count
    FROM 
        cte_floor_visit
    GROUP BY 
        name
),
cte_most_visited_floor AS (
    -- Select the floor with the maximum visit count for each name
    SELECT 
        fv.name,
        fv.[floor] AS most_visited_floor
    FROM 
        cte_floor_visit fv
    INNER JOIN 
        cte_max_floor_visit mv
    ON 
        fv.name = mv.name AND fv.visit_count = mv.max_visit_count
),
cte_visit AS (
    -- Calculate the total number of visits per name
    SELECT 
        name,
        COUNT(*) AS Total_Visit
    FROM 
        entries
    GROUP BY 
        name
),
cte_distinct_resources AS (
    -- Concatenate distinct resources by name using STRING_AGG
    SELECT 
        name,
        STRING_AGG(resource, ', ') AS resources_list
    FROM (
        SELECT DISTINCT name, resources AS resource
        FROM entries
    ) AS distinct_resources
    GROUP BY 
        name
)
-- Combine total visits, most visited floor, and concatenated distinct resources
SELECT 
    cv.name,
    cv.Total_Visit,
    cfv.most_visited_floor,
    cr.resources_list
FROM 
    cte_visit cv
INNER JOIN 
    cte_most_visited_floor cfv
ON 
    cv.name = cfv.name
INNER JOIN 
    cte_distinct_resources cr
ON 
    cv.name = cr.name;

---------------------------------------------------------------------------------------------------
--                  SOLUTION:2
---------------------------------------------------------------------------------------------------
WITH
    distinct_resources AS (
        SELECT DISTINCT name, resources
        FROM entries
    ),
    agg_resources AS (
        SELECT name, STRING_AGG(resources, ',') AS used_resources
        FROM distinct_resources
        GROUP BY name
    ),
    total_visit AS (
        SELECT name, COUNT(1) AS total_visites, STRING_AGG(resources, ',') AS resources_used
        FROM entries
        GROUP BY name
    ),
    floor_visit AS (
        SELECT 
            name, 
            [floor], 
            COUNT(1) AS no_of_floor_visit,
            RANK() OVER (PARTITION BY name ORDER BY COUNT(1) DESC) AS rn
        FROM entries
        GROUP BY name, [floor]
    )
SELECT 
    fv.name, 
    fv.[floor] AS most_visited_floor, 
    tv.total_visites, 
    ar.used_resources
FROM 
    floor_visit fv
    INNER JOIN total_visit tv ON fv.name = tv.name
    INNER JOIN agg_resources ar ON ar.name = fv.name
WHERE 
    fv.rn = 1;

---------------------------------------------------------------------------------------------------
--                  SOLUTION:3
---------------------------------------------------------------------------------------------------
WITH 
    floor_visit AS (
        SELECT 
            name, 
            [floor], 
            COUNT(*) AS no_of_floor_visit,
            RANK() OVER (PARTITION BY name ORDER BY COUNT(*) DESC) AS rn
        FROM entries
        GROUP BY name, [floor]
    )
SELECT 
    fv.name,
    fv.[floor] AS most_visited_floor,
    (SELECT COUNT(*) FROM entries WHERE name = fv.name) AS total_visits,
    (
        SELECT 
            STUFF(
                (SELECT DISTINCT ',' + resources 
                 FROM entries e 
                 WHERE e.name = fv.name 
                 FOR XML PATH('')), 
                1, 1, ''
            ) AS used_resources
    )
FROM 
    floor_visit fv
WHERE 
    fv.rn = 1;

/*
• Using FOR XML PATH with DISTINCT: The subquery uses FOR XML PATH('') with DISTINCT to remove duplicates and concatenate resources.
• STUFF Function: Removes the leading comma from the concatenated string.
*/