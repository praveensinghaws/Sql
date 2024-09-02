/*
----------------
 MYSQL TRIGGERS|
----------------
stored program which is automatically executed in reponse to sepecific
events (insert,update, delete)

There are 6 types of triggers.
1. Before Insert
2. After Insert
3. Before Update
4. After Update
5. Before Delete
6. After Delete
*/

--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ USE CASES:1 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
-- Creating the 'users' table with relevant columns.
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(200),
    per_hour_salary INT DEFAULT 0,  -- Salary per hour
    working_hour INT DEFAULT 0,     -- Working hours
    total_salary INT DEFAULT 0      -- Total salary calculated based on per_hour_salary * working_hour
);

-- Inserting initial data into the 'users' table.
INSERT INTO users (user_id, name, per_hour_salary, working_hour)
VALUES
(1001, 'Praveen Singh', 7000, 7);

-- CREATING : BEFORE INSERT TRIGGER
-- CREATE TRIGGER : SYNTAX TRIGGER:
-- General syntax for creating triggers in MySQL.
/*
 DELIMITER //
 CREATE TRIGGER [TRIGGER_NAME] 
 [EVENT: BEFORE INSERT / AFTER INSERT / BEFORE UPDATE / AFTER UPDATE]
 ON [TABLE_NAME] FOR EACH ROW
 BEGIN
    ... -- Body of the Trigger
 END; //
 DELIMITER ;
 */

-- WHAT IS NEW AND OLD IN TRIGGERS?
/*
Triggers use 'NEW' and 'OLD' references based on the type of trigger:

INSERT --->>>
    NEW: Accesses new rows being inserted.

UPDATE--->>>
    NEW: Accesses new values being updated.
    OLD: Accesses existing values before the update.

DELETE--->>>
    OLD: Accesses rows that are being deleted.

*/

----##############
-- Creating a BEFORE INSERT trigger on 'users' to calculate 'total_salary' before insertion.
DELIMITER //

CREATE TRIGGER before_insert_user
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    SET NEW.total_salary = NEW.per_hour_salary * NEW.working_hour;  -- Calculate the total salary before inserting
END; //

DELIMITER ;

-- INSERT DATA AFTER CREATING TRIGGERS
-- Test the trigger by inserting new records; 'total_salary' will be calculated automatically.
INSERT INTO users (user_id, name, per_hour_salary, working_hour)
VALUES
(1002, 'Priya Singh', 6000, 6);

INSERT INTO users (user_id, name, per_hour_salary, working_hour)
VALUES
(1003, 'Vandana Tiwari', 8000, 20);

----##############
-- CREATING : BEFORE UPDATE TRIGGER
-- This trigger updates 'total_salary' whenever 'per_hour_salary' or 'working_hour' is updated.
DELIMITER //

CREATE TRIGGER before_update_user 
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    SET NEW.total_salary = NEW.per_hour_salary * NEW.working_hour;  -- Recalculate 'total_salary' on update
END; //

DELIMITER ;

-- Example of updating a record to trigger the BEFORE UPDATE trigger
UPDATE users SET working_hour = 11 WHERE user_id = 1001;  -- This will recalculate 'total_salary' based on the updated hours

-- UPDATE Example: This will trigger the before_update_user trigger to recalculate 'total_salary'.
UPDATE users SET per_hour_salary = 10000 WHERE user_id = 1001; 

----##############
-- CREATING : DELETE TRIGGER
-- The DELETE trigger will execute whenever a row is deleted from the 'users' table.

-- Purpose: Example - Log the deletion to a separate table or perform cleanup.
-- To keep it simple, we’ll just output the ID and name of the deleted user.

-- First, let's create a table to log deleted users for reference:
CREATE TABLE deleted_users_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(200),
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Creating a BEFORE DELETE trigger on 'users' to log deletions into 'deleted_users_log'.
DELIMITER //

CREATE TRIGGER before_delete_user
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    -- Insert details of the deleted row into 'deleted_users_log' for tracking purposes.
    INSERT INTO deleted_users_log (user_id, name)
    VALUES (OLD.user_id, OLD.name);  -- Use 'OLD' to access values of the row being deleted
END; //

DELIMITER ;

-- Example of deleting a record, which will activate the before_delete_user trigger.
DELETE FROM users WHERE user_id = 1002;

-- Check the log table to verify the deletion log entry.
SELECT * FROM deleted_users_log;

--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ USE CASES:2 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^--
CREATE TABLE accounts(
    acc_no INT primary key,
    user_id INT,
    balance DECIMAL (10.2) DEFAULT 0
    );

ALTER TABLE users ADD COLUMN acc_count int DEFAULT 0;

-- CREATING TRIGGERS :
-- CREATE TRIGGER : To update acc_count of users when a new account is opened.

DELIMITER //

CREATE TRIGGER before_open_account
BEFORE INSERT ON accounts
FOR EACH ROW
BEGIN
    -- Update the 'acc_count' of the user associated with the new account.
    UPDATE users 
    SET acc_count = acc_count + 1  -- Increment acc_count by 1
    WHERE user_id = NEW.user_id;   -- Use NEW to reference the user_id of the row being inserted into 'accounts'
END; //

DELIMITER ;

INSERT INTO accounts (acc_no, user_id, balance) 
VALUES (20001, 1001, 100000),
(20002, 1001, 150000),
(20003, 1002, 50000),
(20004, 1002, 80000),
(20005, 1002, 950000),
(20006, 1003, 330000);

-- CREATE TRIGGER: close account trigger
-- This trigger decreases the account count of a user when an account is deleted.

DELIMITER //

CREATE TRIGGER before_close_account
BEFORE DELETE ON accounts
FOR EACH ROW
BEGIN
    -- Decrement acc_count by 1 for the corresponding user when an account is closed.
    UPDATE users 
    SET acc_count = acc_count - 1 
    WHERE user_id = OLD.user_id;  -- Use OLD to access the values of the row being deleted from 'accounts'
END; //

DELIMITER ;

-- Deleting refrords from accounts table where user id is 1001.
DELETE FROM accounts WHERE user_id = 1001;

-- Update all rows in the 'users' table to set 'acc_count' to 0
UPDATE users 
SET acc_count = 0;