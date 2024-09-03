-- Switch to the DEMODB database
USE DEMODB;

-- Select all information about tables in the current database
SELECT *
FROM INFORMATION_SCHEMA.TABLES;

-- Drop table if it exists
DROP TABLE IF EXISTS HappinessData;

-- Create a table to hold the happiness data
CREATE TABLE HappinessData (
    Rank INT,
    Country VARCHAR(50),
    Happiness_2021 DECIMAL(10, 3),
    Happiness_2020 DECIMAL(10, 3),
    [2022_Population] INT
);

-- Copying the "happiness_index.csv" file from the host system to the root directory of Docker container with ID "4d8469ed2793"
docker cp happiness_index.csv 4d8469ed2793:/

-- Bulk insert data from the CSV file
BULK INSERT HappinessData
FROM '/happiness_index.csv'  -- Adjust the path based on the location within the container
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- Selecting data with a derived column
SELECT *,
    CASE WHEN country = 'India' THEN 3
         WHEN country = 'Pakistan' THEN 2
         WHEN country = 'Sri Lanka' THEN 1
         ELSE 0 END AS country_derived
FROM HappinessData
ORDER BY country_derived DESC, Happiness_2021 DESC;

-- Select all records from the HappinessData table
SELECT *
FROM HappinessData
-- Order the result set based on the derived country column and Happiness_2021
ORDER BY 
    CASE 
        WHEN country = 'India' THEN 3
        WHEN country = 'Pakistan' THEN 2
        WHEN country = 'Sri Lanka' THEN 1
        ELSE 0 
    END DESC, 
    Happiness_2021 DESC;



     
