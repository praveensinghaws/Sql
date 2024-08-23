DROP TABLE IF EXISTS FOOTER;
CREATE TABLE FOOTER 
(
	id 			INT PRIMARY KEY,
	car 		VARCHAR(20), 
	length 		INT, 
	width 		INT, 
	height 		INT
);

INSERT INTO FOOTER VALUES (1, 'Hyundai Tucson', 15, 6, NULL);
INSERT INTO FOOTER VALUES (2, NULL, NULL, NULL, 20);
INSERT INTO FOOTER VALUES (3, NULL, 12, 8, 15);
INSERT INTO FOOTER VALUES (4, 'Toyota Rav4', NULL, 15, NULL);
INSERT INTO FOOTER VALUES (5, 'Kia Sportage', NULL, NULL, 18); 

SELECT * FROM FOOTER;

-- ****************************************** Solution 1: ******************************************
WITH cte AS

		(SELECT *,
			SUM(CASE WHEN car IS NOT NULL THEN 1 ELSE 0 END) OVER(ORDER BY id) AS car_segment,
			SUM(CASE WHEN length IS NOT NULL THEN 1 ELSE 0 END) OVER(ORDER BY id) AS length_segment,
			SUM(CASE WHEN width IS NOT NULL THEN 1 ELSE 0 END) OVER(ORDER BY id) AS width_segment,
			SUM(CASE WHEN height IS NOT NULL THEN 1 ELSE 0 END) OVER(ORDER BY id) AS height_segment
			
		FROM footer)
	
	SELECT 
		first_value(car) OVER(PARTITION BY car_segment ORDER BY id) as car,
		first_value(length) OVER(PARTITION BY length_segment ORDER BY id) as length,
		first_value(width) OVER(PARTITION BY width_segment ORDER BY id) as width,
		first_value(height) OVER(PARTITION BY height_segment ORDER BY id) as height
	FROM cte
	ORDER BY id DESC
	LIMIT 1;

-- ****************************************** Solution 2: ******************************************

 SELECT * 
	FROM
		(SELECT car FROM footer WHERE car IS NOT NULL ORDER BY id DESC LIMIT 1) car
		CROSS JOIN (SELECT length FROM footer WHERE length IS NOT NULL ORDER BY id DESC LIMIT 1) length
		CROSS JOIN (SELECT width FROM footer WHERE width IS NOT NULL ORDER BY id DESC LIMIT 1) width
		CROSS JOIN (SELECT height FROM footer WHERE height IS NOT NULL ORDER BY id DESC LIMIT 1) height;