with
age_cte
as
(
	select 
		t.started_at::date as date,
		date_part('year', justify_interval(t.started_at - u.birth_date)) as age,
		count(*) as cn 
	from scooters_raw.trips t 
	inner join scooters_raw.users u 
		on u.id = t.user_id 
	group by t.started_at::date, date_part('year', justify_interval(t.started_at - u.birth_date)) 
)
select age, avg(cn) as day_avg_cn from age_cte
group by age
;