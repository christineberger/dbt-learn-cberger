with

source as (
    
    select * from {{ source('learn_stripe', 'refunds') }}
    
),

renamed as (
    
    select
        --ids
        id as refund_id,
        charge_id,
        
        --dimensions
        status as refund_status,
        currency as refund_currency,
        
        --dates
        created as refunded_at
    from source
    
)

select * from renamed