with cte as (
    select
        to_timestamp(started_at) as started_at
        ,date(to_timestamp(started_at)) as date_started_at
        ,hour(to_timestamp(started_at)) as hour_started_at
        ,{{day_type('started_at')}} AS DAY_TYPE
        ,{{get_season('started_at')}} AS STATION_OF_YEAR
    from 
        {{ source('demo', 'bike') }}
    where 
        started_at != 'started_at' 
)
select * 
from cte
