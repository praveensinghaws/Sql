/* *********************************************
 DAY 3 CONSTRAINT IN ORACLE [Primary Key,Constraint,Foreign Key,Unique,Check,
 Not Null,Default,Check Constraint Using Function]
-- *********************************************
EXAMPLES:
*/
CREATE TABLE CUSTOMER
(
    CUST_ID NUMBER(6) PRIMARY KEY,         -- Customer ID, a unique identifier for each customer
    CUST_NAME VARCHAR2(30) NOT NULL,      -- Customer name, should not be null
    MOBILE_NO NUMBER(10) UNIQUE,          -- Mobile number, must be unique
    AGE NUMBER(3) CHECK (AGE > 18),       -- Age of the customer, must be greater than 18
    CITY_ID NUMBER(4) REFERENCES CITY(CITY_ID) -- City ID, foreign key referencing the CITY table
);
--ERROR1: ORA-00942: table or view does not exist
--ERROR2: ORA-02270: no matching unique or primary key for this column-list

CREATE TABLE CITY
(
CITY_ID NUMBER(4),
CITY_NAME VARCHAR2(30)
);

insert into city values (10,'Chennai');
insert into city values (20,'Pune');
insert into city values (30,'Hyd');
insert into city values (40,'Delhi');
COMMIT;

-- Add a primary key constraint to the CITY table on the CITY_ID column
ALTER TABLE CITY
ADD PRIMARY KEY (CITY_ID);

-- Insert records into the CUSTOMER table
INSERT INTO CUSTOMER VALUES (100000, 'Arun', 9090909090, 28, 20);
INSERT INTO CUSTOMER VALUES (100001, 'Arun', 8080808080, 31, 30);
INSERT INTO CUSTOMER VALUES (100002, 'Vijay', 5050505050, 31, 10);
INSERT INTO CUSTOMER VALUES (100003, 'Ajith', 2894738243, 20, 30);-- [AGE IS NOT >18]ORA-02290: check constraint (PRAVEEN.SYS_C008379) violated
INSERT INTO CUSTOMER VALUES (100004, 'Ramesh', 2894738789, 31, 30);--[CITY CODE 60 NOT PRESENT IN CITY TABLE ]ORA-02291: integrity constraint (PRAVEEN.SYS_C008382) violated - parent key not found

-- Retrieve information about constraints on the CUSTOMER table (owned by 'PRAVEEN')
SELECT * FROM all_constraints WHERE OWNER = 'PRAVEEN' AND TABLE_NAME = 'CUSTOMER';

-- Retrieve information about columns in constraints on the CUSTOMER table (owned by 'PRAVEEN')
SELECT * FROM all_cons_columns WHERE OWNER = 'PRAVEEN' AND TABLE_NAME = 'CUSTOMER';

-- Retrieve information about constraints and related columns on the CUSTOMER table (owned by 'PRAVEEN')
SELECT
    a.owner,
    a.constraint_name,
    a.constraint_type,
    b.table_name,
    b.column_name
FROM all_constraints a, all_cons_columns b
WHERE a.constraint_name = b.constraint_name
AND a.owner = 'PRAVEEN'
AND a.table_name = 'CUSTOMER';

-- Delete a specific customer with CUST_ID 100003
DELETE FROM CUSTOMER WHERE CUST_ID = 100003;

-- Attempt to delete a city with CITY_ID 30
-- Comment explaining that you can't delete from the primary table if child records exist
-- This action results in an ORA-02292 integrity constraint violation
DELETE FROM CITY WHERE CITY_ID = 30; 
-- The error message indicates that the constraint SYS_C008382 prevents the deletion of a city with child records.

-- Delete all customers associated with CITY_ID 30 before deleting the city itself
DELETE FROM CUSTOMER WHERE CITY_ID = 30;

-- Finally, delete the city with CITY_ID 30, now that there are no associated customer records
DELETE FROM CITY WHERE CITY_ID = 30;

--***************************
-- Enable ON DELETE CASCADE
--***************************

-- Check existing constraints for the CUSTOMER table
SELECT * FROM all_constraints WHERE owner = 'PRAVEEN' AND table_name = 'CUSTOMER';

-- Drop the existing constraint (SYS_C008382)
ALTER TABLE CUSTOMER DROP CONSTRAINT SYS_C008382;

-- Add a new constraint (city_fk) with ON DELETE CASCADE
ALTER TABLE CUSTOMER
ADD CONSTRAINT city_fk
FOREIGN KEY (city_id)
REFERENCES city(city_id)
ON DELETE CASCADE;

-- Attempt to delete a city (CITY_ID 30)
-- Child records in CUSTOMER table should be deleted automatically due to ON DELETE CASCADE
DELETE FROM CITY WHERE CITY_ID = 30;

-- Check for all tables owned by 'HR'
SELECT * FROM ALL_TABLES WHERE OWNER = 'HR';

-- Retrieve metadata about the 'SALARY' column in tables owned by the 'HR' schema
SELECT *
FROM ALL_TAB_COLUMNS
WHERE OWNER = 'HR'   -- Filter tables owned by the 'HR' schema
AND COLUMN_NAME = 'SALARY';  -- Filter columns with the name 'SALARY'

--***************************
-- DROP TABLES 
--***************************

-- Drop the CUSTOMER table
DROP TABLE CUSTOMER;

-- Drop the CITY table
DROP TABLE CITY;

--*********************************
-- CREATE TABLE CITY WITH COMPOSITE KEY  
--*********************************

-- Create the CITY table with CITY_ID and CITY_NAME columns
CREATE TABLE CITY
(
    CITY_ID NUMBER(4),
    CITY_NAME VARCHAR2(30)
);

-- Insert data into the CITY table
INSERT INTO CITY VALUES (10, 'Chennai');
INSERT INTO CITY VALUES (20, 'Pune');
INSERT INTO CITY VALUES (30, 'Hyderabad');
INSERT INTO CITY VALUES (40, 'Delhi');

-- Add a primary key constraint on CITY_ID
ALTER TABLE CITY ADD PRIMARY KEY (CITY_ID);

-- Commit the transaction
COMMIT;

-- Create the CUSTOMER table with a composite primary key
CREATE TABLE CUSTOMER
(
    CUST_ID NUMBER(6),
    CUST_NAME VARCHAR2(30) NOT NULL,
    MOBILE_NO NUMBER(10),
    AGE NUMBER(3) CHECK (AGE >= 18),
    CITY_ID NUMBER(4) REFERENCES CITY(CITY_ID),
    PRIMARY KEY (CUST_ID, MOBILE_NO)
);

-- Insert data into the CUSTOMER table
INSERT INTO CUSTOMER VALUES (100000, 'Arun', 9090909090, 28, 20);
INSERT INTO CUSTOMER VALUES (100000, 'Arun', 9090909091, 28, 20);
INSERT INTO CUSTOMER VALUES (100001, 'Arun', 9090909090, 28, 20);

-- Create the COUNTRY table with a primary key
CREATE TABLE COUNTRY
(
    CUST_COUNTRY_CODE VARCHAR2(2) PRIMARY KEY,
    COUNTRY_NAME VARCHAR2(30)
);

-- Insert data into the COUNTRY table
INSERT INTO COUNTRY VALUES ('IN', 'India');
-- The following insert would violate a unique constraint, and it is commented to prevent the error
-- INSERT INTO COUNTRY VALUES ('IN', 'USA');

-- Drop the COUNTRY table
DROP TABLE COUNTRY;

-- Attempt to select data from the COUNTRY table (it should not exist after dropping)
SELECT * FROM COUNTRY;


ROLLBACK;
COMMIT;
-- Retrieve all records from the CUSTOMER table
SELECT * FROM CUSTOMER;

-- Retrieve all records from the CITY table
SELECT * FROM CITY;

/* *********************************************
USING CHAT GPT:
 DAY 3 CONSTRAINT IN ORACLE [Primary Key,Constraint,Foreign Key,Unique,Check,
 Not Null,Default,Check Constraint Using Function]
-- *********************************************

1. Primary Key Constraint: Ensures that each row in a table has a unique identifier.
It ensures that the specified column or columns contain only unique values and 
cannot have NULL values
*/
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50)
);
/*
2. Foreign Key Constraint: Enforces referential integrity by ensuring that values in a column (or a set of columns) match values in another table's primary key. It creates a relationship between two tables.

Example:
*/
CREATE TABLE NewOrders (
    OrderID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);



/*
3. Unique Constraint: Ensures that the values in a column (or a set of columns) are unique across all rows in a table but allows NULL values.

Example:
*/
CREATE TABLE Products (
    ProductID NUMBER PRIMARY KEY,
    ProductName VARCHAR2(100),
    SKU VARCHAR2(50) UNIQUE
);


/*
4. Check Constraint: Specifies a condition that must be satisfied for the data in a column. It restricts the range of valid values for a column.

Example:
*/
CREATE TABLE Students (
    StudentID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50),
    Age NUMBER CHECK (Age >= 18)
);


/*
5. Not Null Constraint: Ensures that a column cannot have NULL values.

Example:
*/
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50) NOT NULL,
    LastName VARCHAR2(50) NOT NULL
);


/*
6. Default Constraint: Provides a default value for a column if no value is explicitly specified during an INSERT operation.

Example:
*/
CREATE TABLE Orders (
    OrderID NUMBER PRIMARY KEY,
    OrderDate DATE DEFAULT SYSDATE,
    TotalAmount NUMBER(10, 2)
);


/*
7. Check Constraint Using Function: Allows you to use a function to define more complex conditions for data validation.

Example:
*/
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    Salary NUMBER CHECK (Salary >= 30000 AND Salary <= 100000)
);

