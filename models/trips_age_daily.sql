select
    date,
    age,
    count(*) as trips,
    sum(price_rub) as revenue_rub
from
    {{ ref('trips_user') }}
group by
    1,
    2
