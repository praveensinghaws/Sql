/*
Triggers in SQL
IN SQL, A TRIGGER IS A STORED PROCEDURE THAT AUTOMATICALLY EXECUTES OR FIRES WHEN CERTAIN EVENTS OCCUR IN A DATABASE, 
SUCH AS INSERT, DELETE UPDATE, DROP ETC.

Use Cases for Triggers:
DATA VALIDATION: Ensure data integrity.
AUDITING: Track changes to tables.
CASCADE ACTIONS: Perform actions automatically after certain operations.

There are 3 types of triggers in SQL server
1. DML TRIGGERS
2. DDL TRIGGERS
3. LOGON TRIGGERS

DML TRIGGERS ARE FIRED AFTER ANY DML OPERATION (INSERT, UPDATE OR DELETE)

DML TRIGGERS ARE FURTHER CLASSIFIED INTO
1- AFTER TRIGGERS OR FOR TRIGGERS (MOST COMMONLY USED)
2- INSTEAD OF TRIGGERS
*/
SELECT * FROM information_schema.tables;

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(20),
    department_id INT,
    salary INT,
    manager_id INT,
    emp_age INT
);

INSERT INTO employees VALUES (1, 'Ankit', 100, 10000, 4, 39);
INSERT INTO employees VALUES (2, 'Mohit', 100, 15000, 5, 48);
INSERT INTO employees VALUES (3, 'Vikas', 100, 10000, 4, 37);
INSERT INTO employees VALUES (4, 'Rohit', 100, 5000, 2, 16);
INSERT INTO employees VALUES (5, 'Mudit', 200, 12000, 6, 55);


CREATE TABLE employee_audit (
    id INT IDENTITY(1,1),
    audit_text VARCHAR(255),
    audit_timestamp DATETIME
);

SELECT * FROM employees;
SELECT * FROM employee_audit;

SELECT * FROM employee_audit WHERE audit_text LIKE '%Deleted%';
SELECT * FROM employee_audit WHERE audit_text LIKE '%Inserted%';
SELECT * FROM employee_audit WHERE audit_text LIKE '%Updated%';

-------------------------------------------
-- AFTER INSERT TRIGGER
-------------------------------------------

DROP TRIGGER IF EXISTS tr_employees_afterinsert;

CREATE TRIGGER tr_employees_afterinsert
ON employees
AFTER INSERT 
AS
BEGIN
    -- Selects the newly inserted rows
    SELECT * FROM inserted;

    -- Example of logging into the employee_audit table
    INSERT INTO employee_audit (audit_text, audit_timestamp)
    SELECT 
        CONCAT('Inserted employee with ID: ', emp_id, ', Name: ', emp_name),
        GETDATE()
    FROM inserted;
END;

-- Example insert statement to trigger the trigger
INSERT INTO employees VALUES (6, 'Agam', 200, 12000, 2, 14);
INSERT INTO employees VALUES (7, 'Sanjay', 200, 9000, 2, 13);
INSERT INTO employees VALUES (8, 'Ashish', 200, 5000, 2, 12);
INSERT INTO employees VALUES (9, 'Mukesh', 300, 6000, 6, 51);
INSERT INTO employees VALUES (10, 'Rakesh', 300, 7000, 6, 50);
-------------------------------------------
-- AFTER DELETE TRIGGER
-------------------------------------------
DROP TRIGGER IF EXISTS tr_employees_afterdelete;

CREATE TRIGGER tr_employees_afterdelete
ON employees
AFTER DELETE
AS
BEGIN
    -- Display the deleted rows
    SELECT * FROM deleted;

    -- Insert an audit record for each deleted row
    INSERT INTO employee_audit (audit_text, audit_timestamp)
    SELECT 
        CONCAT('Deleted employee with ID: ', emp_id, ', Name: ', emp_name),
        GETDATE()
    FROM deleted;
END;

DELETE from employees WHERE emp_id = 6;

-------------------------------------------
-- AFTER UPDATE TRIGGER
-------------------------------------------

DROP TRIGGER IF EXISTS tr_employees_afterupdate;

CREATE TRIGGER tr_employees_afterupdate
ON employees
AFTER UPDATE
AS
BEGIN
    -- Display the updated rows
    SELECT * FROM inserted;

    -- Insert an audit record for each updated row
    INSERT INTO employee_audit (audit_text, audit_timestamp)
    SELECT 
        CONCAT('Updated employee with ID: ', emp_id, ', Name: ', emp_name),
        GETDATE()
    FROM inserted;
END;

UPDATE employees SET emp_name = 'Praveen Singh' WHERE emp_id = 7;
