SELECT * from employee;

-- ===================================================
-- CREATE VIEWS

CREATE VIEW [EMPAGE MORE30] AS 
SELECT firstname , age FROM employee WHERE AGE >30;


SELECT * FROM [EMPAGE MORE30];



CREATE VIEW [SALARY ABOVE 60000] AS 
SELECT firstname , age , SALARY  FROM employee WHERE SALARY >60000;


SELECT * FROM [SALARY ABOVE 60000];


DROP VIEW [SALARY ABOVE 60000];
    
-- ===================================================

DROP TABLE EMPAGEABOVE30

SELECT * FROM EMPNEW;

DROP DATABASE AMITDB;