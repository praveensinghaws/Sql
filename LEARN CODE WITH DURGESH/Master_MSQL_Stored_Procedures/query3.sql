--------------------
-- STORE PROCEDURE |
--------------------
/*Advantages
1. Network traffic Reduce--not need to send lengthy queries:
2. Database business logic in the database
3. Database becomers more secure
*/


-->>>>>
-- Changing Default Delimiter
delimiter //
delimiter ;

-->>>>>
-- Creating Stored Procedure
DELIMITER //

CREATE PROCEDURE CreateUserTable()
BEGIN
    CREATE TABLE IF NOT EXISTS users (
        user_id INT AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(255),
        last_name VARCHAR(255),
        city VARCHAR(255)
    );
    
    INSERT INTO users (first_name, last_name, city) VALUES ('Praveen', 'Singh', 'Lucknow');
    INSERT INTO users (first_name, last_name, city) VALUES ('Akhilesh', 'Yadav', 'Manpuri');
    INSERT INTO users (first_name, last_name, city) VALUES ('Rahul', 'Gandhi', 'Delhi');

    SELECT * FROM users;
END //

DELIMITER ;


-- To execute the procedure after creating it, use:
CALL CreateUserTable();

-->>>>>
-- Variables
DELIMITER //

CREATE PROCEDURE CountItems()
BEGIN
    DECLARE cnt INT DEFAULT 0;  -- Declare a variable 'cnt' to hold the count value
    
    SELECT COUNT(*) INTO cnt FROM users;  -- Count the rows in the 'users' table and store it in 'cnt'
    
    SELECT cnt;  -- Output the count
END //

DELIMITER ;

-- To execute the procedure after creating it, run:
CALL CountItems();


-->>>>>
-- Paramters-IN, OUT, INOUT
DELIMITER //

CREATE PROCEDURE SelectByLastName(IN l_name VARCHAR(255))
BEGIN
    SELECT * FROM users WHERE last_name = l_name;  -- Select records where last_name matches the input parameter
END //

DELIMITER ;

-- To execute the procedure after creating it, run:
CALL SelectByLastName('Yadav');

DELIMITER //

CREATE PROCEDURE CountByLastName(IN l_name VARCHAR(255), OUT cnt_lname INT)
BEGIN
    SELECT COUNT(*) INTO cnt_lname FROM users WHERE last_name = l_name;  -- Count the rows where last_name matches the input parameter
END //

DELIMITER ;

-- To execute the procedure after creating it, run:
CALL CountByLastName('Singh', @CountLast);


-- Note : Correct Way to Call the Procedure:
-- Declare a session variable to hold the output value
SET @cnt := 0;

-- Call the procedure, passing the input value and the session variable for the output
CALL CountByLastName('Gandhi', @cnt);

-- Display the result stored in the session variable
SELECT @cnt AS CountOfGandhi;


-->>>
-- Drop procedure
DROP PROCEDURE CountItems;
DROP PROCEDURE CountByLastName;
DROP PROCEDURE CreateUserTable;
DROP PROCEDURE SelectByLastName;

-- Alter procedure -- Pending



-->>>>
-- Listing Stored Procedures

-- Here’s how you can see the list of procedures in your current database:
SHOW PROCEDURE STATUS WHERE Db = 'demodb';

-- Alternatively, if you are using the current database and want to see all procedures in it, you can use:
SHOW PROCEDURE STATUS LIKE '%';

--Or, you can get a more detailed view directly from the information schema:
SELECT * 
FROM information_schema.ROUTINES 
WHERE ROUTINE_TYPE = 'PROCEDURE' AND ROUTINE_SCHEMA = 'demodb';