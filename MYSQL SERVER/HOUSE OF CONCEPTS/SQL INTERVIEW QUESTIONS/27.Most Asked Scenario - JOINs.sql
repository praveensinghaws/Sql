--CREATE Script
CREATE TABLE tableA
(
	idValue INT
)
CREATE TABLE tableB
(
	idValue INT
)

--INSERT Script
INSERT tableA
VALUES
(1),
(1),
(2),
(2),
(3),
(3),
(null),
(4),
(null)

INSERT tableB
VALUES
(1),
(2),
(2),
(5),
(4),
(4),
(4),
(null)

--Scenario
--Given two tables, what will the number of records in the output using INNER , LEFT, RIGHT & FULL JOIN?

--Solution
SELECT * FROM tableA A
INNER JOIN tableB B
ON A.idValue = B.idValue

SELECT * FROM tableA A
LEFT JOIN tableB B
ON A.idValue = B.idValue

SELECT * FROM tableA A
RIGHT JOIN tableB B
ON A.idValue = B.idValue

SELECT * FROM tableA A
FULL JOIN tableB B
ON A.idValue = B.idValue