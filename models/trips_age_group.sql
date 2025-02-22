select 
	ag."group" as age_group,
	count(*) as trips,
	sum(price_rub) as revenue_rub
from 
	{{ ref('trips_user') }} tu
left join {{ ref('age_groups') }} ag 
	on tu.age >= ag.age_start and tu.age <= ag.age_end 
group by ag."group" 