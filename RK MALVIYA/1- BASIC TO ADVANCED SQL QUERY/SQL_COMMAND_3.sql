--**********************
-- INFORMATION SHCHEMA
--***********************
-- TABLES:
-- Retrieve all information from the information_schema.TABLES table
SELECT *
FROM information_schema.TABLES;

SELECT *
FROM information_schema.TABLES
WHERE table_schema = 'demo_test'

SELECT *
FROM information_schema.TABLES
WHERE table_schema = 'demo_test' and TABLES.table_name like '%students%'

-- VIEWS:
-- Retrieve all information from the information_schema."views" table
SELECT *
FROM information_schema."views"
WHERE "views".view_definition LIKE '%bgwrite%';

-- CHECK_CONSTRAINTS:
-- Retrieve all information from the information_schema.check_constraints table
SELECT *
FROM information_schema.check_constraints;

-- COLUMNS:
-- Retrieve all columns information from the specified schema with 'first' in column name
SELECT *
FROM information_schema."columns"
WHERE table_schema = 'demo_test' AND column_name LIKE '%first%';

--CONSTRAINTS_COLUMN_USAGE:
-- Retrieve all information from the information_schema.constraint_column_usage table
SELECT *
FROM information_schema.constraint_column_usage;

-- ROUTINE_COLUMN_USAGE : [FUTURE]
-- Retrieve all information from the information_schema.routine_column_usage table
SELECT *
FROM information_schema.routine_column_usage;

-- COLUMN_OPTIONS : [FUTURE]
-- Retrieve all information from the information_schema.column_options table
SELECT *
FROM information_schema.column_options;

-- USER_MAPPINGS : [FUTURE]
-- Retrieve all information from the information_schema.user_mappings table
SELECT *
FROM information_schema.user_mappings;

-- Retrieve all information from the information_schema.sql_sizing table
SELECT *
FROM information_schema.sql_sizing;


-- Retrieve all information from the information_schema."routines" table
SELECT *
FROM information_schema."routines"
WHERE ROUTINE_definition LIKE '%single%'


-- Retrieve all rows from the pg_tables table where tablename is 'students_a'
SELECT *
FROM pg_tables
WHERE tablename = 'students_a';


-- Retrieve all rows from the information_schema."tables" table
-- where the table_schema is 'information_schema'
SELECT *
FROM information_schema."tables"
WHERE table_schema = 'information_schema';


--******************
--DONE--
--*******************
