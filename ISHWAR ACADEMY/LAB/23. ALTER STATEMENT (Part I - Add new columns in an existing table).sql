-- Describe table using INFORMATION_SCHEMA.COLUMNS for the emp_details table
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'emp_details';

-- Create a table named 'emp_details' with columns 'id' (integer) and 'name' (varchar with max length 10)
CREATE TABLE emp_details
(
    id INT,
    name VARCHAR(10)
);

-- Add a new column 'salary' to the 'emp_details' table with data type decimal
ALTER TABLE emp_details ADD salary DECIMAL;

-- Insert data into the 'emp_details' table, including values for the 'salary' column
INSERT INTO emp_details VALUES
(1, 'Praveen', 10000),
(2, 'ravi', 7000);

-- Add a new column 'phone' to the 'emp_details' table with data type varchar(10), allowing null values
ALTER TABLE emp_details ADD phone VARCHAR(10) NULL;

-- Select all records from the 'emp_details' table
SELECT * FROM emp_details;

-- Add a new column 'project_completed' to the 'emp_details' table with data type int, not null, and default value 5
ALTER TABLE emp_details ADD project_completed INT NOT NULL DEFAULT 5;

-- Add a new column 'projectID' to the 'emp_details' table with data type integer, allowing null values, and a unique constraint
ALTER TABLE emp_details ADD projectID INTEGER NULL CONSTRAINT pID_unique_key UNIQUE;


-- Insert a new record into the 'emp_details' table
INSERT INTO emp_details VALUES (2, 'Rahul', 40000, '9876543210', DEFAULT, 10);


-- Describe table using INFORMATION_SCHEMA.COLUMNS for the emp_details table
SELECT *
FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE
WHERE TABLE_NAME = 'emp_details';


-- Create a table named 'company_info' with a column 'id' of type integer
CREATE TABLE company_info (id INT);

-- Alter the 'company_info' table to add a 'revenue' column with data type decimal (10,2), allowing null values
-- Also, add a 'project_id' column with data type integer and set it as the primary key
ALTER TABLE company_info
ADD revenue DECIMAL(10,2) NULL,
    project_id INTEGER CONSTRAINT projectid_pk PRIMARY KEY;


SELECT * FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE