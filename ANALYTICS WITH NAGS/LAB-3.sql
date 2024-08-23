USE praveendb;

DROP TABLE CUSTOMER

Create table Customer
( CustId Int NULL,
CustName nvarchar(100) NULL,
CustAddress varchar(150) NULL,
Gender char(1) not null
);

select * from Customer

Insert into Customer (CustId,CustName,CustAddress , Gender )
values(1 , 'Praveen Singh' ,'Lucknow' ,'M');

Insert into Customer (CustId,CustName,CustAddress , Gender)
values(2 , 'Ravi Jaiswal' ,null , 'M');

Insert into Customer (CustId,CustName,CustAddress , Gender)
values(3 , 'Vinay Gupta' ,'Gorakhpur' , 'M');


update Customer set CustName = 'Riya', CustAddress = 'Bangalore' , Gender = 'F' where CustId = 2;
