--CREATE Script
CREATE TABLE [dbo].[job_listings](
	[job_id] [int] NULL,
	[company_id] [int] NULL,
	[title] [varchar](200) NULL,
	[job_desc] [varchar](1000) NULL
)

--INSERT Script
INSERT [dbo].[job_listings] 
([job_id], [company_id], [title], [job_desc]) 
VALUES (234, 435, N'SQL Developer', N'SQL Developers are responsible for developing SQL databases and writing applications to interface with SQL databases. Development often consists of designing tables, storing procedures, views and functions.')
,(526, 996, N'Business Analyst', N'Business analysts assess how organisations are performing and help them improve their processes and systems. They conduct research and analysis in order to come up with solutions to business problems and help to introduce these solutions to businesses and their clients.')
,(345, 774, N'Business Analyst', N'Business analysts assess how organisations are performing and help them improve their processes and systems. They conduct research and analysis in order to come up with solutions to business problems and help to introduce these solutions to businesses and their clients.')
,(567, 435, N'SQL Developer', N'SQL Developers are responsible for developing SQL databases and writing applications to interface with SQL databases. Development often consists of designing tables, storing procedures, views and functions.')
,(445, 122, N'Data Analyst', N'Data analyst collects and stores data on sales numbers, market research, logistics, linguistics, or other behaviors. They bring technical expertise to ensure the quality and accuracy of that data, then process, design, and present it in ways to help people, businesses, and organizations make better decisions.')
,(858, 111, N'TAG Manager', N'The Manager will work agency teams and partners through the transformation of digital marketing strategies and operationalization of key functions, balancing learning and innovation with efficiency and automation. This role must be able to solve business issues through data, creativity and human-insights.')
,(1001, 897, N'Front-End Developer', N'A Front-End Developer is responsible for developing new user-facing features, determining the structure and design of web pages, building reusable codes, optimizing page loading times, and using a variety of markup languages to create the web pages.')
,(1236, 122, N'Data Analyst', N'Data analyst collects and stores data on sales numbers, market research, logistics, linguistics, or other behaviors. They bring technical expertise to ensure the quality and accuracy of that data, then process, design, and present it in ways to help people, businesses, and organizations make better decisions.')
,(225, 111, N'TAG Manager', N'The Manager will work agency teams and partners through the transformation of digital marketing strategies and operationalization of key functions, balancing learning and innovation with efficiency and automation. This role must be able to solve business issues through data, creativity and human-insights.')
/*
--Scenario 8
Assume you are given the table below that shows job postings for all companies on the LinkedIn platform. 
Write a query to get the number of companies that have posted duplicate job listings.

Clarification:
Duplicate job listings refer to two jobs at the same company with the same title and description.

--Solution
*/

-- Using a CTE to Identify Duplicate Listings First:

WITH cte_duplicate_listings AS (
    SELECT company_id
    FROM job_listings
    GROUP BY company_id, title, job_desc
    HAVING COUNT(job_id) > 1
)
SELECT COUNT(DISTINCT company_id) AS co_with_duplicate_listings
FROM cte_duplicate_listings;


-- Directly Counting Duplicate Listings with Subquery:
SELECT COUNT(DISTINCT company_id) AS co_with_duplicate_listings
FROM (
    SELECT company_id, title, job_desc, COUNT(job_id) AS cnt
    FROM job_listings
    GROUP BY company_id, title, job_desc
    HAVING COUNT(job_id) > 1
) x;
