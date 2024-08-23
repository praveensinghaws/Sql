USE DEMO;
-- Creating a table named EMPLOYEE
CREATE TABLE EMPLOYEE (
    empid INT,                -- Employee ID, an integer
    empname CHAR(50),         -- Employee name, a character string with a maximum length of 50 characters
    salary DECIMAL(10,2)      -- Salary, a decimal number with a precision of 10 and a scale of 2
);

-- Executing stored procedure to retrieve information about the columns in the EMPLOYEE table
EXEC sp_columns 'EMPLOYEE';

-- Executing stored procedure to get detailed information about the EMPLOYEE table
EXEC sp_help 'EMPLOYEE';

-- Altering the data type of the 'empname' column to VARCHAR(50)
ALTER TABLE EMPLOYEE 
ALTER COLUMN empname VARCHAR(50);


-- Inserting data into the EMPLOYEE table
INSERT INTO EMPLOYEE VALUES
(101, 'PRAVEEN KUMAR SINGH', 50000),
(102, 'RAHUL GANDI', 70000);

-- Retrieving all records from the EMPLOYEE table
SELECT * FROM EMPLOYEE;

-- Altering the data type of the 'empname' column to VARCHAR(20)
-- Note: This might result in truncation of data, as 'empname' values may exceed the new length
ALTER TABLE EMPLOYEE 
ALTER COLUMN empname VARCHAR(20);


-- Adding a primary key constraint to the 'empid' column in the 'EMPLOYEE' table
-- Note: Ensure that 'empid' values are unique and not NULL before adding the constraint
ALTER TABLE EMPLOYEE
ADD CONSTRAINT PK_EMPLOYEE_empid PRIMARY KEY (empid);

-- Modifying the 'empid' column to disallow NULL values
-- Note: Ensure that existing 'empid' values are not NULL before making this change
ALTER TABLE EMPLOYEE
ALTER COLUMN empid INT NOT NULL;


-- Modifying the 'empname' column in the 'EMPLOYEE' table
-- Changing the data type to CHAR(40) and disallowing NULL values
ALTER TABLE EMPLOYEE
ALTER COLUMN empname CHAR(40) NOT NULL;
