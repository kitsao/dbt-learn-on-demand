with orders as  (
    select * from {{ ref('stg_orders' )}}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

order_payments as (
    select
        order_id,
        sum(case when order_status = 'success' then total end) as total

    from payments
    group by order_id
),

final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce(order_payments.total, 0) as total_amount

    from orders
    left join order_payments using (order_id)
)

select * from final