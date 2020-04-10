{{config(
    materialized = 'incremental',
    unique_key = 'page_view_id'
)}}

with events as (
    
    select * from {{ ref('stg_snowplow__events') }}
    {% if is_incremental() %}
        where collector_tstamp >= (select dateadd('day', 3, max(max_collector_tstamp)) from {{ this }})
    {% endif %}
    
),

page_views as (
    
    select
        domain_sessionid as session_id,
        domain_userid as anonymous_user_id,
        web_page_context.value:data.id::varchar as page_view_id,
        page_url,
        count(*) * 10 as approx_time_on_page,
        min(derived_tstamp) as page_view_start,
        max(collector_tstamp) as max_collector_tstamp
    from events,
    lateral flatten (input => parse_json(contexts):data) web_page_context
    group by 1,2,3,4
    
),

indexed as (
    
    select *,
        row_number() over (
            partition by session_id
            order by page_view_start
        ) as page_view_in_session_index
    from page_views
    
)
select * from indexed