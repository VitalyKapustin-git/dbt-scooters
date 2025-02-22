select
	company,
	count(model) as models,
	sum(scooters) as scooters
from {{ ref('scooters') }} s 
group by
	1