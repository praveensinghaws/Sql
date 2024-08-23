/*
*************************
  DDL & DML COMMANDS 
*************************
*/

---------------
DML COMMANDS-1|
---------------
-- Drop the Customer table if it exists

DROP TABLE IF EXISTS Customer;

-- Create the Customer table
CREATE TABLE Customer (
    Customer_ID  INT AUTO_INCREMENT,
    Customer_Name VARCHAR(100) NOT NULL,
    Customer_City VARCHAR(50),
    Customer_EmailD VARCHAR(100) UNIQUE,
    Customer_Mobile VARCHAR(15),
    PRIMARY KEY(Customer_ID)
);

DESCRIBE Customer;

-- Single

INSERT INTO `Customer`
(
    `Customer_Name`,`Customer_EmailD`,`Customer_City`,`Customer_Mobile`
)
VALUES
(
    'Praveen Singh', 'praveensingh@gmail.com','Lucknow', '9876543210'
);

COMMIT;

-- Multiple

INSERT INTO `Customer`
(
    `Customer_Name`,`Customer_EmailD`,`Customer_City`,`Customer_Mobile`
)
VALUES
('Priya Singh', 'priyasingh@gmail.com','Lucknow', '9876543213'),
('Rahul Gandhi', 'rahulgandhi@gmail.com','Delhi', '9876543211'),
('Akhilesh Yadav', 'akhileshyadav@gmail.com','Lucknow', '9876543212');

COMMIT;


---------------
DDL COMMANDS-1|
---------------

ALTER TABLE `Customer`
    ADD `Customer_Dob` DATE;


ALTER Table `Customer`
MODIFY `Customer_Name` VARCHAR(200);



---------------
DML COMMANDS-2|
---------------

-- Single Update
UPDATE `Customer` SET `Customer_Dob` = '1990-08-11' WHERE `Customer_ID` = 1 AND `Customer_Name` = 'Praveen Singh';

-- Multiple Update
UPDATE `Customer` SET `Customer_EmailD` = REPLACE(`Customer_EmailD`,'@gmail.com','@example.com'); 

COMMIT;


-- DELETE DML COMMANDS AND TRUNCATE DDL COMMANDS

DELETE FROM `Customer` WHERE `Customer_ID` = 1;
COMMIT;

TRUNCATE TABLE `Customer`;
COMMIT;

SELECT * FROM `Customer`;


-- DROP (DDL COMMANDS)
DROP TABLE `Customer`;

DROP DATABASE hocdb;

show DATABASES;