/*
If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.
The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer has precisely one first order.
Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.
The result format is in the following example.
+----------------------+
| immediate_percentage |
+----------------------+
| 50.00                |
+----------------------+
*/
WITH first_order_date_per_client AS (
    SELECT
        customer_id,
        MIN( order_date ) AS first_order_date
    FROM Delivery
    GROUP BY customer_id
)

SELECT
    ROUND(
        100 * COUNT( d.delivery_id ) FILTER ( WHERE d.order_date = d.customer_pref_delivery_date )
            / COUNT( d.delivery_id )::numeric,
        2
    ) AS immediate_percentage
FROM Delivery d
INNER JOIN 
    first_order_date_per_client f 
        ON d.customer_id = f.customer_id
WHERE d.order_date = f.first_order_date;