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

-- Add a new column 'phone' to the 'students' table
ALTER TABLE students ADD phone VARCHAR(15);

-- Describe the structure of the 'students' table
DESC students;

-- Modify the 'phone' column to have a length of 20 characters and make it NOT NULL
ALTER TABLE students MODIFY phone VARCHAR(20) NOT NULL;

-- This statement is redundant and can be removed as the previous ALTER already modified the phone column
-- ALTER TABLE students MODIFY phone VARCHAR(20) NOT NULL;

-- Rename the column 'phone' to 'mobile' in the 'students' table
ALTER TABLE students RENAME COLUMN phone TO mobile;

-- Drop the 'mobile' column from the 'students' table
ALTER TABLE students DROP COLUMN mobile;

-- Insert records into the 'students' table with specified name and city
INSERT INTO students (name, city) VALUES
    ("Praveen Singh", "Lucknow"),
    ("Rahul Gandhi", "Delhi"),
    ("Priyanka", "Mumbai");

-- Insert records into the 'students' table, specifying the columns 'name' and 'city'.
-- The 'id' column will auto-increment as it's not specified in the insertion.
INSERT INTO students (name, city) VALUES
    ("Akhilesh Yadav", "Lucknow"),
    ("Kapil Sharma", "Punjab");


-- Start of the transaction (optional but recommended for data consistency)
START TRANSACTION;

-- Updating a student's name
UPDATE students 
SET name = "Priyanka Gandhi" 
WHERE name = "Priyanka";

-- Updating a student's name and city
UPDATE students 
SET name = "Praveen Kumar Singh", city = "Sultanpur" 
WHERE id = 1;

-- Deleting specific students
DELETE FROM students 
WHERE id IN (3, 5);

-- Creating a new table based on the existing students table
CREATE TABLE studentnew AS (
    SELECT id AS student_id, 
           name AS student_name, 
           city AS student_city 
    FROM students
);

-- Commit the transaction
COMMIT;

-- This query selects all students where the city is not "Lucknow" using the '!=' operator.
SELECT * FROM students 
WHERE city != "Lucknow";

-- This query selects all students where the city is not "Lucknow" using the 'NOT' keyword to negate the equality check.
SELECT * FROM students 
WHERE NOT city = "Lucknow";

-- This query selects all students where the city is not "Lucknow" using the '<>' operator, which is the standard SQL way to represent "not equal to".
SELECT * FROM students 
WHERE city <> "Lucknow";

-- Select all records from the 'students' table
SELECT * FROM students;





