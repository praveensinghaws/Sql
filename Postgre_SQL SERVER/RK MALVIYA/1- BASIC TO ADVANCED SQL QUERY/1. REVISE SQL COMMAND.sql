--****************************************************************************
-- DDL DATA DEFENATION LANGUAGE: CREATE , DROP  , TRUNCATE , RENAME AND ALTER
--****************************************************************************
 -- Retrieving all columns from the 'employee' table in the 'demo_test' schema.

SELECT *
FROM DEMO_TEST.EMPLOYEE;

-- Clearing all data from the 'employee' table in the 'demo_test' schema.
TRUNCATE TABLE DEMO_TEST.EMPLOYEE;

-- Deleting the entire 'emp' table from the 'demo_test' schema.

DROP TABLE DEMO_TEST.EMP;

-- Creating a new table 'EMPLOYEE' in the 'DEMO_TEST' schema.

CREATE TABLE DEMO_TEST.EMPLOYEE (EMP_ID INT PRIMARY KEY,
																																		EMP_NAME VARCHAR(50));

-- Inserting a new record into the 'employee' table in the 'demo_test' schema.

INSERT INTO DEMO_TEST.EMPLOYEE (EMP_ID,

																								EMP_NAME)
VALUES (1, 'Praveen Singh');

-- Modifying the data type of the 'EMP_NAME' column in the 'employee' table.

ALTER TABLE DEMO_TEST.EMPLOYEE
ALTER COLUMN EMP_NAME TYPE VARCHAR(100);

-- Query: Rename the column EMP_NAME to EMPLOYEE_NAME in the demo_test.employee table.

ALTER TABLE DEMO_TEST.EMP RENAME COLUMN EMP_NAME TO EMPLOYEE_NAME;

-- Renaming the 'employee' table to 'EMP' in the 'demo_test' schema.

ALTER TABLE DEMO_TEST.EMPLOYEE RENAME TO EMP;


ALTER TABLE DEMO_TEST.EMP RENAME COLUMN EMPLOYEE_NAME TO EMP_NAME;

---------------------------------------------------------------------------------

-- Create a table called `students`
CREATE TABLE demo_test.students (
  -- `student_id` is the primary key and is an auto-incrementing integer
  student_id SERIAL PRIMARY KEY,

  -- `first_name` is a required string of up to 50 characters
  first_name VARCHAR(50) NOT NULL,

  -- `last_name` is a required string of up to 50 characters
  last_name VARCHAR(50) NOT NULL,

   -- `phone` is a required string of up to 255 characters and must be unique
  phone VARCHAR(255) NOT NULL UNIQUE,

  -- `email` is a unique string of up to 50 characters
  email VARCHAR(50) UNIQUE,

  -- `grad_year` is an optional integer
  grad_year INTEGER
);

--************************************************************
-- DML DATA MANIPULATION LANGUAGE: INSERT , UPDATE AND DELETE
--************************************************************
---------------------------------------------------------------
INSERT INTO demo_test.students (first_name, last_name, phone, email, grad_year)
VALUES
  ('Praveen', 'Singh', '123-456-7890', 'praveen@gmail.com', 2023),
  ('Vinay', 'Gupta', '987-654-3210', 'vinay@gmail.com', 2024),
  ('Krishna', 'Pandey', '555-555-5555', 'krishna@gmail.com', 2025),
  ('Sonu', 'Mishra', '222-222-2222', 'sonum@gmail.com', 2026),
  ('Sonu', 'Singh', '333-333-3333', 'sonus@gmail.com', 2027),
  ('Priynka', 'Tripathi', '444-444-4444', 'priyanka@gmail.com', 2028),
  ('Amitabh', 'Bacchan', '666-666-6666', 'amitabh@gmail.com', 2029),
  ('Vineet', 'Yadav', '777-777-7777', 'vineet@gmail.com', 2030),
  ('Shilpa', 'Shetty', '888-888-8888', 'Shilpa@gmail.com', 2031),
  ('Kapil' ,'Sharma', '999-999-9999', 'kalil@gmail.com', 2032);
---------------------------------------------------------------------
-- SECOND LIST 

INSERT INTO DEMO_TEST.students (first_name, last_name, phone, email, grad_year)
VALUES
  ('Aditya', 'Singh', '9876543210', 'adityasingh@gmail.com', 2023),
  ('Shreya', 'Sharma', '9876543211', 'shreyasharma@gmail.com', 2024),
  ('Rohan', 'Kumar', '9876543212', 'rohankumar@gmail.com', 2025),
  ('Akanksha', 'Gupta', '9876543213', 'akankshagupta@gmail.com', 2026),
  ('Dhruv', 'Patel', '9876543214', 'dhruvpatel@gmail.com', 2027),
  ('Priyanka', 'Yadav', '9876543215', 'priyankayadav@gmail.com', 2028),
  ('Harsh', 'Verma', '9876543216', 'harshverma@gmail.com', 2029),
  ('Tanya', 'Mathur', '9876543217', 'tanyamathur@gmail.com', 2030),
  ('Sahil', 'Mishra', '9876543218', 'sahilmishra@gmail.com', 2031),
  ('Neha', 'Srivastava', '9876543219', 'nehasrivastava@gmail.com', 2032);
-----------------------------------------------------------------------------

-- STATEMENT 1 
UPDATE DEMO_TEST.STUDENTS
SET FIRST_NAME = 'Rahul' , LAST_NAME = 'Gandhi' , grad_year = 2023
WHERE STUDENT_ID = 5;
 
-- STATEMENT 2
UPDATE DEMO_TEST.STUDENTS
SET FIRST_NAME = 'Sonu' , LAST_NAME = 'Singh' , grad_year = 2023
WHERE STUDENT_ID = 4;

-------------------------------------------------------------------
--STATEMENT 1
DELETE
FROM DEMO_TEST.STUDENTS
WHERE STUDENT_ID IN (11,12,13,14,15);
																						
--STATEMENT 2
DELETE
FROM DEMO_TEST.STUDENTS
WHERE STUDENT_ID >10;
-------------------------------------------------------
--****************************************************************************
-- DQL DATA QUERY LANGUAGE: SELECT
--****************************************************************************
----------------------------------------------------------------------------------------------------------
-- Query 1: Count the total number of distinct last names in the students table.
SELECT COUNT(DISTINCT LAST_NAME) AS LAST_NAME_TOTAL
FROM DEMO_TEST.STUDENTS;
----------------------------------------------------------------------------------------------------------
-- Query 2: Retrieve distinct records for students with IDs less than 5, ordered by student ID in ascending order.

SELECT DISTINCT *
FROM DEMO_TEST.STUDENTS
WHERE STUDENT_ID < 5
ORDER BY STUDENT_ID ASC;

----------------------------------------------------------------------------------------------------------
-- Query 3: Retrieve the top 2 records from the students table, sorted by student ID in descending order, skipping the first row.

SELECT *
FROM DEMO_TEST.STUDENTS
ORDER BY STUDENT_ID DESC
LIMIT 2
OFFSET 1;

----------------------------------------------------------------------------------------------------------
-- Query 4: Retrieve the first 2 rows from the students table, sorted by student ID in descending order.

SELECT *
FROM DEMO_TEST.STUDENTS
ORDER BY STUDENT_ID DESC FETCH FIRST 2 ROW ONLY;
----------------------------------------------------------------------------------------------------------
-- Query 5: Count the total number of students for each graduation year and display the results in descending order.
SELECT GRAD_YEAR,
    COUNT(*) AS TOTAL_STUDENTS
FROM DEMO_TEST.STUDENTS
GROUP BY GRAD_YEAR
HAVING COUNT(*) > 2
ORDER BY TOTAL_STUDENTS DESC;
----------------------------------------------------------------------------------------------------------










-----------------------------------------------------------------------------














