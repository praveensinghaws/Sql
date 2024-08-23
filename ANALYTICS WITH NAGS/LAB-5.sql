-- PRIMARY KEY - FOREIGN KEY
USE praveendb;
drop table if exists	customer_purchase
drop table if exists	customer
go

Create table Customer
(
CustId Int PRIMARY KEY, -- PRIMARY KEY
CustName nvarchar(100) ,
CustAddress varchar(150) NOT NULL, -- NOT NULL
Gender char(1) DEFAULT 'U', -- DEFAULT
Phone varchar(15)  UNIQUE , -- UNIQUE
Age int check (age >18), -- CHECK
);


INSERT INTO Customer (CustId , CustName , CustAddress , Phone , Age)
VALUES (1, 'MAHIMA' , 'MUMBAI' , '987654321' , 32);

INSERT INTO Customer (CustId , CustName , CustAddress , Phone , Age)
VALUES (2, 'RAJEEV' , 'DELHI' , '4567654321' , 44);

INSERT INTO Customer (CustId , CustName , CustAddress , Phone , Age)
VALUES (3, 'SONIA' , 'BENLALORE' , '67542342' , 29);

INSERT INTO Customer (CustId , CustName , CustAddress , Phone , Age)
VALUES (5, 'PRAVEEN' , 'LUCKNOW' , '470872' , 31);



-- FOREIGN KEY 

create table customer_purchase
(
RowId int identity (1,2),  -- INDENTITY = AUTO_INCREMENT
Cust_Id Int foreign key references customer(CustId),
Product varchar(20),
Qty int,
Price Decimal(18,8)
);


insert into customer_purchase (Cust_Id , Product ,Qty , Price)
values 
(1,'Biscuit' , 2 ,20),
(1,'Paste' , 1 , 60),
(1,'Bottle' , 1 , 120),
(2,'Chocolate' , 5, 10),
(2,'Chips' , 4, 20),
(3,'Apple', 1, 95.50),
(3,'Chocolate', 2,10),
(3,'Paste' , 2 , 66.40);



SELECT * FROM Customer

SELECT * FROM customer_purchase


insert into customer_purchase (Cust_Id , Product ,Qty , Price)
values 
(5,'Biscuit' , 12 ,20)



DELETE FROM customer_purchase WHERE Cust_Id = '5';  --  FIRST DELETE FROM FOREIGN KEY  TABLE 

DELETE FROM Customer WHERE CustName = 'PRAVEEN';	-- THEN DELETE FROM PRIMARY KEY TABLE 



USE PRAVEENDB

DROP TABLE Customer
CREATE TABLE CUSTOMER
(
CUSTID INT identity (1,1),
EMPNAME VARCHAR(20),
DOB DATE ,   -- DATE COLUMN
SALARY INT
)



INSERT INTO Customer VALUES ('PRAVEEN' ,'1990-08-11' , 20000 )


SELECT * FROM Customer


USE BikeStores