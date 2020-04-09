with 

source as (
    
    select * from {{ source('stripe', 'payment') }}
    
),

renamed as (
    
    select
        id as payment_id,
        "orderID" as order_id,
        "paymentMethod" as payment_method,
        amount,
        created,
        _batched_at
    from source
    
)

select * from renamed
