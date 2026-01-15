{% macro get_season(x)%}
    CASE WHEN MONTH(TO_TIMESTAMP({{x}})) in (12,1,2)
        THEN 'WINTER'
        WHEN MONTH(TO_TIMESTAMP({{x}})) in (3,4,5)
        THEN 'SPRING'
        WHEN MONTH(TO_TIMESTAMP({{x}})) in (6,7,8)
        THEN 'SUMMER'
        ELSE 'AUTUMN' 
    END    
{% endmacro %}

{% macro day_type(x)%}
    case when dayofweek(to_timestamp({{x}})) IN (0, 6) then 'WEEKEND'
        ELSE 'BUSIENSSDAY'
    END    
{% endmacro %}