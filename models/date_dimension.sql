{{config(materialized='table')}}

WITH CTE AS (

    select 
    TRY_TO_TIMESTAMP(STARTED_AT) AS TIME_STARTED_AT, 
    DATE(TIME_STARTED_AT) AS DATE_STARTED_AT,
    HOUR(TIME_STARTED_AT) AS HOUR_STARTED_AT,

    {{day_of_week('STARTED_AT')}} AS DAY_OF_WEEK,

    {{get_season('STARTED_AT')}} AS SEASON,

    {{function1('STARTED_AT')}} AS TIME_CONSTANT


from {{ source('demo', 'bike') }}
where STARTED_AT != 'STARTED_AT'
)

select * 
from CTE