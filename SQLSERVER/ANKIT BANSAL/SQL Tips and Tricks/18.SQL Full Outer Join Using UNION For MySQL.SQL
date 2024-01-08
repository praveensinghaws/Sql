USE DEMODB;
SELECT * FROM INFORMATION_SCHEMA.TABLES;

-- Create the CUSTOMERS table
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID INT NOT NULL,
    CUSTOMER_NAME VARCHAR(50) NOT NULL,
    GENDER CHAR(1) NOT NULL,
    DOB DATE NOT NULL,
    AGE INT NOT NULL,
    PRIMARY KEY (CUSTOMER_ID)
);

-- Insert data into the CUSTOMERS table
INSERT INTO CUSTOMERS (CUSTOMER_ID, CUSTOMER_NAME, GENDER, DOB, AGE) VALUES
    (1, 'RAHUL', 'M', '2000-01-05', 22),
    (2, 'SHILPA', 'F', '2004-04-05', 18),
    (3, 'RAMESH', 'M', '2003-05-07', 19),
    (4, 'KATRINA', 'F', '2005-02-05', 17),
    (5, 'ALIA', 'F', '1992-01-02', 30);

-- Create the CUSTOMER_ORDERS table
CREATE TABLE CUSTOMER_ORDERS (
    ORDER_ID INT NOT NULL,
    CUSTOMER_ID INT NOT NULL,
    ORDER_DATE DATE NOT NULL,
    SHIP_DATE DATE NOT NULL,
    PRIMARY KEY (ORDER_ID),
);

-- Insert data into the CUSTOMER_ORDERS table
INSERT INTO CUSTOMER_ORDERS (ORDER_ID, CUSTOMER_ID, ORDER_DATE, SHIP_DATE) VALUES
    (1000, 1, '2022-01-05', '2022-01-11'),
    (1001, 2, '2022-02-04', '2022-02-16'),
    (1002, 3, '2022-01-01', '2022-01-19'),
    (1003, 4, '2022-01-06', '2022-01-30'),
    (1004, 6, '2022-02-07', '2022-02-13');


-- Retrieve customer and order information using a FULL OUTER JOIN
SELECT 
    C.CUSTOMER_ID AS C_CUSTOMER_ID, 
    C.CUSTOMER_NAME, 
    CO.CUSTOMER_ID AS CO_CUSTOMER_ID, 
    CO.ORDER_ID
FROM 
    CUSTOMERS C
FULL OUTER JOIN 
    CUSTOMER_ORDERS CO ON C.CUSTOMER_ID = CO.CUSTOMER_ID;

-- Retrieve customer and order information using a LEFT JOIN with UNION ALL for unmatched records
SELECT 
    C.CUSTOMER_ID AS C_CUSTOMER_ID, 
    C.CUSTOMER_NAME, 
    CO.CUSTOMER_ID AS CO_CUSTOMER_ID, 
    CO.ORDER_ID
FROM 
    CUSTOMERS C
LEFT JOIN 
    CUSTOMER_ORDERS CO ON C.CUSTOMER_ID = CO.CUSTOMER_ID
UNION ALL
SELECT 
    C.CUSTOMER_ID AS C_CUSTOMER_ID, 
    C.CUSTOMER_NAME, 
    CO.CUSTOMER_ID AS CO_CUSTOMER_ID, 
    CO.ORDER_ID
FROM 
    CUSTOMER_ORDERS CO
LEFT JOIN 
    CUSTOMERS C ON C.CUSTOMER_ID = CO.CUSTOMER_ID
WHERE 
    C.CUSTOMER_ID IS NULL;

/*
In these SQL queries:

1. The first query uses a `FULL OUTER JOIN` to retrieve customer and order information, ensuring that all records from both tables are included,
 matching where possible.

2. The second query uses a combination of `LEFT JOIN` and `UNION ALL` to achieve the same result, with an additional filter for unmatched records
 from the second table. It ensures that all customers and orders are included, even if they do not have a corresponding match in the other table.

*/
