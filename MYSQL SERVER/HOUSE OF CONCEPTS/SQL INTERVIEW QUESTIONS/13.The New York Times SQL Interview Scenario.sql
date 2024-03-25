--CREATE Script
CREATE TABLE ViewershipDetails
(
	UserId INT,
	DeviceType VARCHAR(100),
	ViewTime DATETIME
)

--INSERT Script
INSERT ViewershipDetails
VALUES
(168,'Phone','2022-05-12'),
(135,'Tablet','2022-07-10'),
(285,'Laptop','2022-08-09'),
(269,'Laptop','2022-02-05'),
(278,'Phone','2022-04-22'),
(452,'Tablet','2022-05-19'),
(489,'Laptop','2022-06-11'),
(489,'Tablet','2022-05-15'),
(596,'Laptop','2022-08-20'),
(602,'Phone','2022-10-25')
/*
--Scenario
The given table contains information on viewership by device type and “mobile” is defined as the sum of tablet and phone viewership numbers. 
Write a query to compare the viewership on laptops versus mobile devices in the format of "LaptopViews" and "MobileViews".
*/

--Solution
SELECT 
    SUM(CASE WHEN DeviceType = 'Laptop' THEN 1 ELSE 0 END)LaptopViews,
    SUM(CASE WHEN DeviceType in ('Phone','Tablet') THEN 1 ELSE 0 END)MobileViews
FROM ViewershipDetails;

