with

source as (
    
    select * from {{ source('learn_stripe', 'charges') }}
    
),

renamed as (
    
    select
        --ids
        id as charge_id,
        
        
        --dimensions
        currency,
        description,
        failure_code,
        failure_message,
        fraud_details,
        livemode,
        
        captured,
        paid,
        refunded,
        status,
        
        --dates
        created
    
        --! Columns that are useless:
        -- object
    from source
    
)

select * from renamed