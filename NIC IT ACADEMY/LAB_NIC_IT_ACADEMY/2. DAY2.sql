--************************************************
--DAY 2 DDL , DML , DRL , TCL , DCL
--************************************************
-- Insert the first row into the CUSTOMER_NEW table.
INSERT INTO CUSTOMER_NEW
(cust_id, cust_name, mobile_no, dob, city, email_id)
VALUES (100000, 'Arun', 9090909090, TO_DATE('08/04/2000', 'MM/DD/YYYY'), 'Chennai', 'arun@gmail.com');

-- Insert the second row into the CUSTOMER_NEW table.
INSERT INTO CUSTOMER_NEW
(cust_id, cust_name, mobile_no, dob, city, email_id)
VALUES (100001, 'Praveen', 8080808080, TO_DATE('08/11/1990', 'MM/DD/YYYY'), 'Lucknow', 'praveensingh.dsm@gmail.com');

-- Insert the third row into the CUSTOMER_NEW table.
INSERT INTO CUSTOMER_NEW
(cust_id, cust_name, dob, city, email_id)
VALUES (100002, 'Sonu', TO_DATE('08/11/1990', 'MM/DD/YYYY'), 'Sultanpur', 'sonu.dsm@gmail.com');

-- Update the mobile number for Sonu.
UPDATE CUSTOMER_NEW
SET mobile_no = 7070707070
WHERE cust_id = 100002;

-- Select all records from the CUSTOMER_NEW table.
SELECT * FROM CUSTOMER_NEW;

-- Commit the changes to the database.
COMMIT;

-- Rollback the changes (this will undo all uncommitted changes).
ROLLBACK;

-- Truncate the CUSTOMER_NEW table (remove all data, but keep the structure).
TRUNCATE TABLE CUSTOMER_NEW;

-- Add the "country" column to the "customer_new" table.
ALTER TABLE customer_new
ADD country VARCHAR2(50);

-- Update the "country" column to 'India' for all rows in the "customer_new" table.
UPDATE customer_new
SET country = 'India';

-- Drop the "city" column from the "customer_new" table.
ALTER TABLE customer_new
DROP COLUMN city;

-- Describe the structure of the CUSTOMER_NEW table.
DESC customer_new;

-- Insert a new row into the CUSTOMER_NEW table.
INSERT INTO customer_new
(cust_id, cust_name, mobile_no, dob, email_id, country)
VALUES (1000000, 'Dilip', 9090909090, TO_DATE('08/04/2000', 'MM/DD/YYYY'), 'arun@gmail.com', 'India');

/*
Error Message: ORA-01438: value larger than specified precision allowed for this column
This error occurs because the value provided for the 'cust_id' column (1000000) exceeds the specified precision for this column.
*/

-- Modify the data type and precision of the "cust_id" column in the "customer_new" table.
ALTER TABLE customer_new
MODIFY cust_id NUMBER(8);

/* 
IT CAN BE INCREASED BUT IT CAN NOT BE DESCRISED
Error report -
ORA-01440: column to be modified must be empty to decrease precision or scale

*/

ALTER TABLE customer_new
MODIFY MOBILE_NO VARCHAR(15);

/*
STEPS: 
1.BKP A TABLE
2. TRUNCATE BASE TABLE
3. MODIFY DATATYPE
4. RESTORE THE DATA
5. DROP BKP TABLE
ORA-01439: column to be modified must be empty to change datatype
*/

-- Create a backup table "customer_new_BKP" by copying all data from "CUSTOMER_NEW".
CREATE TABLE customer_new_BKP AS
SELECT * FROM CUSTOMER_NEW;

-- Create an empty backup table "customer_new_BKP" with the same structure as "CUSTOMER_NEW."
CREATE TABLE customer_new_BKP AS
SELECT * FROM CUSTOMER_NEW WHERE 1 = 2;

-- Truncate all data from the "CUSTOMER_NEW" table.
TRUNCATE TABLE CUSTOMER_NEW;

-- Select all data from the "customer_new_BKP" table (the backup).
SELECT * FROM customer_new_BKP;

-- Modify the "cust_id" column in the "CUSTOMER_NEW" table to have a precision of 8.
ALTER TABLE CUSTOMER_NEW
MODIFY cust_id NUMBER(8);

-- Describe the structure of the "CUSTOMER_NEW" table.
DESC CUSTOMER_NEW;

-- Insert data from the "customer_new_BKP" table into the "CUSTOMER_NEW" table.
INSERT INTO CUSTOMER_NEW
(SELECT * FROM customer_new_BKP);
 
-- Select all data from the "customer_new_BKP" table (the backup).
SELECT * FROM customer_new_BKP;

-- Delete all data from the "customer_new_BKP" table.
DELETE FROM customer_new_BKP;

-- Rollback the changes made in the current transaction.
ROLLBACK;

-- Delete rows from the "customer_new_BKP" table where "cust_name" is 'Dilip'.
DELETE FROM customer_new_BKP WHERE cust_name = 'Dilip';

-- Commit the changes made in the current transaction.
COMMIT;

-- Drop the "customer_new_BKP" table to remove it completely.
DROP TABLE customer_new_BKP;
--------------------------------------------------------------------------
-- Rename the "dob" column to "DATE_OF_BIRTH" in the "customer_new" table.
ALTER TABLE customer_new
RENAME COLUMN dob TO DATE_OF_BIRTH;

-- Rename the "MOBILE_NO" column to "MOBILE_NUMBER" in the "customer_new" table.
ALTER TABLE customer_new
RENAME COLUMN MOBILE_NO TO MOBILE_NUMBER;

-- Rename the "customerS" table to "CUSTOMER_NEW."
RENAME customerS TO CUSTOMER_NEW;
--------------------------------------------------------------------------
-- Create a table named "TEST" with two columns: TEST1 and TEST2.
CREATE TABLE TEST
(
    TEST1 NUMBER(3),
    TEST2 NUMBER(3)
);

-- Insert data into the "TEST" table.
INSERT INTO TEST VALUES (1, 2);

-- Create a savepoint named "A."
SAVEPOINT A;

-- Insert more data into the "TEST" table.
INSERT INTO TEST VALUES (3, 4);

-- Create a savepoint named "B."
SAVEPOINT B;

-- Insert additional data into the "TEST" table.
INSERT INTO TEST VALUES (5, 6);

-- Create a savepoint named "C."
SAVEPOINT C;

-- Insert more data into the "TEST" table.
INSERT INTO TEST VALUES (7, 8);

-- Create a savepoint named "D."
SAVEPOINT D;

-- Select all data from the "TEST" table.
SELECT * FROM TEST;

-- Roll back to the "B" savepoint, undoing changes made after "B."
ROLLBACK TO B;

-----------------------------------------------------------------------











