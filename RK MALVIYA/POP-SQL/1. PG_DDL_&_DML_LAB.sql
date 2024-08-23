-- Retrieve the names of all databases
SELECT datname FROM pg_database;

-- Retrieve detailed information about databases
SELECT datname, datdba, encoding, datcollate, datctype, datistemplate, datallowconn
FROM pg_database;

-- Retrieve the names of all tables in the 'public' schema
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

-- Retrieve information about columns in the 'emp' table in the 'demo_test' schema
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'emp' AND table_schema = 'demo_test';

-- Determine the current database
SELECT current_database();

-- Retrieve all tables in the 'demo_test' schema
SELECT *
FROM information_schema.tables
WHERE table_schema = 'demo_test';


-- Drop the 'demo_test' schema and its objects
DROP SCHEMA demo_test CASCADE;

-- Retrieve a list of all schemas in the current database
SELECT schema_name
FROM information_schema.schemata;

-- Create a database named DEMODB
CREATE DATABASE DEMODB;

-- Drop the DEMODB database
DROP DATABASE IF EXISTS DEMODB;

-- Create a schema named DEMO_TEST
CREATE SCHEMA DEMO_TEST;

-- Drop the EMPLOYEE table if it exists in the DEMO_TEST schema
DROP TABLE IF EXISTS DEMO_TEST.EMPLOYEE;

-- Create the EMPLOYEE table in the DEMO_TEST schema
CREATE TABLE DEMO_TEST.EMPLOYEE 
(
    EMPID INT PRIMARY KEY,
    EMPNAME VARCHAR(20)
);


-- This query selects all columns from the INFORMATION_SCHEMA.TABLES view
-- for tables in the 'demo_test' schema.
SELECT * 
FROM information_schema.tables 
WHERE table_schema = 'demo_test';


-- This query inserts records into the DEMO_TEST.EMPLOYEE table.
INSERT INTO DEMO_TEST.EMPLOYEE (EMPID, EMPNAME)
VALUES 
  (101, 'PRAVEEN SINGH'),
  (102, 'RAHUL GANDHI'),
  (103, 'PRINKA CHATURVEDI');

-- This query retrieves all records from the DEMO_TEST.EMPLOYEE table.
SELECT * FROM DEMO_TEST.EMPLOYEE;


-- This query truncates (removes all rows from) the DEMO_TEST.EMPLOYEE table.
TRUNCATE TABLE DEMO_TEST.EMPLOYEE;

-- This query drops (deletes) the DEMO_TEST.EMPLOYEE table.
DROP TABLE DEMO_TEST.EMPLOYEE;


-- This query modifies the data type of the EMPNAME column in the DEMO_TEST.EMPLOYEE table to VARCHAR(100).
ALTER TABLE DEMO_TEST.EMPLOYEE
ALTER COLUMN EMPNAME TYPE VARCHAR(100);

-- This query renames the DEMO_TEST.EMPLOYEE table to EMP.
ALTER TABLE DEMO_TEST.EMPLOYEE
RENAME TO EMP;

-- This query retrieves all records from the DEMO_TEST.EMP table.
SELECT * FROM DEMO_TEST.EMP;

-- =============
-- DDL- CREATE |
-- =============

CREATE TABLE DEMO_TEST.STUDENTS
(
    STUDENTID SERIAL PRIMARY KEY,
    FIRSTNAME VARCHAR(50) NOT NULL,
    LASTNAME VARCHAR(50) NOT NULL,
    HOUSENUMBER INTEGER,
    PHONE VARCHAR(20) NOT NULL UNIQUE,
    EMAIL VARCHAR(50) UNIQUE,
    GRADYEAR INTEGER
);


-- =============
-- DML- CREATE |
-- =============
INSERT INTO DEMO_TEST.STUDENTS (FIRSTNAME, LASTNAME, HOUSENUMBER, PHONE, EMAIL, GRADYEAR)
VALUES 
  ('Amit', 'Kumar', 123, '9876543210', 'amit.kumar@example.com', 2024),
  ('Priya', 'Sharma', 456, '8765432109', 'priya.sharma@example.com', 2023),
  ('Rahul', 'Singh', 789, '7654321098', 'rahul.singh@example.com', 2022),
  ('Sneha', 'Verma', 101, '6543210987', 'sneha.verma@example.com', 2023),
  ('Neha', 'Gupta', 234, '5432109876', 'neha.gupta@example.com', 2024),
  ('Vikram', 'Yadav', 567, '4321098765', 'vikram.yadav@example.com', 2022),
  ('Pooja', 'Mishra', 890, '3210987654', 'pooja.mishra@example.com', 2023),
  ('Suresh', 'Kumar', 112, '2109876543', 'suresh.kumar@example.com', 2024),
  ('Anita', 'Raj', 345, '1098765432', 'anita.raj@example.com', 2022),
  ('Rajesh', 'Sharma', 678, '0987654321', 'rajesh.sharma@example.com', 2023);


  INSERT INTO DEMO_TEST.STUDENTS (FIRSTNAME, LASTNAME, HOUSENUMBER, PHONE, EMAIL, GRADYEAR)
VALUES 
  ('Praveen', 'Singh', 143, '9454321987', 'praveen.singh@example.com', 2024);

-- =============
-- DML- UPDATE |
-- =============
UPDATE DEMO_TEST.STUDENTS SET
    LASTNAME = 'GANDHI'
WHERE STUDENTID =3;

UPDATE DEMO_TEST.STUDENTS SET
  STUDENTID = 8 WHERE STUDENTID = 11;
-- =============
-- DML- DELETE |
-- =============
-- Delete the student with STUDENTID 8 and GRADYEAR 2024
DELETE FROM DEMO_TEST.STUDENTS
WHERE GRADYEAR = 2024 AND STUDENTID = 8;

DELETE FROM DEMO_TEST.STUDENTS
WHERE STUDENTID >5;
-- =============
-- DQL- SELECT |
-- =============
-- Select all students from the DEMO_TEST.STUDENTS table and order them by STUDENTID
SELECT * FROM DEMO_TEST.STUDENTS
ORDER BY STUDENTID;




-- TRUNCATE TABLE DEMO_TEST.STUDENTS;
SELECT  * FROM  MOVIES;









-- =============
-- DDL- ALTER  |
-- =============
-- DONE 