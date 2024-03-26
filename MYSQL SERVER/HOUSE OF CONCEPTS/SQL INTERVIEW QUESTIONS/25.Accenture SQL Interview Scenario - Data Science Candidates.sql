--CREATE Script
CREATE TABLE candidates
(
	candidateId INT,
	technicalSkill VARCHAR(200)
)

--INSERT Script
INSERT candidates
VALUES
(432212,'SQL'),
(5465456,'PowerBI'),
(432212,'Word'),
(746354,'SQL'),
(5465456,'SQL'),
(432212,'PowerBI'),
(5465456,'Python'),
(746354,'PowerBI'),
(132234,'SQL'),
(132234,'Word'),
(89778,'SQL'),
(89778,'PowerBI'),
(89778,'Python'),
(89778,'Word')

--Scenario
--Given a table of candidates and their skills, your supervisor has asked you to find the candidates best suited for an open Data Science job. Write a query to find candidates who are proficient in Python, SQL, and PowerBI. Sort the output by candidate ID in ascending order.
--Note: There are no duplicates in the candidates table.

--Solution
SELECT candidateid FROM candidates 
WHERE technicalSkill in ('Python','PowerBI','SQL') 
GROUP BY candidateid HAVING COUNT(technicalSkill) = 3
ORDER BY  candidateId;

-- Query For my self [Group_Concat] --
SELECT candidateId, STRING_AGG(technicalSkill, ', ') AS technicalSkill_list
FROM candidates
WHERE technicalSkill IN ('Python', 'PowerBI', 'SQL')
GROUP BY candidateId
HAVING COUNT(technicalSkill) = 3;
