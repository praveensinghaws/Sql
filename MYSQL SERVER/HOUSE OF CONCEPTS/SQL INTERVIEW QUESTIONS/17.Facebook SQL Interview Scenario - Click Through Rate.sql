--CREATE Script
CREATE TABLE EventDetails
(
	AppId INT,
	EventType VARCHAR(100),
	OccuredOn DATETIME
)

--INSERT Script
INSERT EventDetails
VALUES
(236,'impression','2022-02-06'),
(236,'click','2022-02-10'),
(236,'impression','2022-03-16'),
(768,'impression','2022-03-20'),
(768,'click','2022-03-26'),
(902,'impression','2022-05-22'),
(768,'impression','2022-03-29'),
(902,'click','2022-06-06'),
(902,'impression','2022-06-28'),
(902,'click','2022-07-18')

--Scenario
--You are given an events table on app analytics. Write a query to get the app’s click-through rate (CTR %) in 2022.
--Output the results in percentages rounded to 2 decimal places.
--Notes:
--Percentage of click-through rate = 100.0 * Number of clicks / Number of impressions
--To avoid integer division, you should multiply the click-through rate by 100.0, not 100.

--Solution 1 :
SELECT AppId,
CAST(((CAST(SUM(CASE WHEN EventType='click' THEN 1 ELSE 0 END)
AS DECIMAL(5,2))
/
CAST(SUM(CASE WHEN EventType='impression' THEN 1 ELSE 0 END) 
AS DECIMAL(5,2))) * 100) AS DECIMAL(5,2))
ctr
FROM EventDetails
WHERE OccuredOn BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY AppId;

--Solution 2 :
WITH cte AS (
    SELECT 
        AppId,
        SUM(CASE WHEN EventType = 'click' THEN 1 ELSE 0 END) AS click_cnt,
        SUM(CASE WHEN EventType = 'impression' THEN 1 ELSE 0 END) AS impression_cnt
    FROM EventDetails
    WHERE OccuredOn BETWEEN '2022-01-01' AND '2022-12-31'
    GROUP BY AppId
)
SELECT 
    AppId, 
    CAST((100.0 * click_cnt / NULLIF(impression_cnt, 0)) AS DECIMAL(5,2)) AS ctr_pct
FROM cte;
