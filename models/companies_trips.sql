with company_trips
as
(
	select 
		s.company, 
		count(id) trips 
	from 
        {{ ref('trips_prep') }} tp 
	left join {{ ref('scooters') }} s 
		on s.hardware_id = tp.scooter_hw_id
	group by
		1
)
select 
	ct.company,
	ct.trips,
	c.scooters,
	ct.trips * 1. / c.scooters as trips_per_scooter
from company_trips ct
left join {{ ref('companies') }} c
    on ct.company = c.company