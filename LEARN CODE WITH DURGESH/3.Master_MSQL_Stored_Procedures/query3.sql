--------------------
-- STORE PROCEDURE |
--------------------
/*Advantages
1. Network traffic Reduce--not need to send lengthy queries:
2. Database business logic in the database
3. Database becomers more secure
*/
------------------------------------------------------------------1
DROP PROCEDURE IF EXISTS createtable_p;
DELIMITER //

CREATE PROCEDURE createtable_p()
BEGIN
    CREATE TABLE IF NOT EXISTS users (
        user_id INT PRIMARY KEY AUTO_INCREMENT,
        fname VARCHAR(255),
        lname VARCHAR(255),
        city VARCHAR(255),
        mobile VARCHAR(15)
    );
    
    INSERT INTO users (fname, lname, city, mobile) 
    VALUES 
        ('Kapil', 'Sharma', 'Punjab', '9876543210'),
        ('Praveen', 'Singh', 'Sultanpur', '9876543211'),
        ('Akhilesh', 'Yadav', 'Lucknow', '9876543212'),
        ('Priyanka', 'Gandhi', 'Delhi', '9876543213'),
        ('Rahul', 'Gandhi', 'Waynaad', '9876543214');
END; //

DELIMITER ;

CALL createtable_p();
SELECT * FROM users;
------------------------------------------------------------------2  VARIABLES
DROP PROCEDURE IF EXISTS tablecount_p;
DELIMITER //

CREATE PROCEDURE tablecount_p()
BEGIN
    DECLARE cnt_table INT DEFAULT 0;
    SELECT COUNT(*) INTO cnt_table 
    FROM users;
    SELECT cnt_table;
END; //

DELIMITER ;
CALL tablecount_p();
----
INSERT INTO users (fname, lname, city, mobile) 
VALUES ('ABC', 'XYZ', 'XXX', '0000000000');

CALL tablecount_p();
------------------------------------------------------------------3 PARAMETERS
-- IN -- USE CASE:
DROP PROCEDURE IF EXISTS fetchlname_p;
DELIMITER //

CREATE PROCEDURE fetchlname_p(IN lastname VARCHAR(255))
BEGIN
    SELECT * 
    FROM users 
    WHERE lname = lastname;
END; //

DELIMITER ;

CALL fetchlname_p('Singh');


-- OUT -- USE CASE:

DROP PROCEDURE IF EXISTS fetchcity_p;
DELIMITER //

CREATE PROCEDURE fetchcity_p(OUT city_name VARCHAR(255))
BEGIN
    SELECT city INTO city_name 
    FROM users 
    WHERE user_id = 1;  -- Example condition
END //

DELIMITER ;

CALL fetchcity_p(@cityname);
SELECT @cityname;


-- IN-OUT -- USE CASE:
DROP PROCEDURE IF EXISTS fetchlnamecnt_p;
DELIMITER //

CREATE PROCEDURE fetchlnamecnt_p(IN lastname VARCHAR(255), OUT lnamecnt INT)
BEGIN
    SELECT COUNT(*) INTO lnamecnt 
    FROM users 
    WHERE lname = lastname;
END //

DELIMITER ;

CALL fetchlnamecnt_p('Gandhi', @lastnamecount);
SELECT @lastnamecount;

------------------------------------------------------------------4 ALTER PROCEDURE
/*
Note: MySQL does not support the ALTER PROCEDURE statement for modifying stored procedures. 
Instead, you need to drop the existing procedure and then create it again with the desired changes.
*/
-- Drop the existing procedure
DROP PROCEDURE IF EXISTS fetchfnamecnt_p;

-- Set the delimiter to handle the procedure definition
DELIMITER //

-- Create the modified procedure
CREATE PROCEDURE fetchfnamecnt_p(IN f_name VARCHAR(255), OUT f_namecnt INT)
BEGIN
    SELECT COUNT(*) INTO f_namecnt 
    FROM users 
    WHERE fname = f_name;
END //

-- Reset the delimiter back to the default
DELIMITER ;

-- Call the modified procedure
CALL fetchfnamecnt_p('Akhilesh', @fnamecount);

-- Display the result
SELECT @fnamecount;


------------------------------------------------------------------4 DROP PROCEDURE
SHOW PROCEDURE STATUS 
WHERE Db = 'demodb';

-- SINGLE DROP
DROP PROCEDURE fetchfnamecnt_p;


-- BULK DROP :
-- Generate drop statements for all procedures
SELECT CONCAT('DROP PROCEDURE IF EXISTS ', ROUTINE_NAME, ';') AS drop_statement
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE = 'PROCEDURE'
AND ROUTINE_SCHEMA = DATABASE();

-- OUTPUT:
/*
+-------------------------------------------+
| drop_statement                            |
+-------------------------------------------+
| DROP PROCEDURE IF EXISTS createtable_p;   |
| DROP PROCEDURE IF EXISTS fetchcity_p;     |
| DROP PROCEDURE IF EXISTS fetchlnamecnt_p; |
| DROP PROCEDURE IF EXISTS fetchlname_p;    |
| DROP PROCEDURE IF EXISTS tablecount_p;    |
+-------------------------------------------+
5 rows in set (0.00 sec)
*/
DROP PROCEDURE IF EXISTS createtable_p;   
DROP PROCEDURE IF EXISTS fetchlnamecnt_p; 
DROP PROCEDURE IF EXISTS fetchlname_p;    
DROP PROCEDURE IF EXISTS tablecount_p;  












