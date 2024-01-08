select * from entries;

select name , floor, count(1) as Total_Visits 
from entries
group by name , floor; 