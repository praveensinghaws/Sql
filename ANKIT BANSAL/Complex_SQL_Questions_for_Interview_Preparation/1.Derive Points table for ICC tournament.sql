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


WITH cte_score AS 
(
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


-- Alternative Approach Using Subqueries
-- Selecting team statistics without a CTE using subqueries
SELECT 
    team_name, 
    COUNT(team_name) AS no_of_matches_played,
    SUM(CASE WHEN team_name = Winner THEN 1 ELSE 0 END) AS no_of_matches_won,
    COUNT(team_name) - SUM(CASE WHEN team_name = Winner THEN 1 ELSE 0 END) AS no_of_matches_lost
FROM 
    (
        -- Subquery for Team_1
        SELECT Team_1 AS team_name, Winner FROM icc_world_cup
        UNION ALL
        -- Subquery for Team_2
        SELECT Team_2 AS team_name, Winner FROM icc_world_cup
    ) AS combined_teams
GROUP BY 
    team_name
ORDER BY 
    no_of_matches_won DESC;