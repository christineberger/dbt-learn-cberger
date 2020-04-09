with

--  References -----------------------------------------
orders as (
    
    select * from {{ ref('stg_orders') }}
    
),

payments as (
    
    select * from {{ ref('stg_payments') }}
    
),

--  Joined -----------------------------------------
joined as (
    
    select 
        orders.customer_id,
        orders.order_id,
        payments.payment_id,
        payments.amount
    from orders
    left join payments 
        on orders.order_id = payments.order_id
        
)

select * from joined