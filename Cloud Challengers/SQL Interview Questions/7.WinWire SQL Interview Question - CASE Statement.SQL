-- Creating the happiness_tbl table
CREATE TABLE happiness_tbl (
    ranking INT, 
    country VARCHAR(50)
);

-- Inserting values into happiness_tbl
INSERT INTO happiness_tbl 
VALUES 
    (1, 'Finland'),
    (2, 'Denmark'),
    (3, 'Iceland'),
    (4, 'Israel'),
    (5, 'Netherlands'),
    (6, 'Sweden'),
    (7, 'Norway'),
    (8, 'Switzerland'),
    (9, 'Luxembourg'),
    (128, 'Srilanka'),
    (126, 'India');

-- 1. Query to select countries ordered by a new ranking system
SELECT country
FROM (
    SELECT *,
        CASE 
            WHEN country = 'India' THEN 1 
            WHEN country = 'Srilanka' THEN 2 
            WHEN country = 'Finland' THEN 3 
            ELSE ranking + 1 
        END AS new_rank
    FROM happiness_tbl
) X
ORDER BY 
    new_rank;


-- Using CASE in the ORDER BY clause directly
SELECT 
    country
FROM 
    happiness_tbl
ORDER BY 
    CASE 
        WHEN country = 'India' THEN 1 
        WHEN country = 'Srilanka' THEN 2 
        WHEN country = 'Finland' THEN 3 
        ELSE ranking + 1 
    END;

-- 3. Using IIF Function (if supported)
-- Using IIF function in ORDER BY clause
SELECT 
    country
FROM 
    happiness_tbl
ORDER BY 
    IIF(country = 'India', 1, 
        IIF(country = 'Srilanka', 2, 
            IIF(country = 'Finland', 3, ranking + 1)));

-- 4. Using CTE with ROW_NUMBER()
WITH ranked_cte AS (
    SELECT 
        country,
        ROW_NUMBER() OVER (ORDER BY 
            CASE 
                WHEN country = 'India' THEN 1 
                WHEN country = 'Srilanka' THEN 2 
                WHEN country = 'Finland' THEN 3 
                ELSE ranking + 1 
            END) AS new_rank
    FROM 
        happiness_tbl
)
SELECT 
    country
FROM 
    ranked_cte
ORDER BY 
    new_rank;


-- 5. Using a Mapping Table with a JOIN
-- Creating the rank_mapping table
CREATE TABLE rank_mapping (
    country VARCHAR(50), 
    custom_rank INT
);

-- Inserting custom ranks into the rank_mapping table
INSERT INTO rank_mapping 
VALUES 
    ('India', 1),
    ('Srilanka', 2),
    ('Finland', 3);

-- Querying with JOIN to apply custom ranks
SELECT 
    h.country
FROM 
    happiness_tbl h
LEFT JOIN 
    rank_mapping r ON h.country = r.country
ORDER BY 
    COALESCE(r.custom_rank, h.ranking + 1);