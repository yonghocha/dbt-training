WITH daily_weather AS (
    SELECT 
        date(time) as daily_weather
        ,weather
        ,temp
        ,pressure
        ,humidity
        ,clouds
    FROM {{ source('demo', 'weather') }}
--    LIMIT 10
), daily_weather_agg as(
    select
        daily_weather
        ,weather
        ,round(avg(temp), 2) as avg_temp
        ,round(avg(pressure), 2) as avg_pressure
        ,round(avg(humidity), 2) as avg_humidity
        ,round(avg(clouds), 2) as avg_clouds
    from 
        daily_weather
    group by 
        1, 2
    qualify row_number() over (partition by daily_weather order by count(weather) desc)  = 1
)
SELECT *
FROM daily_weather_agg
--where daily_weather = '2016-09-07'
order by 1, 2