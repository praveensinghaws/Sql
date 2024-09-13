CREATE TABLE emp_tbl (id datetime, empid int);

INSERT INTO emp_tbl VALUES 
('2024-01-13 09:25:00', 10),
('2024-01-13 19:35:00', 10),
('2024-01-16 09:10:00', 10),
('2024-01-16 18:10:00', 10),
('2024-02-11 09:07:00', 10),
('2024-02-11 19:20:00', 10),
('2024-02-17 08:40:00', 17),
('2024-02-17 18:04:00', 17),
('2024-03-23 09:20:00', 10),
('2024-03-23 18:30:00', 10);

WITH cte AS (
    SELECT empid, 
           DAY(ID) AS Day,
           DATEDIFF(MINUTE, MIN(id), MAX(id)) / 60.0 AS Total_Hours
    FROM emp_tbl
    WHERE DATEPART(DW, id) IN (1, 7) -- 1 is Sunday and 7 is Saturday
    GROUP BY empid, DAY(ID)
)
SELECT empid, 
       ROUND(SUM(Total_Hours), 2) AS Total_Weekend_Working_Hours
FROM cte 
GROUP BY empid;