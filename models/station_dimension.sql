WITH BIKE AS (


    select 
    distinct 
    start_station_name, 
    start_station_id,
    start_latitude,
    start_longtitude, 

    from {{ source('demo', 'bike') }}
    where RIDE_ID != 'ride_id'  

)
select * 
from BIKE