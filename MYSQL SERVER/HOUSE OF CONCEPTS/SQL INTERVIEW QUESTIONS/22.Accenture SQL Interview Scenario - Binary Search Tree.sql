--CREATE Script
CREATE TABLE BinarySearchTree
(
Node INT,
Parent INT
)

--INSERT Script
INSERT BinarySearchTree
VALUES
(1,5),
(2,5),
(3,6),
(4,6),
(5,7),
(6,7),
(7,NULL)

--Scenario
--You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.
--Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

--Root: If node is root node.
--Leaf: If node is leaf node.
--Inner: If node is neither root nor leaf node.

--Solution 1:

SELECT Node,
	CASE 
		WHEN Parent IS NULL THEN 'ROOT'
		WHEN Node IN (SELECT distinct Parent FROM BinarySearchTree) THEN 'Inner'
		ELSE 'Leaf'
		END [TYPE]

FROM BinarySearchTree
ORDER BY Node ASC;

--Solution 2:

SELECT b.Node,
       CASE 
           WHEN b.Parent IS NULL THEN 'Root'
           WHEN EXISTS (SELECT 1 FROM BinarySearchTree WHERE Parent = b.Node) THEN 'Inner'
           ELSE 'Leaf'
       END AS [Type]
FROM BinarySearchTree b
ORDER BY b.Node ASC;

