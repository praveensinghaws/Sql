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
-- Creating EMP table
CREATE TABLE EMP (
  EMP_ID INT,
  EMP_NAME VARCHAR(50),
  SALARY DECIMAL(10, 2),
  MANAGER_ID INT,
  EMP_AGE INT,
  DEPT_ID INT
);

-- Drop the DEPT table if it exists
DROP TABLE IF EXISTS DEPT;

-- Creating DEPT table
CREATE TABLE DEPT (
  DEPT_ID INT,
  DEPT_NAME VARCHAR(50),
  LOCATION VARCHAR(50)
);

-- Inserting data into DEPT table
INSERT INTO DEPT (DEPT_ID, DEPT_NAME, LOCATION) VALUES
(1, 'HR', 'Mumbai'),
(2, 'Finance', 'Delhi'),
(3, 'IT', 'Bangalore'),
(4, 'Sales', 'Chennai'),
(5, 'Marketing', 'Hyderabad');

-- Inserting data into EMP table
INSERT INTO EMP (EMP_ID, EMP_NAME, SALARY, MANAGER_ID, EMP_AGE, DEPT_ID) VALUES
(101, 'Ravi Kumar', 55000.00, 201, 28, 1),
(102, 'Anita Singh', 62000.00, 202, 32, 2),
(103, 'Suresh Iyer', 75000.00, 203, 35, 3),
(104, 'Priya Sharma', 50000.00, 204, 26, 4),
(105, 'Amit Patel', 48000.00, 201, 30, 5),
(106, 'Neha Gupta', 68000.00, 202, 29, 1),
(107, 'Manoj Menon', 72000.00, 203, 33, 2),
(108, 'Kavita Joshi', 54000.00, 204, 27, 3),
(109, 'Arjun Mehta', 59000.00, 201, 31, 4),
(110, 'Sunita Nair', 61000.00, 202, 28, 5);
-- Select all records from the EMP table
SELECT * FROM EMP;

-- Select all records from the DEPT table
SELECT * FROM DEPT;

-- 1- Update basic syntax
-- Update all records in EMP, setting SALARY to 20000
-- UPDATE EMP SET SALARY = 20000;

-- 2- Update with where clause
-- Update EMP_AGE to 50 where EMP_ID is 105
UPDATE EMP SET EMP_AGE = 50 WHERE EMP_ID = 105;

-- 3- Update multiple values in a statement
-- Update EMP_NAME to 'Praveen Singh' and SALARY to 100000 where EMP_ID is 110
UPDATE EMP SET EMP_NAME = 'Praveen Singh', SALARY = 100000 WHERE EMP_ID = 110;

-- 4- Update using Join
-- Add DEPT_NAME column to EMP table
ALTER TABLE EMP ADD DEPT_NAME VARCHAR(50);

-- Update DEPT_NAME in EMP using DEPT table
UPDATE e
SET e.DEPT_NAME = d.DEPT_NAME
FROM EMP e
INNER JOIN DEPT d ON e.DEPT_ID = d.DEPT_ID;

-- 5- Update using calculations
-- Increase salary by 5000 where emp_id is greater than 106
UPDATE EMP SET SALARY = SALARY + 5000 WHERE EMP_ID > 106;

-- Increase salary by 10% where emp_id is less than 106
UPDATE EMP SET SALARY = SALARY * 1.1 WHERE EMP_ID < 106;

-- Update salary based on DEPT_ID
UPDATE EMP SET SALARY = CASE WHEN DEPT_ID = 1 THEN SALARY * 1.1
                              WHEN DEPT_ID = 2 THEN SALARY * 1.2
                              ELSE SALARY END;

-- Add GENDER column to EMP table
ALTER TABLE EMP ADD GENDER VARCHAR(10);

-- Update GENDER based on DEPT_ID
UPDATE EMP SET GENDER = CASE WHEN DEPT_ID >3 THEN 'MALE' ELSE 'FEMALE' END;

-- 6- Interview question on Update
-- Swap GENDER values in EMP (MALE to FEMALE and vice versa)
UPDATE EMP SET GENDER = CASE WHEN GENDER = 'MALE' THEN 'FEMALE' ELSE 'MALE' END;

-- 7- Some tips and tricks on sql update
-- Select all columns from the 'EMP' table
-- Add a new column 'TEST' that swaps the values of the 'GENDER' column
-- Only include rows where 'DEPT_ID' is equal to 2
SELECT *, 
       CASE WHEN GENDER = 'MALE' THEN 'FEMALE' ELSE 'MALE' END AS TEST
FROM EMP
WHERE DEPT_ID = 2;