

-- EXL Analysis SQL Interview Question | 2 Different ways of solutions.

-- Drop the existing database and create a new one
DROP DATABASE IF EXISTS ankitdb;
CREATE DATABASE ankitdb;
USE ankitdb;

-- Drop the table if it exists and create a new one
DROP TABLE IF EXISTS city_population;

CREATE TABLE city_population (
    state VARCHAR(50),
    city VARCHAR(50),
    population INT
);

-- Insert the data
INSERT INTO city_population (state, city, population) VALUES ('haryana', 'ambala', 100);
INSERT INTO city_population (state, city, population) VALUES ('haryana', 'panipat', 200);
INSERT INTO city_population (state, city, population) VALUES ('haryana', 'gurgaon', 300);
INSERT INTO city_population (state, city, population) VALUES ('punjab', 'amritsar', 150);
INSERT INTO city_population (state, city, population) VALUES ('punjab', 'ludhiana', 400);
INSERT INTO city_population (state, city, population) VALUES ('punjab', 'jalandhar', 250);
INSERT INTO city_population (state, city, population) VALUES ('maharashtra', 'mumbai', 1000);
INSERT INTO city_population (state, city, population) VALUES ('maharashtra', 'pune', 600);
INSERT INTO city_population (state, city, population) VALUES ('maharashtra', 'nagpur', 300);
INSERT INTO city_population (state, city, population) VALUES ('karnataka', 'bangalore', 900);
INSERT INTO city_population (state, city, population) VALUES ('karnataka', 'mysore', 400);
INSERT INTO city_population (state, city, population) VALUES ('karnataka', 'mangalore', 200);


-- SOLUTION 1:

WITH CTE AS 
(
    SELECT 
        *,
        MAX(population) OVER (PARTITION BY state) AS max_population,
        MIN(population) OVER (PARTITION BY state) AS min_population 
    FROM 
        city_population
)
SELECT 
    state,
    MAX(CASE WHEN population = max_population THEN city ELSE NULL END) AS highest_populated_city,
    MIN(CASE WHEN population = min_population THEN city ELSE NULL END) AS lowest_populated_city
FROM 
    CTE
GROUP BY 
    state;


-- SOLUTION 2:

WITH CTE AS 
(
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY state ORDER BY population DESC) AS rn_desc,
        ROW_NUMBER() OVER (PARTITION BY state ORDER BY population ASC) AS rn_asc 
    FROM 
        city_population
)
SELECT 
    state,
    MAX(CASE WHEN rn_desc = 1 THEN city ELSE NULL END) AS highest_populated_city,
    MIN(CASE WHEN rn_asc = 1 THEN city ELSE NULL END) AS lowest_populated_city
FROM 
    CTE
GROUP BY 
    state;