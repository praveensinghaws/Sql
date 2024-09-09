CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(15),
    email_id VARCHAR(15)
);

INSERT INTO employees (employee_id, employee_name, email_id) VALUES ('101', 'Liam Alton', 'li.al@abc.com');
INSERT INTO employees (employee_id, employee_name, email_id) VALUES ('102', 'Josh Day', 'jo.da@abc.com');
INSERT INTO employees (employee_id, employee_name, email_id) VALUES ('103', 'Sean Mann', 'se.ma@abc.com');
INSERT INTO employees (employee_id, employee_name, email_id) VALUES ('104', 'Evan Blake', 'ev.bl@abc.com');
INSERT INTO employees (employee_id, employee_name, email_id) VALUES ('105', 'Toby Scott', 'jo.da@abc.com');
INSERT INTO employees (employee_id, employee_name, email_id) VALUES ('106', 'Anjali Chouhan', 'JO.DA@ABC.COM');
INSERT INTO employees (employee_id, employee_name, email_id) VALUES ('107', 'Ankit Bansal', 'AN.BA@ABC.COM');



-- The CTE (Common Table Expression) named 'cte' is used to identify and rank rows 
-- within the 'employees' table based on the ASCII value of 'email_id' for handling case-sensitive email addresses.

WITH cte AS (
    -- Select all columns from the 'employees' table and calculate:
    -- 1. 'ascii_email': The ASCII value of the first character of 'email_id'.
    --    This helps in understanding the case sensitivity, as ASCII values differ 
    --    between uppercase and lowercase letters (e.g., 'A' is 65, 'a' is 97).
    -- 2. 'rn': A rank assigned to each row based on the 'email_id' within its group.
    --    The RANK() function is used with PARTITION BY 'email_id' to handle duplicates.
    --    Rows are ordered by the ASCII value of 'email_id' in descending order, so
    --    uppercase emails will be ranked separately from lowercase ones due to their ASCII values.
    SELECT *, 
           ASCII(email_id) AS ascii_email,  -- Calculate ASCII value of 'email_id'.
           RANK() OVER(PARTITION BY email_id ORDER BY ASCII(email_id) DESC) AS rn  -- Rank rows based on ASCII values.
    FROM employees
)

-- Select rows from the CTE where the rank is 1.
-- This effectively filters out duplicate emails, keeping only one row per unique 'email_id'
-- based on the highest ASCII value, ensuring that case-sensitive duplicates are handled properly.
SELECT * FROM cte
WHERE rn = 1;


-- This statement modifies the 'employees' table to change the collation of the 'email_id' column to case-sensitive.
ALTER TABLE employees
ALTER COLUMN email_id VARCHAR(15) COLLATE SQL_Latin1_General_CP1_CS_AS;

-- Check the default collation of your database
SELECT DATABASEPROPERTYEX(DB_NAME(), 'Collation') AS DatabaseCollation;


WITH cte AS (
    -- This CTE (Common Table Expression) processes the 'employees' table to handle 
    -- case-insensitive duplicates of email addresses while retaining case-specific details.

    SELECT *, 
           ASCII(email_id) AS ascii_email,  -- Calculates the ASCII value of the first character in 'email_id'.
           LOWER(email_id) AS lower_email,  -- Converts 'email_id' to lowercase to identify duplicates regardless of case.
           
           -- Ranks rows within each group of lowercased 'email_id' values, ordering by ASCII values in descending order.
           -- This ranking helps to keep only the preferred version of the email address (e.g., uppercase over lowercase).
           RANK() OVER(PARTITION BY LOWER(email_id) ORDER BY ASCII(email_id) DESC) AS rn
           
    FROM employees
)

-- Selects rows from the CTE where the rank is 1, meaning it keeps the top-ranked (preferred) version of each email.
-- This effectively removes case-insensitive duplicates, keeping only one occurrence per unique lowercased email address.
SELECT * 
FROM cte
WHERE rn = 1;

-- This statement modifies the 'employees' table to change the collation of the 'email_id' column back to case-insensitive.
ALTER TABLE employees
ALTER COLUMN email_id VARCHAR(15) COLLATE SQL_Latin1_General_CP1_CI_AS;

-- Check the default collation of your database
SELECT DATABASEPROPERTYEX(DB_NAME(), 'Collation') AS DatabaseCollation;
