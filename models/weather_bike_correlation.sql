with cte as (
    select 
        t.*
    from 
        {{ ref('trip_fact') }} as t
)
select *
from cte