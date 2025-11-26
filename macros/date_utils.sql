-- MACRO FOR TIME CONSTANT
{% macro function1(x)%} 

CASE WHEN TO_TIMESTAMP({{x}}) < CURRENT_DATE THEN 'PAST'
ELSE 'FUTURE'
END 

{% endmacro %}

-- MACRO FOR GET SEASONS
{% macro get_season(x) %}
CASE WHEN MONTH(TO_TIMESTAMP({{x}})) IN (12,1,2 )
    THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (3,4,5)
    THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (6,7,8)
    THEN 'SUMMER'
    ELSE 'AUTUMN'
    END 
{% endmacro %}

-- MACRO FOR DAY OF WEEK
{% macro day_of_week(x) %}

CASE WHEN DAYNAME(TO_TIMESTAMP({{x}})) IN ('Sat', 'Sun')
    THEN 'WEEKEND'
    ELSE 'BUSINESS DAY'
    END 

{% endmacro %}