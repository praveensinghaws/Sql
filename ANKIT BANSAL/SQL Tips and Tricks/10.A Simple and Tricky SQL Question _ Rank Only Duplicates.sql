-- Switch to the DEMODB database
USE DEMODB;
-- Select all information about tables in the current database
SELECT *
FROM INFORMATION_SCHEMA.TABLES;

-- Create and populate the 'list' table
CREATE TABLE list (id VARCHAR(5));

INSERT INTO list VALUES
('a'), ('a'), ('b'), ('c'), ('c'), ('c'), ('d'), ('d'), ('e');

-- Select all rows from the 'list' table
SELECT * FROM list;



-- Create a Common Table Expression (CTE) named 'cte_dups'
-- Select 'id' from the 'list' table, grouping by 'id' and filtering only those with more than one occurrence
with cte_dups as (
  select id
  from list
  GROUP by id
  having COUNT(*) > 1
),

-- Create another CTE named 'cte_rank'
-- Select all columns from 'cte_dups' and use RANK() to assign a rank based on 'id' in ascending order
cte_rank as (
  select *,
         RANK() OVER (ORDER by id) as rnk
  from cte_dups
)

-- Select all columns from the 'list' table and a custom 'OUTPUT' column
-- Left join with 'cte_rank' on 'id' to get the rank information for duplicates
select l.*, 'DUP' + CAST(cr.rnk as VARCHAR(2)) as OUTPUT
from list l
left join cte_rank cr on l.id = cr.id;

