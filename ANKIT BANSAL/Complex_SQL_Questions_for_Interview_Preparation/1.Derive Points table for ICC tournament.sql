-- Creating the icc_world_cup table
CREATE TABLE icc_world_cup (
    Team_1 VARCHAR(20),
    Team_2 VARCHAR(20),
    Winner VARCHAR(20)
);
-- Inserting data into icc_world_cup table
INSERT INTO icc_world_cup VALUES ('India', 'SL', 'India');
INSERT INTO icc_world_cup VALUES ('SL', 'Aus', 'Aus');
INSERT INTO icc_world_cup VALUES ('SA', 'Eng', 'Eng');
INSERT INTO icc_world_cup VALUES ('Eng', 'NZ', 'NZ');
INSERT INTO icc_world_cup VALUES ('Aus', 'India', 'India');

-- Selecting all data from icc_world_cup table
SELECT * FROM icc_world_cup;

/* Three best-performing and soft queries, we can prioritize based on readability, 
simplicity, and performance. Here’s a brief evaluation of each:

1.	CTE Approach:
        •	Uses a Common Table Expression (CTE) to create a temporary result set and aggregate team statistics.
        •	Pros: Easy to read, reusable CTE, modular.
        •	Cons: May be slightly slower due to the CTE overhead.
	2.	Subquery Approach:
        •	Aggregates team statistics directly without using a CTE, employing subqueries instead.
        •	Pros: Slightly faster as it avoids the overhead of a CTE.
        •	Cons: Slightly less readable compared to the CTE approach.
	3.	Simplified Aggregation:
        •	Combines team statistics in a straightforward manner using a subquery.
        •	Pros: Simple and concise, minimal overhead.
        •	Cons: Less modular compared to the CTE approach.
*/

-- 1. CTE Approach
WITH cte_score AS (
    -- Selecting Team_1 as team_name and determining win_flag
    SELECT 
        Team_1 AS team_name, 
        CASE WHEN Team_1 = Winner THEN 1 ELSE 0 END AS win_flag 
    FROM 
        icc_world_cup

    UNION ALL

    -- Selecting Team_2 as team_name and determining win_flag
    SELECT 
        Team_2 AS team_name, 
        CASE WHEN Team_2 = Winner THEN 1 ELSE 0 END AS win_flag 
    FROM 
        icc_world_cup
)
-- Aggregating results to count matches played, won, and lost
SELECT 
    team_name, 
    COUNT(team_name) AS no_of_matches_played, 
    SUM(win_flag) AS no_of_matches_won,
    COUNT(team_name) - SUM(win_flag) AS no_of_matches_lost
FROM 
    cte_score
GROUP BY 
    team_name
ORDER BY 
    no_of_matches_won DESC;

-- 	2.	Subquery Approach:
SELECT 
    team_name, 
    COUNT(team_name) AS no_of_matches_played,
    SUM(CASE WHEN team_name = Winner THEN 1 ELSE 0 END) AS no_of_matches_won,
    COUNT(team_name) - SUM(CASE WHEN team_name = Winner THEN 1 ELSE 0 END) AS no_of_matches_lost
FROM 
    (
        SELECT Team_1 AS team_name, Winner FROM icc_world_cup
        UNION ALL
        SELECT Team_2 AS team_name, Winner FROM icc_world_cup
    ) AS combined_teams
GROUP BY 
    team_name
ORDER BY 
    no_of_matches_won DESC;


-- 	3.	Simplified Aggregation:
SELECT TeamName, 
       COUNT(1) AS Matches_Played, 
       SUM(winflag) AS No_of_wins, 
       COUNT(1) - SUM(winflag) AS No_of_losses
FROM (
    SELECT Team_1 AS TeamName, 
           CASE WHEN Team_1 = Winner THEN 1 ELSE 0 END AS winflag
    FROM icc_world_cup
    UNION ALL
    SELECT Team_2 AS TeamName, 
           CASE WHEN Team_2 = Winner THEN 1 ELSE 0 END AS winflag
    FROM icc_world_cup
) x
GROUP BY TeamName;