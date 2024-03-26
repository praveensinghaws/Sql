--CREATE Script
CREATE TABLE StudentDetails
(
	StudentId INT,
	StudentName VARCHAR(100)
)

CREATE TABLE FriendDetails
(
	StudentId INT,
	FriendId INT
)

CREATE TABLE PackageDetails
(
	StudentId INT,
	Package MONEY
)

--INSERT Script
INSERT StudentDetails
VALUES
(1,'Aman'),
(2,'Rahul'),
(3,'Riya'),
(4,'Karan'),
(5,'Kritika')
INSERT FriendDetails
VALUES
(1,2),
(2,3),
(3,4),
(4,5),
(5,1)
INSERT PackageDetails
VALUES
(1,18.50),
(2,12.60),
(3,16.52),
(4,14.52),
(5,19.50)

--Scenario
--You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). 
--Packages contains two columns: ID and Salary (offered salary in LPA).
--Write a query to output the names of those students whose best friends got offered a higher salary than them. 
--Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.

--Solution 1 :
SELECT A.StudentName
FROM StudentDetails A
INNER JOIN FriendDetails B
ON A.StudentId = B.StudentId
JOIN PackageDetails MyPackage
ON A.StudentId = MyPackage.StudentId
JOIN PackageDetails FriendPackage
ON B.FriendId = FriendPackage.StudentId
WHERE FriendPackage.Package > MyPackage.Package
ORDER BY FriendPackage.Package ASC;

--Solution 2 :
SELECT 
    s.StudentName 
FROM 
    StudentDetails s 
JOIN 
    FriendDetails f ON s.StudentId = f.StudentId
JOIN 
    PackageDetails my_pkg ON s.StudentId = my_pkg.StudentId
WHERE 
    EXISTS (
        SELECT 1
        FROM PackageDetails frnd_pkg
        WHERE f.FriendId = frnd_pkg.StudentId
        AND frnd_pkg.Package > my_pkg.Package
    )
ORDER BY 
    my_pkg.Package ASC;
