/*
"Window Functions in MySQL : ROW_NUMBER()'

* Assigng unique sequential numbertp rows witin atesutset (within a specific partion)
* In case there is a tie among rows, it ignores the same and assigns the different row numbers to each row
* Important Use Case : Removing Duplicates
*/

-- ********************************* Basic Scenario *****************************************
SELECT * FROM
(
    SELECT *, 
        ROW_NUMBER() OVER(ORDER BY salary DESC) AS rn 
    FROM employee
) max_salary
WHERE rn = 1;

-- ********************************* Advanced Scenario *****************************************

-- Create customer table
CREATE TABLE customer (
    ID INT,
    Customer_Name VARCHAR(255),
    Customer_Age INT,
    Customer_Location VARCHAR(255),
    Customer_PhoneNumber VARCHAR(15)
);

-- Insert records into the customer table
INSERT INTO customer (ID, Customer_Name, Customer_Age, Customer_Location, Customer_PhoneNumber)
VALUES
(1, 'Simon', 23, 'San Francisco', '1111-1111-1111'),
(2, 'Simon', 23, 'San Francisco', '1111-1111-1111'),
(3, 'Matt', 34, 'New York', '2222 2222 2222'),
(4, 'Ken', 27, 'Denver', '1111-1111-3333'),
(5, 'Tom', 45, 'Chicago', '9999-9999-9999'),
(6, 'Tom', 45, 'Chicago', '9999-9999-9999');

-- ============================================================
DELETE FROM customer
WHERE id IN (
    SELECT dum_table.ID
    FROM (
        SELECT *,
            ROW_NUMBER() OVER(PARTITION BY Customer_Name, Customer_Age, Customer_Location, Customer_PhoneNumber ORDER BY ID) AS row_num
        FROM customer
    ) dum_table
    WHERE row_num > 1
);



