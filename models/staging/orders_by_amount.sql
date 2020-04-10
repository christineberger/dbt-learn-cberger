-- Setting a payment methods variable using the dbt utils macro get_column_values
-- https://github.com/fishtown-analytics/dbt-utils/blob/master/macros/sql/get_column_values.sql
{%- set payment_methods = dbt_utils.get_column_values(
    table=ref('stg_stripe__payments'),
    column='payment_method'
) -%}

-- Query -----------------------------------------------------------------------
with 

payments as (
    
    select * from {{ ref('stg_stripe__payments') }}
    
),

pivoted as (
    select
        order_id,
        {%- for payment_method in payment_methods %}
            sum(
                case 
                    when payment_method = '{{payment_method}}' 
                    then amount_in_usd 
                end
            ) as {{payment_method}}_amount
            
            {%- if not loop.last %},{% endif -%}
        {% endfor %}
    from payments
    group by 1
)

select * from pivoted