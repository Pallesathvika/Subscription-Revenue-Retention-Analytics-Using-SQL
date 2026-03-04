CREATE DATABASE subscription_analytics;
USE subscription_analytics;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    signup_date DATE,
    country VARCHAR(50),
    acquisition_channel VARCHAR(50)
);

CREATE TABLE plans (
    plan_id INT PRIMARY KEY,
    plan_name VARCHAR(50),
    monthly_fee DECIMAL(10,2)
);

CREATE TABLE subscriptions (
    subscription_id INT PRIMARY KEY,
    customer_id INT,
    plan_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    subscription_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (subscription_id) REFERENCES subscriptions(subscription_id)
);