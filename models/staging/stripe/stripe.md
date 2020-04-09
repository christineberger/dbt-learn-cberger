{% docs src_stripe %}
    Sources for Stripe data.
{% enddocs %}

{% docs stripe_payments %}
    This table contains payments for each order_id. The granularity is at the
    payment method level, and it is possible for one order to implement
    many payment methods.
{% enddocs %}

{% docs stripe_payments_id %}
    The primary key that identifies each unique combination of order id and 
    payment method instance used.
{% enddocs %}

{% docs stripe_payments_orderid %}
    A secondary key that links to the jaffle_shop.orders.order_id.
{% enddocs %}

{% docs stripe_payments_paymentMethod %}
    The method for which the customer paid for some or all of their order.
{% enddocs %}

{% docs stripe_payments_amount_raw %}
    The amount, in cents, which the customer paid for some or all of their 
    order.
{% enddocs %}

{% docs stripe_payments_amount_dollar %}
    The amount, in USD, for which the customer paid for some or all of 
    their order.
{% enddocs %}

{% docs stripe_payments_created %}
    The YYYY-MM-DD format for when the payment was recorded.
{% enddocs %}

{% docs stripe_payments_batched_at %}
    The timestamp in YYYY-MM-DD HH24:MI:SS TZHTZM format for when the 
    data was loaded in to the warehouse.
{% enddocs %}