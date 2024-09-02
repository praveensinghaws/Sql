-- Switch to the database named 'durgeshdb'
USE demodb;

-- Show all tables in the current database
SHOW TABLES;

-- Drop the table 'students' if it exists
DROP TABLE IF EXISTS students;

-- Create the 'students' table with columns id, name, and city
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(500)
);

-- Insert 10 records into the 'students' table
INSERT INTO students (name, city) VALUES
    ("Praveen Singh", "Lucknow"),
    ("Rahul Gandhi", "Delhi"),
    ("Priyanka Sharma", "Mumbai"),
    ("Akhilesh Yadav", "Lucknow"),
    ("Kapil Sharma", "Punjab"),
    ("Amitabh Bachchan", "Mumbai"),
    ("Deepika Padukone", "Bangalore"),
    ("Virat Kohli", "Delhi"),
    ("MS Dhoni", "Ranchi"),
    ("Sundar Pichai", "Madurai");

-- Add a new column 'fee' of type INT to the 'students' table
ALTER TABLE students ADD fee INT;

-- Update the 'fee' column with random values between 100 and 500
UPDATE students 
SET fee = FLOOR(100 + (RAND() * (500 - 100 + 1)));
----------------------
-- STRING FUNCTIONS |
----------------------
-- Select the length of the string "My Name is Praveen Singh" and alias it as 'LenghthofString'
SELECT LENGTH("My Name is Praveen Singh") AS LenghthofString;

-- Select the 'name' and its length from the 'students' table, aliasing the length as 'NameLength'
SELECT name, LENGTH(name) AS NameLength FROM students;

-- Concatenate the strings "Praveen", "Kumar", and "Singh" into one full name and alias it as 'Fullname'
SELECT CONCAT("Praveen", "Kumar", "Singh") AS Fullname;

-- Concatenate 'name', '--->>>', 'city', and '--->>>', 'fee' columns from the 'students' table and alias it as 'CityandName'
SELECT CONCAT(name, "--->>>", city, "--->>>", fee) AS CityandName FROM students;

-- Select 'name' from the 'students' table and convert it to lowercase, showing it in the second column
SELECT name, LCASE(name) FROM students;

-- Select 'name' from the 'students' table and convert it to uppercase, showing it in the second column
SELECT name, UCASE(name) FROM students;

-- Capitalize the first letter of the 'name' column and make the rest lowercase
-- Note: This only capitalizes the first letter of the entire string, not each word
SELECT name, CONCAT(UPPER(SUBSTRING(name, 1, 1)), LOWER(SUBSTRING(name, 2))) AS ProperName FROM students;

-- Extracts a substring from the provided string starting at position 1 with a length of 3 characters
SELECT SUBSTRING("My Name is Praveen Singh", 1, 3);

-- Removes leading and trailing spaces from the provided string
SELECT TRIM("      My Name is Praveen Singh               ");

-- Reverses the characters in the provided string
SELECT REVERSE("Praveen");

-- Compares two strings
-- Returns 0 if string1 is equal to string2
-- Returns -1 if string1 is less than string2
-- Returns 1 if string1 is greater than string2
SELECT STRCMP('string1', 'string2');

-- Compares 'apple' and 'banana'
-- Since 'apple' is less than 'banana', the function returns -1
SELECT STRCMP('apple', 'banana');

-- Compares 'cherry' and 'cherry'
-- Since both strings are equal, the function returns 0
SELECT STRCMP('cherry', 'cherry');

-- Compares 'date' and 'apple'
-- Since 'date' is greater than 'apple', the function returns 1
SELECT STRCMP('date', 'apple');

------------------------------
-- OTHER IMPORTENT FUNCTIONS |
------------------------------

-- Returns the current date
SELECT CURDATE() AS CurrentDate;

-- Returns the current time
-- Note: The correct function for current time is CURTIME(), not CURtime()
SELECT CURTIME() AS CurrentTime;

-- Returns the current date and time
SELECT NOW() AS CurrentDateTime;

-- Extracts and returns the year part from the current date
SELECT YEAR(CURDATE());

-- Extracts and returns the year part from the specified date '1990-08-11'
SELECT YEAR("1990-08-11");

-- Returns 'yes' if the condition (test) is true, otherwise returns 'no'
-- Example: IF(1 > 0, 'Yes', 'No') returns 'Yes'
SELECT IF(1 > 0, 'Yes', 'No');

-- Selects all columns from the 'students' table
-- Adds a computed column 'comment' which will contain "Have to Pay" if the 'fee' column value is greater than 250
-- Otherwise, 'comment' will contain "Not Required"
SELECT *, 
       IF(fee > 250, "Have to Pay", "Not Required") AS comment 
FROM students;


-- Returns 'Test' if the provided value is NULL, otherwise returns the value itself
-- Example: IFNULL(NULL, 'Test') returns 'Test'
SELECT IFNULL(NULL, 'Test');

-- Returns 'Praveen' if it is not NULL
-- If 'Praveen' were NULL, it would return 'Test' instead
-- Since 'Praveen' is not NULL, the result is 'Praveen'
SELECT IFNULL("Praveen", 'Test');

-- Returns the name of the current database
-- Example: If the current database is 'mydb', this will return 'mydb'
SELECT DATABASE();

-- Returns the version of the MySQL database server
-- Example: Returns something like '8.0.27'
SELECT VERSION();

-- Returns the name of the current user
-- Example: Returns something like 'root@localhost'
SELECT USER();

-- Retrieves the name of the current database, the MySQL version, and the current user
SELECT 
    DATABASE() AS DataBaseName,  -- Returns the name of the current database
    VERSION() AS SqlVersion,     -- Returns the version of the MySQL server
    USER() AS SqlUser;           -- Returns the name of the current user

-- Retrieves all columns for students with IDs in the list (1, 3, 7, 10)
SELECT * 
FROM students 
WHERE id IN (1, 3, 7, 10);

-- Retrieves all columns for students with IDs not in the list (1, 3, 7, 10)
SELECT * 
FROM students 
WHERE id NOT IN (1, 3, 7, 10);

-- LIKE OPERATORS
/*
Wildcards are used in SQL queries with the LIKE operator to match patterns in string data. Here’s how each wildcard works:

	•	% (percent sign): Represents zero or more characters.
	•	Example: LIKE 'a%' matches any string that starts with ‘a’, including ‘a’, ‘abc’, ‘a123’, etc.
	•	_ (underscore): Represents exactly one character.
	•	Example: LIKE 'a_c' matches any string where ‘a’ is followed by any single character, and then ‘c’, such as ‘abc’, ‘a1c’, or ‘a@c’.
*/
-- Matches any name that starts with 'P'
SELECT * FROM students WHERE name LIKE 'P%';

-- Matches any name that is exactly 8 characters long and starts with 'M'
SELECT * FROM students WHERE name LIKE 'M_______';

-- Matches any name where the second character is 'a' and the third character is 'p'
SELECT * FROM students WHERE name LIKE '_ap%';

-- Retrieves all rows from the 'students' table where the 'name' ends with the letter 'i'
SELECT * 
FROM students 
WHERE name LIKE "%i";

-- Retrieves all rows from the 'students' table where the 'name' contains the substring 'Singh' anywhere
SELECT * 
FROM students 
WHERE name LIKE "%Singh%";

-- Retrieves all rows from the 'students' table where the 'name' has 'a' as the second character
-- and any characters following it
SELECT * 
FROM students 
WHERE name LIKE "_a%";

-- Retrieves all rows from the 'students' table where the 'name' is exactly 11 characters long
SELECT * 
FROM students 
WHERE name LIKE "___________";  -- 11 underscores represent exactly 11 characters

------------------------------
-- PRIMARY KEY & FOREIGN KEY |
------------------------------

-- Create the 'students' table with columns id, name, city, and fee
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,  -- Auto-incremented ID column
    name VARCHAR(100) NOT NULL,        -- Name column, cannot be NULL
    city VARCHAR(500),                  -- City column, can be NULL
    fee INT                             -- Fee column, can be NULL
);

-- Insert 10 records into the 'students' table
INSERT INTO students (name, city, fee) VALUES
    ("Praveen Singh", "Lucknow", 1000),
    ("Rahul Gandhi", "Delhi", 2000),
    ("Priyanka Sharma", "Mumbai", 1500),
    ("Akhilesh Yadav", "Lucknow", 2200),
    ("Kapil Sharma", "Punjab", 1800),
    ("Amitabh Bachchan", "Mumbai", 1300),
    ("Deepika Padukone", "Bangalore", 2300),
    ("Virat Kohli", "Delhi", 1400),
    ("MS Dhoni", "Ranchi", 800),
    ("Sundar Pichai", "Madurai", 900);

-- Create the 'laptops' table with a foreign key
CREATE TABLE laptops (
    laptop_id INT PRIMARY KEY,           -- Laptop ID column
    model VARCHAR(100),                  -- Model column
    price DECIMAL(10,2),                 -- Price column with two decimal places
    sid INT,                             -- Foreign key column
    FOREIGN KEY (sid) REFERENCES students(id)  -- Foreign key constraint
);

-- Insert records into the 'laptops' table
INSERT INTO laptops (laptop_id, model, price, sid) VALUES
    (12345, "Dell 45415", 40000.00, 1),
    (12346, "Lenovo 43210", 50000.00, 1),
    (12347, "Dell 123", 60000.00, 2),
    (12348, "Mac mini M2", 49999.00, 2),
    (12349, "HP 123", 39000.00, 10);

-----

-- Create the 'laptops' table with columns laptop_id, model, and price
-- Note: This table does not yet include the foreign key column 'sid'
CREATE TABLE laptops (
    laptop_id INT PRIMARY KEY,           -- Unique identifier for each laptop
    model VARCHAR(100),                  -- Model name of the laptop
    price DECIMAL(10,2)                  -- Price of the laptop with up to 10 digits and 2 decimal places
);

-- Add a new column 'sid' to the 'laptops' table to store student IDs
ALTER TABLE laptops ADD sid INT;

-- Add a foreign key constraint on the 'sid' column, linking it to the 'id' column in the 'students' table
-- This ensures that 'sid' must match a valid 'id' from the 'students' table
ALTER TABLE laptops ADD FOREIGN KEY(sid) REFERENCES students(id);

-- Display the structure of the 'laptops' table, showing columns and their data types
DESC laptops;

-- Insert records into the 'laptops' table
-- Note: Ensure the 'sid' values correspond to valid 'id' values in the 'students' table
INSERT INTO laptops (laptop_id, model, price, sid) VALUES
    (12345, "Dell 45415", 40000.00, 1),   -- Laptop for student with ID 1
    (12346, "Lenovo 43210", 50000.00, 1),  -- Laptop for student with ID 1
    (12347, "Dell 123", 60000.00, 2),      -- Laptop for student with ID 2
    (12348, "Mac mini M2", 49999.00, 2);   -- Laptop for student with ID 2

-- Attempt to insert a record with 'sid' value 10, which should correspond to a valid 'id' in 'students'
-- Note: Ensure that the student with ID 10 exists in the 'students' table
INSERT INTO laptops (laptop_id, model, price, sid) VALUES
    (12349, "HP 123", 39000.00, 10);


-- Create the 'qualifications' table
CREATE TABLE qualifications (
    qid INT PRIMARY KEY AUTO_INCREMENT,  -- Unique identifier for each qualification, auto-incremented
    pass_year VARCHAR(4) NOT NULL,       -- The year of passing, stored as a string (e.g., '2024')
    name VARCHAR(200) NOT NULL,          -- Name of the qualification (e.g., 'Bachelor of Science')
    about VARCHAR(500),                  -- Description or additional details about the qualification
    sid INT,                             -- Foreign key column to reference students
    FOREIGN KEY (sid) REFERENCES students(id)  -- Foreign key constraint linking 'sid' to 'id' in the 'students' table
);

-- Insert records into the 'qualifications' table
INSERT INTO qualifications (name, pass_year, about, sid) VALUES
    ("BTECH", "2019", "FROM IIT", 2),    -- Record for student with ID 2
    ("MTECH", "2022", "FROM AKTU", 2),    -- Record for student with ID 2
    ("BTECH", "2020", "FROM IIT", 3),    -- Record for student with ID 3
    ("MTECH", "2023", "FROM AKTU", 3),    -- Record for student with ID 3
    ("BTECH", "2017", "FROM IIT", 4),    -- Record for student with ID 4
    ("MTECH", "2020", "FROM AKTU", 4),    -- Record for student with ID 4
    ("BTECH", "2012", "FROM IIT", 5),    -- Record for student with ID 5
    ("MTECH", "2015", "FROM AKTU", 5),    -- Record for student with ID 5
    ("BTECH", "2018", "FROM IIT", 6),    -- Record for student with ID 6
    ("MTECH", "2021", "FROM AKTU", 6);    -- Record for student with ID 6

----
-- DROP FOREIGN KEY 
-- Find the foreign key constraint name
SHOW CREATE TABLE qualifications;

-- Drop the foreign key constraint
ALTER TABLE qualifications DROP FOREIGN KEY qualifications_ibfk_1;

-- Optionally, drop the foreign key column
ALTER TABLE qualifications DROP COLUMN sid;

--

-- Select all records from the 'students' table to verify the data
SELECT * FROM students;

-- Select all records from the 'laptops' table to verify the data and foreign key relationships
SELECT * FROM laptops;
