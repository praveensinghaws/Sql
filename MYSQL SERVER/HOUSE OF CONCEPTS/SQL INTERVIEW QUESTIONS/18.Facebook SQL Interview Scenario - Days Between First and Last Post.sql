--CREATE Script
CREATE TABLE PostDetails
(
	UserId INT,
	PostId INT,
	Content VARCHAR(1000),
	PostedOn DATETIME
)

--INSERT Script
INSERT PostDetails
VALUES
(778,596,'Hey! Happy New Year','2018-01-01'),
(856,662,'Going to watch snow in this trip','2018-02-14'),
(323,734,'Just watched an amazing movie','2018-03-20'),
(456,1020,'Awful day today','2018-04-12'),
(231,1126,'Anyone up for a coffee?','2018-05-16'),
(243,1263,'Summers are fun!','2018-06-18'),
(422,1269,'Summer holidays!','2018-06-20'),
(856,1452,'Celebrating 4th of July!','2018-07-04'),
(323,1694,'Amazing rains','2018-07-25'),
(455,1856,'Enjoying rainy weather','2018-08-28'),
(455,1967,'Autumn love','2018-09-06'),
(455,2014,'Happy Thanksgiving!','2018-10-25'),
(778,2298,'Countdown to new year','2018-12-31'),
(455,8955,'Loving the new laptop!','2019-01-25'),
(778,7851,'Started learning SQL today','2019-03-31')

--Scenario
--Given a table of Facebook posts, for each user who posted at least twice in 2018, write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021. 
--Output the user and number of the days between each user's first and last post.

--Solution 1: 
SELECT UserId,DATEDIFF(DD,MIN(PostedOn),MAX(PostedOn)) nbrOfDays
FROM PostDetails
WHERE DATEPART(YYYY,PostedOn)='2018'
GROUP BY UserId
HAVING COUNT(PostId)>1;

--Solution 2: 
SELECT 
    UserId, 
    DATEDIFF(DAY, MIN(PostedOn), MAX(PostedOn)) AS nbrOfDays
FROM PostDetails
WHERE YEAR(PostedOn) = 2018
GROUP BY UserId
HAVING COUNT(PostId) > 1;

--Solution 3: 
SELECT 
    UserId,
    DATEDIFF(DAY, FirstPostDate, LastPostDate) AS nbrOfDays
FROM (
    SELECT 
        UserId,
        MIN(PostedOn) AS FirstPostDate,
        MAX(PostedOn) AS LastPostDate,
        COUNT(PostId) AS PostCount
    FROM PostDetails
    WHERE YEAR(PostedOn) = 2018
    GROUP BY UserId
) AS Subquery
WHERE PostCount > 1;


