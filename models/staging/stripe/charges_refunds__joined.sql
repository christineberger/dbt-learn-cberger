with

charges as (
    
    select * from {{ ref('stg_stripe__learn_charges') }}
    
),

refunds as (
    
    select * from {{ ref('stg_stripe__learn_refunds') }}
    
),

joined as (
    
    select
        charges.*,
        refunds.refund_id,
        refunds.refund_status,
        refunds.refund_currency,
        refunds.refunded_at
    from charges
    left join refunds
        on charges.charge_id = refunds.charge_id
        
)

select * from joined