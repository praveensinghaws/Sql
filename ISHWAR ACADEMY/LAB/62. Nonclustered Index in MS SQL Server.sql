--  Nonclustered Index in MS SQL Server

CREATE NONCLUSTERED INDEX IDX_emp_name
ON employee(NAME ASC);


SELECT * FROM EMPLOYEE WHERE NAME = 'MIKE';