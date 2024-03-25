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
(1002,'Mathew Peterson',1123,'2017-07-12','New York'),
(1003,'Jessica Holmes',2653,'2016-12-22','Mexico City'),
(1004,'Raghav Bhatia',3363,'2017-05-14','New Delhi'),
(1005,'John Ford',1120,'2018-11-23','London'),
(1006,'Sharon Alba',1003,'2020-01-09','Porto'),
(1007,'Ivan Gilbert',1562,'2010-08-17','Melbourne'),
(1008,'T.N Mahesh',1985,'2015-03-06','Bangalore'),
(1009,'Linda Smith',1003,'2017-09-20','Brisbane')

INSERT INTO EmployeeSalary
(EmpId,Project,FixedSalary,VariableSalary)
VALUES
(1001,'P1',25000,6000),
(1003,'P1',15000,2000),
(1004,'P4',45000,18000),
(1006,NULL,	12000,	1000),
(1007,'P2',30000,	11500),
(1008,'P2',17000,	2800),
(1009,NULL,8000,	1000)
--Scenario 2
----Write a SQL query to fetch fullname and joining date of all the employees who are not working on any project.


--Solution
SELECT A.FullName,A.JoiningDate 
FROM EmployeeDetails A WITH(NOLOCK)
INNER JOIN EmployeeSalary B WITH(NOLOCK)
ON A.EmpId = B.EmpId
WHERE B.Project IS NULL