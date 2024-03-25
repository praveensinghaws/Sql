--CREATE Script

CREATE TABLE [dbo].[ProductReviews](
	[ReviewId] [int] NULL,
	[UserId] [int] NULL,
	[SubmissionDate] [datetime] NULL,
	[ProductId] [int] NULL,
	[StarRating] [int] NULL
)
GO

--INSERT Script
INSERT [dbo].[ProductReviews] ([ReviewId], [UserId], [SubmissionDate], [ProductId], [StarRating]) 
VALUES (3123, 546, CAST(N'2022-07-23T00:00:00.000' AS DateTime), 80002, 4)
,(2131, 342, CAST(N'2022-11-22T00:00:00.000' AS DateTime), 66332, 4)
,(6776, 987, CAST(N'2022-12-15T00:00:00.000' AS DateTime), 66332, 4)
,(4523, 675, CAST(N'2022-05-06T00:00:00.000' AS DateTime), 78754, 2)
,(6541, 112, CAST(N'2022-01-10T00:00:00.000' AS DateTime), 80002, 3)
,(4213, 334, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 66332, 2)
,(1211, 709, CAST(N'2022-11-26T00:00:00.000' AS DateTime), 66332, 3)
,(5334, 108, CAST(N'2022-01-15T00:00:00.000' AS DateTime), 80002, 4)
,(1234, 709, CAST(N'2022-07-20T00:00:00.000' AS DateTime), 80002, 3)
,(1111, 108, CAST(N'2022-05-08T00:00:00.000' AS DateTime), 78754, 3)
,(5643, 709, CAST(N'2022-07-19T00:00:00.000' AS DateTime), 78754, 3)
GO

--Scenario 9
--Given the reviews table, write a query to get the average stars for each product every month.
--The output should include the month in numerical value, product id, and average star rating rounded to two decimal places. 
--Sort the output based on month followed by the product id.

--Solution 1:

SELECT
    DATEPART(MM, SubmissionDate) AS MonthValue,
    ProductId,
    CAST(AVG(CAST(StarRating AS DECIMAL(5,2))) AS DECIMAL(5,2)) AS AvgStarRating
FROM
    ProductReviews
GROUP BY 
    DATEPART(MM, SubmissionDate), 
    ProductId
ORDER BY 
    MonthValue, 
    ProductId;

--Solution 2:
    SELECT 
    MONTH(SubmissionDate) AS MonthValue, 
    ProductId,
    CAST(AVG(CAST(StarRating AS DECIMAL(5,2))) AS DECIMAL(5,2)) AS AvgStarRating
FROM 
    ProductReviews
GROUP BY 
    MONTH(SubmissionDate), 
    ProductId
ORDER BY 
    MonthValue, 
    ProductId;




