CREATE DATABASE amitdb;
USE amitdb;
=================================================================================
DROP TABLE IF EXISTS EMPLOYEE;
CREATE TABLE employee (
firstname varchar(20),
middlename varchar(20),
lastname varchar(20),
age int,
salary int,
location varchar(20)
);

-- =================================================================================

INSERT INTO employee (firstname, middlename, lastname, age, salary, location) VALUES
('Rahul', NULL, 'Sharma', 28, 50000, 'Delhi'),
('Priya', NULL, 'Yadav', 35, 60000, 'Mumbai'),
('Amit', NULL, 'Verma', 22, 45000, 'Bangalore'),
('Neha', NULL, 'Mishra', 30, 55000, 'Hyderabad'),
('Ananya', NULL, 'Jha', 25, 48000, 'Kolkata');
=================================================================================

-- WHERE AND ORDER BY 

SELECT * FROM employee
ORDER BY age , salary;

SELECT * FROM employee
WHERE location = 'Delhi' AND salary = 50000;


SELECT * FROM employee
WHERE salary BETWEEN 50000 and 55000;


SELECT * FROM employee
WHERE salary not  BETWEEN 50000 and 55000;

-- LIKE OPERATION 

select * from employee
where firstname like '%iy%';

select * from employee
where firstname like 'ne%';


select * from employee
where firstname like '%ya';

select * from employee
where firstname like '______';

select * from employee
where firstname like '_e%';

select * from employee
where firstname not like 'A%';

select * from employee
where firstname like '___ya%';


-- =================================================================================
--  MATH FUNCTION 

SELECT MAX(SALARY) AS MAX_SALARY  FROM EMPLOYEE;

SELECT MIN(SALARY) AS MIN_SALARY  FROM EMPLOYEE;

SELECT AVG(SALARY) AS AVG_SALARY  FROM EMPLOYEE;

SELECT SUM(SALARY) AS TOTAL_SALARY  FROM EMPLOYEE;

SELECT SUM(SALARY) AS TOTAL_SALARY  FROM EMPLOYEE WHERE SALARY >= 50000;

SELECT COUNT(firstname) AS EMP_50000 FROM EMPLOYEE WHERE SALARY >50000;



-- =================================================================================
DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
firstname varchar(20) NOT NULL UNIQUE,
middlename varchar(20),
lastname varchar(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location varchar(20) NOT NULL
);



INSERT INTO employee (middlename , lastname ,age ,salary,location )
VALUES ('Kumar' , 'Sharma' ,20 , 10000 , 'Bangalore');   [ERROR 1364 (HY000): Field 'firstname' doesn't have a default value]

-- =================================================================================

DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
firstname varchar(20) NOT NULL,
middlename varchar(20),
lastname varchar(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location varchar(20)  DEFAULT 'Bangalore'
);


INSERT INTO employee (firstname , lastname ,age ,salary )
VALUES ('Kapil' , 'Sharma' ,28 , 10000 );   

INSERT INTO employee (firstname , lastname ,age ,salary, location )
VALUES ('Pawan' , 'Soni' ,33 , 20000 , 'Hyderabad'); 

INSERT INTO employee (firstname , lastname ,age ,salary, location )
VALUES ('Ritu' , 'Soni' ,23 , 40000 , NULL); 

-- =================================================================================

DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
firstname varchar(20) NOT NULL,
middlename varchar(20),
lastname varchar(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location varchar(20) NOT NULL  DEFAULT 'Bangalore'
);

SELECT * FROM EMPLOYEE;

mysql> INSERT INTO employee (firstname , lastname ,age ,salary, location )
    -> VALUES ('Ritu' , 'Soni' ,23 , 40000 , NULL);	--[ERROR 1048 (23000): Column 'location' cannot be null

-- =================================================================================

DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
id int Primary key,
firstname varchar(20) NOT NULL,
middlename varchar(20),
lastname varchar(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location varchar(20) NOT NULL  DEFAULT 'Bangalore'
);


INSERT INTO employee (id, firstname, lastname, age, salary) VALUES
(1, 'Rahul', 'Sharma', 28, 50000),
(2, 'Priya', 'Yadav', 35, 60000),
(3, 'Amit', 'Verma', 22, 45000),
(4, 'Neha', 'Mishra', 30, 55000),
(5, 'Ananya', 'Jha', 25, 48000),
(6, 'PRAVEEN', 'SINGH', 32, 75000),
(7, 'sonu', 'singh', 40, 5000);

-- =================================================================================
--CREATE PROCEDURE

SELECT * FROM EMPLOYEE ;

CREATE PROCEDURE AllRecords
AS
SELECT * from employee  
GO;


EXEC ALLRecords;
--=======================
CREATE PROCEDURE AgeRecords
AS
SELECT firstname , age
from employee
GO;

EXEC AgeRecords;

--=======================


CREATE PROCEDURE lastnamerecord @lastname VARCHAR(20)
AS
SELECT * from employee WHERE lastname = @lastname;


EXEC lastnamerecord @lastname = 'Singh';


--=======================


CREATE PROCEDURE emprecords @lastname VARCHAR(20) , @age INT
AS
SELECT * from employee WHERE lastname = @lastname OR age = @age  ;


EXEC emprecords @lastname = 'YADAV' ,@age = 30 ;

-- =================================================================================

-- CREATE INDEX

SELECT * FROM EMPLOYEE;

CREATE INDEX MYINDEX
ON EMPLOYEE (firstname );


CREATE INDEX MYINDEX2
ON EMPLOYEE (firstname , AGE , SALARY );


DROP INDEX EMPLOYEE.MYINDEX2;



-- =================================================================================
-- BACKUP

SELECT * INTO EMPBACKUP2022 FROM EMPLOYEE ;

SELECT * FROM EMPBACKUP2022;


SELECT * INTO EMPAGEABOVE30 FROM EMPLOYEE WHERE AGE >30 ;

SELECT * FROM EMPAGEABOVE30;


SELECT firstname , AGE , SALARY  INTO EMPNEW FROM EMPLOYEE ;

SELECT * FROM EMPNEW;

-- =================================================================================
SELECT TOP 2 * FROM EMPLOYEE;

SELECT  TOP 50 PERCENT * FROM EMPLOYEE;

SELECT  TOP 75 PERCENT * FROM EMPLOYEE;

SELECT  TOP 25 PERCENT * FROM EMPLOYEE WHERE AGE >30;


SELECT TOP 2 * FROM EMPLOYEE WHERE SALARY > 50000;

-- =================================================================================
-- BACKUP DATABASE

BACKUP DATABASE amitdb 
to DISK = 'D:\amitdbbackup.bak';
















