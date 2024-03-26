--CREATE Script
CREATE TABLE FunctionDetails
(
	X INT,
	Y INT
)

--INSERT Script
INSERT FunctionDetails
VALUES
(45,60),
(50,75),
(60,45),
(96,44),
(44,96),
(75,50),
(22,88),
(88,22),
(15,96),
(90,15),
(40,40),
(40,40),
(70,70)


--Scenario
--You are given a table, Functions, containing two columns: X and Y.
--Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.
--Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.

--Solution 1 :
SELECT F1.X,F1.Y FROM FunctionDetails F1
INNER JOIN FunctionDetails F2
ON F1.X = F2.Y
AND F1.Y = F2.X
WHERE F1.X <> F1.Y
AND F1.X<F1.Y
UNION
SELECT X,Y FROM FunctionDetails
WHERE X = Y
GROUP BY X,Y
HAVING COUNT(1)>1
ORDER BY X ASC;


--Solution 2 :

SELECT * from FunctionDetails;  



