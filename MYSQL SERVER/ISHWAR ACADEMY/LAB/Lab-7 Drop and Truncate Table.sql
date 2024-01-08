/*
Drop Table: https://dev.mysql.com/doc/refman/8.0/en/drop-table.html
Drop Database: https://dev.mysql.com/doc/refman/8.0/en/drop-database.html
Truncate Table: https://dev.mysql.com/doc/refman/8.0/en/truncate-table.html
*/

-- DROP & TRUNCATE 

-- Drop the 'employeeDetails' table (if it exists)
DROP TABLE IF EXISTS employeeDetails; -- Delete single Table 

-- Truncate the 'temp' table
TRUNCATE TABLE temp;

-- Drop the 'TEMP' table if it exists
DROP TABLE IF EXISTS TEMP;

-- Create the 'TEMP' table
CREATE TABLE TEMP (ID INT);

-- Insert data into the 'TEMP' table
INSERT INTO TEMP (ID) VALUES(1),(2),(3),(4),(5);

-- Retrieve all records from the 'TEMP' table
SELECT * FROM TEMP;
