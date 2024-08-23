-- Switch to the demodb database
USE demodb;

-- Create a table named 'strings' with a column 'name' of varchar(50)
CREATE TABLE strings (
    name VARCHAR(50)
);

-- Delete all records from the 'strings' table
DELETE FROM strings;

-- Insert sample data into the 'strings' table
INSERT INTO strings VALUES 
    ('Ankit Bansal'),
    ('Ram Kumar Verma'),
    ('Akshay Kumar Ak k'),
    ('Rahul');

--   Count number Occurrence of a Character or Word in a String

-- Select the 'name', replace spaces with an empty string, and calculate the count of spaces
SELECT 
    name, 
    REPLACE(name, ' ', '') AS rep_name,
    LEN(name) - LEN(REPLACE(name, ' ', '')) AS space_count
FROM 
    strings;

-- Select the 'name', replace an empty string with an empty string (no change), 
-- and calculate the count of occurrences of 'AK' divided by the length of 'AK'
SELECT 
    name, 
    REPLACE(name, '', '') AS rep_name,
    (LEN(name) - LEN(REPLACE(name, 'AK', ''))) / LEN('AK') AS space_count
FROM 
    strings;
