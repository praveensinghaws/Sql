-- VERTUAL COLUMN
-- Create a table named SALES1
-----------------------------------------------------------------------------
--METHOD 1:
-----------------------------------------------------------------------------
CREATE TABLE SALES1
(
    -- Define a column for sales date
    SALES_DATE DATE,
    
    -- Define a column for order ID
    ORDER_ID NUMBER,
    
    -- Define a column for total amount with a precision of 10 digits and 2 decimal places
    TOTAL_AMOUNT NUMBER(10,2),
    
    -- Create a virtual column for commission, derived as 1% of the total amount
    COMMISSION NUMBER GENERATED ALWAYS AS (TOTAL_AMOUNT * 0.01) VIRTUAL
);
-----------------------------------------------------------------------------
--METHOD 2 BEST WAY :
-----------------------------------------------------------------------------
-- Create a table named SALES1
CREATE TABLE SALES1
(
    -- Define a column for sales date
    SALES_DATE DATE,
    
    -- Define a column for order ID
    ORDER_ID NUMBER,
    
    -- Define a column for total amount with a precision of 10 digits and 2 decimal places
    TOTAL_AMOUNT NUMBER(10, 2),
    
    -- Create a virtual column for commission, derived as 1% of the total amount
    COMMISSION AS (TOTAL_AMOUNT * 0.01)
);

-----------------------------------------------------------------------------
-- Insert three records into the SALES1 table
INSERT INTO SALES1 (SALES_DATE, ORDER_ID, TOTAL_AMOUNT)
VALUES (TO_DATE('2023-08-01', 'YYYY-MM-DD'), 101, 500.50);

INSERT INTO SALES1 (SALES_DATE, ORDER_ID, TOTAL_AMOUNT)
VALUES (TO_DATE('2023-08-02', 'YYYY-MM-DD'), 102, 750.25);

INSERT INTO SALES1 (SALES_DATE, ORDER_ID, TOTAL_AMOUNT)
VALUES (TO_DATE('2023-08-03', 'YYYY-MM-DD'), 103, 1000.75);

-- Commit the changes to the database
COMMIT;

SELECT * FROM SALES1;
DROP TABLE SALES1;
-----------------------------------------------------------------------
-----------------------------------------------------------------------
CREATE TABLE Employee
(
    EmployeeID NUMBER,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50),
    Salary NUMBER,
    
    -- Creating a virtual column for the full name, derived from FirstName and LastName
    FullName VARCHAR2(101) GENERATED ALWAYS AS (FirstName || ' ' || LastName) VIRTUAL
);

-- Insert five records into the Employee table with Indian names
INSERT INTO Employee (EmployeeID, FirstName, LastName, Salary)
VALUES (1, 'Rahul', 'Kumar', 50000);

INSERT INTO Employee (EmployeeID, FirstName, LastName, Salary)
VALUES (2, 'Priya', 'Sharma', 60000);

INSERT INTO Employee (EmployeeID, FirstName, LastName, Salary)
VALUES (3, 'Amit', 'Verma', 55000);

INSERT INTO Employee (EmployeeID, FirstName, LastName, Salary)
VALUES (4, 'Anjali', 'Gupta', 65000);

INSERT INTO Employee (EmployeeID, FirstName, LastName, Salary)
VALUES (5, 'Sandeep', 'Singh', 70000);

-- Commit the changes to the database
COMMIT;

SELECT * FROM EMPLOYEE;

