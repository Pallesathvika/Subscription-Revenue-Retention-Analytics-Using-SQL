-- Monthly Recurring Revenue
SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS month,
    SUM(amount) AS monthly_revenue
FROM payments
WHERE payment_status = 'Success'
GROUP BY DATE_FORMAT(payment_date, '%Y-%m')
ORDER BY month;

-- Monthly Revenue Growth Percentage
WITH monthly_revenue AS (
    SELECT 
        DATE_FORMAT(payment_date, '%Y-%m') AS month,
        SUM(amount) AS revenue
    FROM payments
    WHERE payment_status = 'Success'
    GROUP BY DATE_FORMAT(payment_date, '%Y-%m')
)

SELECT 
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS previous_month_revenue,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY month)) 
        / LAG(revenue) OVER (ORDER BY month) * 100, 
        2
    ) AS revenue_growth_percentage
FROM monthly_revenue
ORDER BY month;

-- Customer Lifetime Value
SELECT 
    c.customer_id,
    SUM(p.amount) AS lifetime_value
FROM customers c
JOIN subscriptions s 
    ON c.customer_id = s.customer_id
JOIN payments p 
    ON s.subscription_id = p.subscription_id
WHERE p.payment_status = 'Success'
GROUP BY c.customer_id
ORDER BY lifetime_value DESC;

-- Top 5 Customers by Total Spending
SELECT *
FROM (
    SELECT 
        c.customer_id,
        SUM(p.amount) AS total_spent,
        RANK() OVER (ORDER BY SUM(p.amount) DESC) AS customer_rank
    FROM customers c
    JOIN subscriptions s 
        ON c.customer_id = s.customer_id
    JOIN payments p 
        ON s.subscription_id = p.subscription_id
    WHERE p.payment_status = 'Success'
    GROUP BY c.customer_id
) ranked_customers
WHERE customer_rank <= 5;

-- Rolling 3-Month Revenue Average
WITH monthly_revenue AS (
    SELECT 
        DATE_FORMAT(payment_date, '%Y-%m') AS month,
        SUM(amount) AS revenue
    FROM payments
    WHERE payment_status = 'Success'
    GROUP BY DATE_FORMAT(payment_date, '%Y-%m')
)

SELECT 
    month,
    revenue,
    ROUND(
        AVG(revenue) OVER (
            ORDER BY month
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS rolling_3_month_avg
FROM monthly_revenue
ORDER BY month;
