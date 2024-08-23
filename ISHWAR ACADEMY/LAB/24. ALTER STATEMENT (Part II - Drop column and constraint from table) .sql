-- Select all constraints applied to tables in the database
SELECT * FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE;

-- Select information about columns for the 'company_info' table
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'emp_details';

-- Select all records from the 'emp_details' table
SELECT * FROM emp_details;

-- Select all records from the 'company_info' table
SELECT * FROM company_info;

-- Alter the 'company_info' table to drop the 'revenue' column
ALTER TABLE company_info DROP COLUMN revenue;


-- Drop the primary key constraint on the 'project_id' column
ALTER TABLE company_info DROP CONSTRAINT projectid_pk;

-- Alter the 'company_info' table to drop the 'project_id' column
ALTER TABLE company_info DROP COLUMN project_id;


-- Drop the 'company_info' table
DROP TABLE company_info;


-- for deleting CONSTRAINT and column together CONSTRAINT_name  =  pID_unique_key  

alter table emp_details drop CONSTRAINT pID_unique_key, column projectID;


-- Alter the 'emp_details' table to allow NULL values on 'project_completed' column
ALTER TABLE emp_details
ALTER COLUMN project_completed INT NULL;

-- Update the 'emp_details' table to set 'project_completed' column to NULL
UPDATE emp_details
SET project_completed = NULL;


select * from emp_details

-- Update the 'emp_details' table to set 'project_completed' column to a default value
UPDATE emp_details
SET project_completed = 0; -- replace 0 with the desired default value


-- Alter the 'emp_details' table to drop 'name' column
ALTER TABLE emp_details
DROP COLUMN name;

-- Alter the 'emp_details' table to drop 'phone' column
ALTER TABLE emp_details
DROP COLUMN phone;



-- Drop the default constraint on the 'project_completed' column
ALTER TABLE emp_details
DROP CONSTRAINT DF__emp_detai__proje__4E88ABD4;

-- Now, you can drop the 'project_completed' column
ALTER TABLE emp_details
DROP COLUMN project_completed;


drop table emp_details;

select * from INFORMATION_SCHEMA.TABLES;
