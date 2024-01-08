-- Create a table named 'icc_world_cup' with columns: Team_1, Team_2, and Winner
CREATE TABLE icc_world_cup (
    Team_1 VARCHAR(20),
    Team_2 VARCHAR(20),
    Winner VARCHAR(20)
);

-- Insert data into the 'icc_world_cup' table
INSERT INTO icc_world_cup VALUES ('India', 'SL', 'India');
INSERT INTO icc_world_cup VALUES ('SL', 'Aus', 'Aus');
INSERT INTO icc_world_cup VALUES ('SA', 'Eng', 'Eng');
INSERT INTO icc_world_cup VALUES ('Eng', 'NZ', 'NZ');
INSERT INTO icc_world_cup VALUES ('Aus', 'India', 'India');


-- ************************************************************************************************************************************


/*
This query calculates the number of matches played, matches won, and losses for each team based on the 'icc_world_cup' table. 
The subquery combines the information for both Team_1 and Team_2, and the main query aggregates the results for each team. 
The results are then ordered by the number of matches won in descending order.
*/

-- Select all columns from the 'icc_world_cup' table
SELECT 
    *
FROM
    icc_world_cup;

-- Count the number of matches played, matches won, and losses for each team
SELECT 
    Team_Name,
    COUNT(1) AS No_of_Matches_Played,
    SUM(win_flag) AS No_of_Matches_Won,
    COUNT(1) - SUM(win_flag) AS No_of_Losses
FROM
    (
        -- Create a subquery to handle matches where Team_1 is the winner
        SELECT 
            Team_1 AS Team_Name,
            CASE
                WHEN Team_1 = winner THEN 1
                ELSE 0
            END AS win_flag
        FROM
            icc_world_cup
        UNION ALL
        -- Create another subquery to handle matches where Team_2 is the winner
        SELECT 
            Team_2 AS Team_Name,
            CASE
                WHEN Team_2 = winner THEN 1
                ELSE 0
            END AS win_flag
        FROM
            icc_world_cup
    ) A
GROUP BY 
    Team_Name
ORDER BY 
    No_of_Matches_Won DESC;
