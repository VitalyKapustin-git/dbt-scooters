select 
	count("type" = 'cancel_search' or null) * 1. / count("type" = 'start_search' or null) * 100 as cancel_pct
from 
    {{ ref('events_full') }}