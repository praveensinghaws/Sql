--CREATE Script
CREATE TABLE MessageDetails
(
	MessageId INT,
	SenderId INT,
	ReceiverId INT,
	Content VARCHAR(1000),
	MessageSentDate DATETIME
)

--INSERT Script
INSERT MessageDetails
VALUES
(102,5950,5822	,'Are you available for 15 minutes?','2022-08-05'),
(145,7853,4322	,'That meeting is scheduled for next week.','2022-08-10'),
(214,5950,4365	,'Still waiting for client approval.','2022-08-12'),
(334,7596,4225	,'It would require changes in the code.','2022-06-15'),
(456,4225,7354	,'Can we have a quick call?','2022-08-17'),
(596,4225,5822	,'Everyone has joined.','2022-08-19'),
(859,9632,5950	,'Check this candidate''s profile','2022-07-20'),
(963,7596,5822	,'Thank you!','2022-08-22'),
(1025,4225,7596	,'Your efforts are appreciated!','2022-08-23'),
(1156,4225,7853	,'Will be sending this by EOD','2022-08-24'),
(1269,9632,4225	,'Schedule it for tomorrow','2022-10-15')
/*
--Scenario
Write a query to find the top 2 power users who sent the most messages on Microsoft Teams in August 2022. 
Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending count of the messages.

Assumption:

No two users has sent the same number of messages in August 2022.
*/

-- SOLUTION 1:
SELECT TOP 2
    SenderId,
    COUNT(MessageId) AS nbrOfMessages
FROM
    MessageDetails
WHERE
    DATEPART(MM, MessageSentDate) = 8 AND 
    DATEPART(YYYY, MessageSentDate) = 2022
GROUP BY
    SenderId
ORDER BY
    nbrOfMessages DESC;

-- SOLUTION 2:

SELECT
    SenderId,
    COUNT(MessageId) AS NoOfMessages
FROM
    MessageDetails
WHERE
    MONTH(MessageSentDate) = 8 AND 
    YEAR(MessageSentDate) = 2022
GROUP BY
    SenderId 
ORDER BY
    NoOfMessages DESC
OFFSET 0 ROWS FETCH NEXT 2 ROWS ONLY;

