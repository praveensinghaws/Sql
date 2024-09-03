USE DEMODB;

-- Create a table to store Airbnb searches
CREATE TABLE airbnb_searches 
(
    user_id INT,
    date_searched DATE,
    filter_room_types VARCHAR(200)
);

-- Clear existing data from the airbnb_searches table
DELETE FROM airbnb_searches;

-- Insert sample data into the airbnb_searches table
INSERT INTO airbnb_searches VALUES
    (1, '2022-01-01', 'entire home,private room'),
    (2, '2022-01-02', 'entire home,shared room'),
    (3, '2022-01-02', 'private room,shared room'),
    (4, '2022-01-03', 'private room');
/*
FIND THE ROOM TYPES THAT ARE SEARCHED MOST NO OF TIMES.
OUTPUT THE ROOM TYPE ALONGSIDE THE NUMBER OF SEARCHES FOR IT.S
IF THE FILTER FOR ROOM TYPES HAS MORE THAN ONE ROOM TUPE,
SONSIDER EACH UNIQUE ROOM TYPE AS A SEPARATE ROW.
SORT THE RESULT BASED ON THE NUMBER OF SERCHES IN DECENDING ORDER.
*/

-- Select unique room types and count the number of searches for each type
SELECT 
    [value] AS ROOM_TYPE, -- Extracted room type
    COUNT(1) AS NO_OF_SEARCHES -- Count the occurrences of each room type
FROM 
    airbnb_searches
CROSS APPLY 
    STRING_SPLIT(filter_room_types, ',') -- Split the comma-separated room types
GROUP BY 
    [value] -- Group by each unique room type
ORDER BY 
    NO_OF_SEARCHES DESC; -- Order the result by the number of searches in descending order

       -- ANOTHER WAY TO WRITE SAME QUERY 
 
    -- Select unique room types and count the number of searches for each type
SELECT 
    TRIM(value) AS ROOM_TYPE, -- Extracted room type (with leading and trailing spaces removed)
    COUNT(*) AS NO_OF_SEARCHES -- Count the occurrences of each room type
FROM 
    airbnb_searches
CROSS APPLY 
    STRING_SPLIT(filter_room_types, ',') -- Split the comma-separated room types
GROUP BY 
    TRIM(value) -- Group by each unique room type (with leading and trailing spaces removed)
ORDER BY 
    NO_OF_SEARCHES DESC; -- Order the result by the number of searches in descending order

    