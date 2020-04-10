with

source as (
    
    select * from {{ source('ticket_tailor', 'orders') }}
    
),

renamed as (
    
    select
        --ids
        event_id,
        order_id,
        transaction_id,
        
        --,dimensions
        event_name,
        order_cancelled,
        order_items,
        transaction_type,
        
        tax_amount,
        total_paid,
        tickets_purchased,
        
        tickets_checked_in,
        
        --,dates
        event_end,
        event_start,
        order_date
    from source
    
)

select * from renamed