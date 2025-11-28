WITH CTE AS (

    select 
    t.*,
    w.*
    from {{ ref('trip_fact') }} as t
    left join {{ ref('daily_weather') }} as w
    on w.daily_weather = t.TRIP_DATE

    order by TRIP_DATE desc 

)
select *
from CTE