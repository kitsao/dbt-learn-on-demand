select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status as order_status,
    amount / 100 as total

from {{ source('stripe', 'payment') }}