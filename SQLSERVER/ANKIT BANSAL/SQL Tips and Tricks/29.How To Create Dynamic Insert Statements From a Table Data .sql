use demodb;
select * from INFORMATION_SCHEMA.tables;
select * from emp;
-- This SQL query generates INSERT statements for each row in the 'emp' table

-- SELECT statement retrieves rows from 'emp' table
SELECT 
    CONCAT(
        'INSERT INTO emp VALUES(',   -- Beginning of the INSERT statement
        emp_id, ',',                -- Inserting emp_id
        CHAR(39), emp_name, CHAR(39), ',', -- Inserting emp_name (enclosed in single quotes)
        salary, ',',                -- Inserting salary
        CHAR(39), dob, CHAR(39),    -- Inserting dob (enclosed in single quotes)
        ');'                        -- Closing the INSERT statement
    )
FROM 
    emp;                           -- The source table 'emp'
