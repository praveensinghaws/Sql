USE praveendb;
drop table if exists	customer
go

Create table Customer
( CustId Int NULL,
CustName nvarchar(100) NULL,
CustAddress varchar(150) NULL,
Gender char(1) not null,
Phone varchar(15) not null default '+918888888888',
Age int check (age >18),
Aadhar int unique
);

go

Insert into Customer (CustId,CustName,CustAddress , Gender  , Phone, Age , Aadhar)
values(1 , 'Praveen Singh' ,'Lucknow' ,'M' , '+919876543210' , 20 , 98770);

go
Insert into Customer (CustId,CustName,CustAddress , Gender , Phone ,Age , Aadhar)
values(2 , 'Diksha Chaudhary' ,'Mumbai' ,'F' , '+919876012345', 23, 98759);

go
Insert into Customer (CustId,CustName,CustAddress , Gender ,Age, Aadhar)
values(2 , 'Rahul Gandhi' ,'Delhi' ,'M' ,45, 98758);




select * from Customer

