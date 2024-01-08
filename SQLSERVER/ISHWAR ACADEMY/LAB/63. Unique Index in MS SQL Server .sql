--  Unique Index in MS SQL Server 

USE INDEXDB;
DROP TABLE IF EXISTS department;
create table department
(
	did int primary key,
	dname varchar(50),
	dloc varchar(50)
);

INSERT INTO department VALUES 
(2, 'SALES', 'MUMBAI'),
(1, 'ACCOUNTS' , 'PUNE');

-- Query 1
SELECT * FROM department WHERE dname = 'SALES';

-- Query 2
ALTER TABLE department ADD CONSTRAINT UQ_dept_dname UNIQUE (dname);

-- Query 3
ALTER TABLE department DROP CONSTRAINT PK_dept_did;

-- Query 4
ALTER TABLE DEPARTMENT ADD CONSTRAINT PK_dept_did PRIMARY KEY(DID);

-- Query 5
CREATE UNIQUE NONCLUSTERED INDEX IDX_DEPT_DLOC ON DEPARTMENT(DLOC);

-- Query 6
SELECT * FROM department WHERE dname = 'SALES';

