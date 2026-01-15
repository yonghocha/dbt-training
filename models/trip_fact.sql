WITH trips as (
    select 
        ride_id
        --,rideable_type
        ,date(to_timestamp(started_at)) as TRIP_DATE
        ,START_STATIO_ID AS START_STATION_ID
        ,END_STATION_ID
        ,MEMBER_CSUAL AS MEMBER_CASUAL
        ,timestampdiff(second, to_timestamp(started_at), to_timestamp(ENDED_AT)) trip_duration_seconds
    from {{ ref('stg_bike') }}
    where ride_id <> 'ride_id'
    
)
select *
from trips