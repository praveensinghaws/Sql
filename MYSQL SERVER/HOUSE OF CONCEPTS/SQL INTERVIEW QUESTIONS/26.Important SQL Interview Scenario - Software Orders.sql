--CREATE Script
CREATE TABLE orders
(
orderId	INT,
userId	INT,
price MONEY,
quantity	INT,
status	VARCHAR(20),
orderedOn datetime
)

CREATE TABLE users
(
userId	INT,
city	VARCHAR(20),
email	VARCHAR(100),
registeredOn	datetime
)

--INSERT Script
INSERT users
VALUES
(4352,'Mumbai','hmahesh@hdfc.com','2022-08-31'),
(7657,'Delhi','matt@gmail.com','2023-02-16'),
(3425,'Lucknow','paul@axisbank.com','2022-10-08'),
(7876,'Delhi','parul@gmail.com','2022-04-10'),
(21334,'Bangalore','ritika@gmail.com','2022-05-14'),
(786709,'Chennai','parul@icici.com','2022-07-20'),
(65343,'Mumbai','jaideep@canarabank.com','2023-01-31')

INSERT orders
VALUES
(674656,3425,7546.90,8,'cancelled','2022-10-12'),
(454242,65343,6355.10,20,'completed','2022-10-12'),
(4642,21334,5454.10,15,'completed','2022-10-12'),
(8978,786709,2138.10,14,'completed','2022-10-12'),
(132345,4352,5587.10,11,'completed','2022-10-12'),
(7857,7657,8768.10,9,'cancelled','2022-10-12'),
(968875,21334,5854.10,2,'completed','2022-10-12'),
(64736,65343,5688.10,8,'completed','2022-10-12')


--Scenario
--You are given twp tables containing information on Software orders and users. 
--Write a query to list the top three cities that have the most completed orders and their number of orders in descending order.

--Solution
SELECT TOP 3 city,COUNT(*) noOfOrders 
FROM users A
JOIN orders B
ON A.userId = B.userId
WHERE B.status='completed'
GROUP BY A.city
ORDER BY noOfOrders DESC