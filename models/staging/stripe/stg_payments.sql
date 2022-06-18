select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status as order_status,
    {{ cents_to_dollars('amount', 3) }} as total

from {{ source('stripe', 'payment') }}