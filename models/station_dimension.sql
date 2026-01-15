WITH BIKE AS (
    SELECT
        distinct
        START_STATIO_ID AS STATION_ID
        ,START_STATION_NAME AS STATION_NAME
        ,START_LAT
        ,START_LNG
    FROM {{ source('demo', 'bike') }}
    where ride_id <> 'ride_id'
    LIMIT 10
)
select *
from bike
