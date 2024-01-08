-- ******************
	-- LAB -1		|
-- ******************
-- Creating praveendb Database
create database praveendb;

-- Selecting praveendb Database
use praveendb;

-- ******************
-- DDL Statements	|  -- DATA DEFINATION LANGUAGE
-- ******************
Create table Customer
( CustId Int,
CustName nvarchar(100),
CustAddress varchar(150)
);

-- Adding New Column 'Phone'
Alter table Customer
add phone nvarchar(15);

-- Adding New Column 'DOB'
Alter table Customer
add DOB Datetime;

-- Adding New Column 'Gender'
Alter table Customer
add Gender char(1);

-- Deleting Data and Recreating Customer Table
truncate table Customer;

-- Droping the Customer Table
drop table Customer;

-- ******************
-- DML Statements	| -- DATA MANIPULATION LANLUAGE
-- ******************

Insert into Customer (CustId,CustName,CustAddress )
values(1 , 'Praveen Singh' ,'Lucknow');

Insert into Customer (CustId,CustName,CustAddress )
values(2 , 'Ravi Jaiswal' ,'Sultanpur');

Insert into Customer (CustId,CustName,CustAddress )
values(3 , 'Vinay Gupta' ,'Gorakhpur');


update customer set Gender ='M';

update customer set DOB = '' where custid = 1;
update customer set DOB = '' where custid = 2;
update customer set DOB = '' where custid = 3;

update customer set phone = '9876543210' where custid = 1;
update customer set phone = '9876543211' where custid = 2;
update customer set phone = '9876543212' where custid = 3;

delete from customer where CUSTiD = 4;

-- ******************
-- DQL Statements	| -- DATA QUERY LANGUAGE
-- ******************

select * from Customer;

