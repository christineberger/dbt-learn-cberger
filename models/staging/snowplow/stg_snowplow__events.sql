with

source as (
    
    select * from {{source('snowplow','event')}}
    
)

select * from source