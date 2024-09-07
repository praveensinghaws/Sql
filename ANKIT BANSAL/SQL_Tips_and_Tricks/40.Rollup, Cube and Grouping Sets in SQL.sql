---------------------------------------------
-- Rollup, Cube, and Grouping Sets in SQL
---------------------------------------------

DROP TABLE IF EXISTS Orders;
GO
-- Creating the 'orders' table with columns for Continent, Country, City, and Amount
CREATE TABLE orders
(
    Id INT PRIMARY KEY IDENTITY,   -- Auto-incrementing primary key
    Continent NVARCHAR(50),        -- Continent name
    Country NVARCHAR(50),          -- Country name
    City NVARCHAR(50),             -- City name
    Amount INT                     -- Order amount
);

-- Inserting sample data into the 'orders' table
INSERT INTO orders VALUES ('Asia', 'India', 'Bangalore', 1000);
INSERT INTO orders VALUES ('Asia', 'India', 'Chennai', 2000);
INSERT INTO orders VALUES ('Asia', 'Japan', 'Tokyo', 4000);
INSERT INTO orders VALUES ('Asia', 'Japan', 'Hiroshima', 5000);
INSERT INTO orders VALUES ('Europe', 'United Kingdom', 'London', 1000);
INSERT INTO orders VALUES ('Europe', 'United Kingdom', 'Manchester', 2000);
INSERT INTO orders VALUES ('Europe', 'France', 'Paris', 4000);
INSERT INTO orders VALUES ('Europe', 'France', 'Cannes', 5000);

-- Displaying all data from the 'orders' table
SELECT * FROM Orders;

-- Using UNION ALL to manually simulate ROLLUP
-- Step 1: Grouping by Continent, Country, and City
SELECT Continent, Country, City, SUM(Amount) AS Amount 
FROM Orders
GROUP BY Continent, Country, City

UNION ALL

-- Step 2: Grouping by Continent only (excluding Country and City)
SELECT Continent, NULL AS Country, NULL AS City, SUM(Amount) AS Amount 
FROM Orders
GROUP BY Continent

UNION ALL

-- Step 3: Grouping by Continent and Country (excluding City)
SELECT Continent, Country, NULL AS City, SUM(Amount) AS Amount 
FROM Orders
GROUP BY Continent, Country

UNION ALL

-- Step 4: Grand total (no grouping columns)
SELECT NULL AS Continent, NULL AS Country, NULL AS City, SUM(Amount) AS Amount 
FROM Orders;

-- Using ROLLUP to automatically calculate subtotals and grand totals
SELECT Continent, Country, City, SUM(Amount) AS Amount 
FROM Orders
GROUP BY ROLLUP(Continent, Country, City);

-- Using CUBE to calculate all possible combinations of the groupings
SELECT Continent, Country, City, SUM(Amount) AS Amount 
FROM Orders
GROUP BY CUBE(Continent, Country, City);

-- Using GROUPING SETS to explicitly specify the grouping combinations
-- Example 1: Grouping by Continent and Country, and separately by City
SELECT Continent, Country, City, SUM(Amount) AS Amount 
FROM Orders
GROUP BY GROUPING SETS ((Continent, Country), (City));

-- Example 2: Grouping by Continent and Country, by City, and by Continent and City
SELECT Continent, Country, City, SUM(Amount) AS Amount 
FROM Orders
GROUP BY GROUPING SETS ((Continent, Country), (City), (Continent, City));