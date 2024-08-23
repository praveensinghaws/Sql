-- Switch to the DEMODB database
USE DEMODB;
-- Select all information about tables in the current database
SELECT *
FROM INFORMATION_SCHEMA.TABLES;
/*
1- Update basic syntax
2- Update with where clause
3- Update multiple values in a statement 
4- Update using Join
5- Update using calculations
6- Interview question on Update
7- Some tips and tricks on sql update
*/
-- Drop the EMP table if it exists
DROP TABLE IF EXISTS EMP;

-- Create the EMP table with specified columns
CREATE TABLE EMP (
  EMP_ID INT,
  EMP_NAME VARCHAR(50),
  SALARY DECIMAL(10, 2),
  MANAGER_ID INT,
  EMP_AGE INT,
  DEPT_ID INT
);

-- Insert 11 sample records into the EMP table
INSERT INTO EMP VALUES
-- Sample Records
-- ...

-- Create the DEPT table with specified columns
CREATE TABLE DEPT (
  DEPT_ID INT,
  DEPT_NAME VARCHAR(50),
  LOCATION VARCHAR(50)
);

-- Insert some sample records into the DEPT table
INSERT INTO DEPT VALUES
-- Sample Records
-- ...

-- Select all records from the EMP table
SELECT * FROM EMP;

-- Select all records from the DEPT table
SELECT * FROM DEPT;

-- 1- Update basic syntax
-- Update all records in EMP, setting SALARY to 20000
UPDATE EMP SET SALARY = 20000;

-- 2- Update with where clause
-- Update EMP_AGE to 50 where EMP_ID is 5
UPDATE EMP SET EMP_AGE = 50 WHERE EMP_ID = 5;

-- 3- Update multiple values in a statement
-- Update EMP_NAME to 'Praveen Singh' and SALARY to 100000 where EMP_ID is 10
UPDATE EMP SET EMP_NAME = 'Praveen Singh', SALARY = 100000 WHERE EMP_ID = 10;

-- 4- Update using Join
-- Add DEPT_NAME column to EMP table
ALTER TABLE EMP ADD DEPT_NAME VARCHAR(50);

-- Update DEPT_NAME in EMP using DEPT table
UPDATE e
SET e.DEPT_NAME = d.DEPT_NAME
FROM EMP e
INNER JOIN DEPT d ON e.DEPT_ID = d.DEPT_ID;

-- 5- Update using calculations
-- Increase salary by 5000 where emp_id is greater than 6
UPDATE EMP SET SALARY = SALARY + 5000 WHERE EMP_ID > 6;

-- Increase salary by 10% where emp_id is less than 6
UPDATE EMP SET SALARY = SALARY * 1.1 WHERE EMP_ID < 6;

-- Update salary based on DEPT_ID
UPDATE EMP SET SALARY = CASE WHEN DEPT_ID = 100 THEN SALARY * 1.1
                              WHEN DEPT_ID = 200 THEN SALARY * 1.2
                              ELSE SALARY END;

-- Add GENDER column to EMP table
ALTER TABLE EMP ADD GENDER VARCHAR(10);

-- Update GENDER based on DEPT_ID
UPDATE EMP SET GENDER = CASE WHEN DEPT_ID = 100 THEN 'MALE' ELSE 'FEMALE' END;

-- 6- Interview question on Update
-- Swap GENDER values in EMP (MALE to FEMALE and vice versa)
UPDATE EMP SET GENDER = CASE WHEN GENDER = 'MALE' THEN 'FEMALE' ELSE 'MALE' END;

-- 7- Some tips and tricks on sql update
-- Select all columns from the 'EMP' table
-- Add a new column 'TEST' that swaps the values of the 'GENDER' column
-- Only include rows where 'DEPT_ID' is equal to 200
SELECT *, 
       CASE WHEN GENDER = 'MALE' THEN 'FEMALE' ELSE 'MALE' END AS TEST
FROM EMP
WHERE DEPT_ID = 200;
