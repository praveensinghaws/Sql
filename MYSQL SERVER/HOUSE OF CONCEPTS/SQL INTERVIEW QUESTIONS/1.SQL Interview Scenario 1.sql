-- 1.Accenture SQL Interview Scenario sql Projects Worked On by Employees.

--CREATE SCRIPT
CREATE TABLE [dbo].[EmployeeDetails](
	[EmpId] [int] NULL,
	[FullName] [varchar](100) NULL,
	[ManagerId] [int] NULL,
	[JoiningDate] [date] NULL,
	[City] [varchar](50) NULL
)

CREATE TABLE [dbo].[EmployeeSalary](
	[EmpId] [int] NULL,
	[Project] [varchar](100) NULL,
	[FixedSalary] [money] NULL,
	[VariableSalary] [money] NULL
)

--INSERT SCRIPT

INSERT INTO EmployeeDetails
(EmpId,FullName,ManagerId,JoiningDate,City)
VALUES
(1001,'Henry James',1002,'2018-04-11','Toronto'),
(1002,'Mathew Peterson',	1123,'2017-07-12',	'New York'),
(1003,'Jessica Holmes',2653	,'2016-12-22',	'Mexico City'),
(1004,'Raghav Bhatia',	3363	,'2017-05-14',	'New Delhi'),
(1005,'John Ford',	1120	,'2018-11-23',	'London'),
(1006,'Sharon Alba',	1003	,'2020-01-09',	'Porto'),
(1007,'Ivan Gilbert',	1562	,'2010-08-17',	'Melbourne'),
(1008,'T.N Mahesh',	1985	,'2015-03-06',	'Bangalore')


INSERT INTO EmployeeSalary
(EmpId,Project,FixedSalary,VariableSalary)
VALUES
(1001,'P1',25000,6000),
(1003,'P1',15000,2000),
(1004,'P4',45000,18000),
(1007,'P2',30000,11500),
(1008,'P2',17000,2800)

--Scenario 1
---Write a SQL query to fetch all the records that are present in EmployeeDetails but not in EmployeeSalary


-- Solution to retrieve rows from EmployeeDetails where corresponding rows are not found in EmployeeSalary
SELECT * 
FROM EmployeeDetails A WITH (NOLOCK)
LEFT JOIN EmployeeSalary B WITH (NOLOCK)
ON A.EmpId = B.EmpId
WHERE B.EmpId IS NULL;

/*
The WITH (NOLOCK) hint, also known as the "NOLOCK" hint, 
is used in SQL Server to indicate that a SELECT statement should not wait for locks to be released on the data 
it's reading. It allows the SELECT operation to read data 
without acquiring shared locks on the tables involved in the query.

Here's a breakdown of its use and implications:

Concurrency: By using WITH (NOLOCK), you allow your SELECT statements to read data even if it's currently 
being modified (i.e., write operations are occurring). This can improve concurrency by reducing blocking, 
especially in high-transaction environments where write operations are frequent.

Performance: NOLOCK can potentially improve the performance of read operations because it doesn't wait for locks 
to be released. This can be particularly useful when you have large tables or long-running queries.

Risk of Dirty Reads: The main risk associated with WITH (NOLOCK) is that it can lead to dirty reads. 
A dirty read occurs when a SELECT statement reads data that has been modified but not yet committed. 
This means you might retrieve inconsistent or incorrect data.

Data Integrity: Using WITH (NOLOCK) sacrifices data consistency for improved performance and concurrency. 
Therefore, it's essential to weigh the trade-offs and consider the impact on your application's data integrity.

Alternative Isolation Levels: Instead of using NOLOCK, you might consider adjusting the transaction isolation 
level using other options such as READ COMMITTED or READ UNCOMMITTED. These isolation levels offer more control 
over the trade-offs between performance and data consistency.

In summary, WITH (NOLOCK) is a hint that can be used to improve concurrency and performance by allowing 
SELECT statements to read data without waiting for locks. However, it comes with the risk of dirty reads, 
so it should be used carefully, considering the specific requirements and constraints of your application.

