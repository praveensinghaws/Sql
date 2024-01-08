--************************************************
--DAY 1  INTRODUCTION TO SQL RDBMS , ORACLE DB , SCHEMA
--************************************************
--Creating a new customer table and performing some basic operations.
-- Creating the CUSTOMER_NEW table.
-- Check if the table CUSTOMER_NEW exists and drop it if it does.
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE CUSTOMER_NEW';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;

-- Create the CUSTOMER_NEW table.
CREATE TABLE CUSTOMER_NEW
(
    cust_id NUMBER(8),
    cust_name VARCHAR2(100),
    mobile_no NUMBER(10),
    dob DATE,
    city VARCHAR2(100),
    email_id VARCHAR2(100)
);

-- Displaying all records from the CUSTOMER_NEW table.
SELECT * FROM CUSTOMER_NEW;

-- Describing the structure of the CUSTOMER_NEW table.
DESC CUSTOMER_NEW;
