SELECT * FROM job_positions;
SELECT * FROM job_employees;

--- SOLUTION 1 using Generate_Series function ---
	select p.title, p.groups, p.levels, p.payscale, coalesce(e.name,'Vacant') as employee_name
	from job_positions p
	cross join generate_series(1,totalpost)
	left join (select *, row_number() over(partition by position_id order by id) as rn 
			   from job_employees) e on e.rn=generate_series and e.position_id = p.id;
 --- SOLUTION 2 using Recursion--- 
	with recursive cte as
		(select p.id, p.title, p.groups, p.levels, p.payscale, '' as employee_name, p.totalpost 
		from job_positions p 
		union all
		select id, title, groups, levels, payscale, '' as employee_name, (totalpost - 1) as totalpost
		from cte 
		where totalpost > 1)
	select title, groups, levels, payscale, coalesce(e.name,'Vacant') as employee_name
	from cte
	left join (select *, row_number() over(partition by position_id order by id) as rn 
			   from job_employees) e on e.rn=cte.totalpost and e.position_id = cte.id
	order by groups,totalpost;
