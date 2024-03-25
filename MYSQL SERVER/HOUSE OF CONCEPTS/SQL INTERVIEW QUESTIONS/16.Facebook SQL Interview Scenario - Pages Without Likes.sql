--CREATE Script
CREATE TABLE PageDetails
(
	PageId INT,
	PageName VARCHAR(100)
)

CREATE TABLE PageLikeDetails
(
	UserId INT,
	PageId INT,
	PageLikedOn DATETIME
)


--INSERT Script
INSERT PageDetails
VALUES
(800,'SQL Questions'),
(1265,'Data Analytics'),
(1560,'Data Integration'),
(1120,'Programming Challenges'),
(950,'Power BI Dashboard'),
(1001,'Azure Cloud Services')

INSERT PageLikeDetails
VALUES
(232,1120,'2022-05-20'),
(324,950,'2022-06-22'),
(564,800,'2022-07-10'),
(122,1120,'2022-08-15'),
(877,1265,'2022-09-06'),
(345,800,'2022-10-28'),
(544,950,'2022-11-18')
/*
--Scenario
Assume you are given the tables below about Facebook pages and page likes. Write a query to return the page IDs of all the Facebook pages that don't have any likes. 
The output should be in ascending order.
*/

--Solution 1 Using Left Join
SELECT A.PageId
FROM PageDetails A
LEFT JOIN PageLikeDetails B
ON A.PageId = B.PageId
WHERE B.PageId IS NULL
ORDER BY A.PageId ASC;

--Solution 2 Using NOT IN:
SELECT PageId
FROM PageDetails
WHERE PageId NOT IN (SELECT PageId FROM PageLikeDetails)
ORDER BY PageId ASC;

--Solution 3 Using NOT EXISTS:
SELECT PageId
FROM PageDetails A
WHERE NOT EXISTS (
    SELECT 1
    FROM PageLikeDetails B
    WHERE A.PageId = B.PageId
)
ORDER BY PageId ASC;

