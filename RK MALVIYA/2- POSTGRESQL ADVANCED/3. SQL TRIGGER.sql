--CREATE EMPLOYEES TABLE:
CREATE TABLE DEMO_TEST.employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    last_modified TIMESTAMP
);
-- INSERT DATA IN EMPLOYEES TABLE:
INSERT INTO DEMO_TEST.employees (first_name, last_name, last_modified)

VALUES
    ('John', 'Doe', NOW()),
    ('Jane', 'Smith', NOW()),
    ('Michael', 'Johnson', NOW()),
    ('Emily', 'Williams', NOW()),
    ('David', 'Brown', NOW()),
    ('Sarah', 'Jones', NOW()),
    ('Robert', 'Miller', NOW()),
    ('Jennifer', 'Davis', NOW()),
    ('William', 'Wilson', NOW()),
    ('Linda', 'Taylor', NOW());

-- INSERT SINGLE RECORD IN TABLE:
INSERT INTO DEMO_TEST.employees (first_name, last_name, last_modified)
VALUES
      ('Guddu', 'Yadav', NOW());
	
------------------------------------------------
-- Count the total number of records in the 'employees' table
SELECT COUNT(1) AS TOTAL_RECORD FROM DEMO_TEST.employees; -- 10

-- Insert a new record into the 'employees' table
-- +1 movies insert or update
INSERT INTO DEMO_TEST.employees
    (first_name, last_name, last_modified)
VALUES
    ('New', 'Employee', NOW());

-- Log the count of employees before the insertion
-- employees_cnt first -- 10 + 1
LOG employees_cnt first

-- Create a table to store employee count history
CREATE TABLE demo_test.employees_cnt
    (type VARCHAR(100), row_cnt INT);

-- Insert initial employee count into the history table
INSERT INTO demo_test.employees_cnt
VALUES
    ('first_time', 10);

-- Select and display the contents of the employees count history table
SELECT COUNT(1) FROM demo_test.employees_cnt;
SELECT * FROM demo_test.employees_cnt;

--EXAMPLE : DROP TRIGGER IF EXISTS trg_movies_cnt ON demo_test.employees_cnt;
CREATE OR REPLACE TRIGGER trg_employees_cnt
	AFTER INSERT 
	ON demo_test.employees
	FOR EACH ROW
	EXECUTE FUNCTION demo_test.fn_employees_cnt();
	
-- Create a trigger function to update employee count history
CREATE OR REPLACE FUNCTION demo_test.fn_employees_cnt()
RETURNS TRIGGER AS $$
BEGIN
    -- Update employee count history table
    INSERT INTO demo_test.employees_cnt (type, row_cnt)
    VALUES ('Total_Count', (SELECT COUNT(*) FROM demo_test.employees));
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

SELECT * from demo_test.employees_cnt;
SELECT * from demo_test.employees;
TRUNCATE  demo_test.employees_cnt;
TRUNCATE  demo_test.employees;








