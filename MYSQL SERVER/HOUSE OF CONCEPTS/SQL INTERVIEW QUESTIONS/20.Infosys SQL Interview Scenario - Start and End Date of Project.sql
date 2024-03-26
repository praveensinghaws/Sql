--CREATE Script
CREATE TABLE TaskDetails
(
TaskId INT,
StartDate DATE,
EndDate DATE
)

--INSERT Script
INSERT TaskDetails
VALUES
(1,'2018-01-02','2018-01-03'),
(2,'2018-01-03','2018-01-04'),
(3,'2018-01-04','2018-01-05'),
(4,'2018-02-15','2018-02-16'),
(5,'2018-02-16','2018-02-17'),
(6,'2018-02-17','2018-02-18'),
(7,'2018-02-18','2018-02-19'),
(8,'2018-03-10','2018-03-11'),
(9,'2018-03-11','2018-03-12'),
(10,'2018-03-12','2018-03-13'),
(11,'2018-03-13','2018-03-14'),
(12,'2018-03-14','2018-03-15'),
(13,'2018-04-22','2018-04-23'),
(14,'2018-04-23','2018-04-24')

--Scenario
--Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. 
--If there is more than one project that have the same number of completion days, then order by the start date of the project.

--Solution 1 :
SELECT StartDate,MIN(EndDate) EndDate FROM
(SELECT A.StartDate FROM TaskDetails A
LEFT JOIN TaskDetails B
ON A.StartDate = B.EndDate
WHERE B.StartDate IS NULL ) X,
(SELECT A.EndDate FROM TaskDetails A
LEFT JOIN TaskDetails B
ON A.EndDate = B.StartDate
WHERE B.EndDate IS NULL ) Y
WHERE StartDate < EndDate
GROUP BY StartDate
ORDER BY DATEDIFF(DD,StartDate,MIN(EndDate)),StartDate ASC;

