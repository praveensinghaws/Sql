--CREATE Script
CREATE TABLE employees
(
	empId INT,
	empName VARCHAR(100)
)

CREATE TABLE projects
(
	projectId INT,
	empId INT
)


--INSERT Script
INSERT [dbo].[employees] ([empId], [empName]) VALUES (23123, N'Radhika')
,(6754, N'Anuj')
,(8785, N'Amit')
,(4354, N'Priyanka')
,(78566, N'Kritika')
,(4565, N'Aparna')
,(8889, N'Komal')

INSERT [dbo].[projects] ([projectId], [empId]) 
VALUES (879854, 23123)
,(785614, 6754)
,(456874, 8785)
,(123546, 4354)
,(897413, 78566)
,(879654, 4565)
,(987321, 78566)
,(654312, 4354)
,(213546, 6754)
,(354644, 23123)
,(187651, 8785)
,(243454, 78566)
,(111344, 4354)
,(555543, 6754)
,(677532, 23123)
,(463532, 6754)
,(889576, 8785)
,(995433, 23123)
,(111232, 78566)
,(777788, 23123)
,(666666, 78566)
,(121212, 23123)
,(222258, 78566)

--Scenario
--Amanda asked her employees to give the consolidated report for the projects they have worked on. Write a query to print the empId, name, and the total number of projects worked on by each employee. Sort your results by the total number of projects in descending order. If more than one employee worked on the same number of projects, then sort the result by empId. If more than one employee worked on the same number of projects and the count is less than the maximum number of projects worked on, then exclude those employees from the result.

--Solution
WITH projectsCountCTE AS
(
SELECT A.empId,A.empName,COUNT(DISTINCT projectId) noOfProjects FROM employees A
LEFT JOIN projects B
ON A.empId = B.empId
GROUP BY A.empId,A.empName
), projectsFrequencyCTE AS
(
SELECT empId,empName,noOfProjects,COUNT(empId) OVER (PARTITION BY noOfProjects) AS projectsFrequency
FROM projectsCountCTE
)

SELECT empId,empName,noOfProjects
FROM projectsFrequencyCTE
WHERE projectsFrequency < 2 OR (noOfProjects = (SELECT MAX(noOfProjects) FROM projectsFrequencyCTE))
ORDER BY noOfProjects DESC, empId