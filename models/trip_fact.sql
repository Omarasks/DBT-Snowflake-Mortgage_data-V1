WITH TRIPS AS (

    select 
    RIDE_ID, 
    RIDEABLE_TYPE,
    DATE(STARTED_AT) AS TRIP_DATE,
    START_STATION_NAME, 
    END_STATION_NAME,
    MEMBER_OR_CASUAL, 
    TIMESTAMPDIFF(SECOND, STARTED_AT, ENDED_AT) AS TIME_DURATION


    from {{ source('demo', 'bike') }} 
    where RIDE_ID != 'ride_id'

    limit 10
)
select *
from TRIPS