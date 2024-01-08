-- Create a table named CUSTOMER1
CREATE TABLE CUSTOMER1
(
    -- Define a column for customer ID, which stores numeric values
    CUSTOMER_ID NUMBER,

    -- Define a column for customer name, which stores text up to 20 characters
    CUSTOMER_NAME VARCHAR2(20),

    -- Define a column for expiry date, which stores date values and has a default value of '31-DEC-2099'
    -- The date format is 'DD-MON-YYYY'
    EXPIRY_DATE DATE DEFAULT TO_DATE('31-DEC-2099', 'DD-MON-YYYY')
);
-------------------------------------------------------------------------
-- Insert a new record into the CUSTOMER1 table
INSERT INTO CUSTOMER1 (CUSTOMER_ID, CUSTOMER_NAME)
VALUES (1, 'AKHILESH YADAV');

-- Insert a new record into the CUSTOMER1 table with the default EXPIRY_DATE
INSERT INTO CUSTOMER1 (CUSTOMER_ID, CUSTOMER_NAME)
VALUES (2, 'RAHUL GANDHI');

-- Insert a new record into the CUSTOMER1 table with a specified EXPIRY_DATE
INSERT INTO CUSTOMER1 (CUSTOMER_ID, CUSTOMER_NAME, EXPIRY_DATE)
VALUES (3, 'PRAVEEN SINGH', TO_DATE('11-AUG-1990', 'DD-MON-YYYY'));

-- Commit the changes to the database
COMMIT;

SELECT * FROM CUSTOMER1;












