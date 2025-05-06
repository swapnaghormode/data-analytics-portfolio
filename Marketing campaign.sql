show databases;
create database marketing_analyst;
use marketing_analyst;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender CHAR(1),
    city VARCHAR(50)
);

select * from customers;

CREATE TABLE campaigns (
    campaign_id INT PRIMARY KEY,
    campaign_name VARCHAR(50),
    start_date DATE,
    end_date DATE
);

CREATE TABLE responses (
    response_id INT PRIMARY KEY,
    customer_id INT,
    campaign_id INT,
    response_date DATE,
    purchase_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id)
);

INSERT INTO customers VALUES
(1, 'John Doe', 28, 'M', 'New York'),
(2, 'Jane Smith', 34, 'F', 'Chicago'),
(3, 'Dave Lee', 23, 'M', 'Los Angeles'),
(4, 'Sarah Kim', 29, 'F', 'Boston'),
(5, 'Amy Jones', 31, 'F', 'Seattle');

INSERT INTO campaigns VALUES
(1, 'Summer Sale', '2023-06-01', '2023-06-30'),
(2, 'Winter Wonderland', '2023-12-01', '2023-12-31'),
(3, 'Spring Specials', '2024-03-01', '2024-03-31');

INSERT INTO responses VALUES
(1, 1, 1, '2023-06-15', 120.00),
(2, 2, 1, '2023-06-20', 200.00),
(3, 3, 2, '2023-12-10', 150.00),
(4, 4, 2, '2023-12-25', 300.00),
(5, 5, 3, '2024-03-05', 180.00);

select * from customers;
select * from campaigns;
select * from responses;

# SQL Queries
# 1. Total Sales per Campaign
SELECT c.campaign_name, SUM(r.purchase_amount) AS total_sales
FROM campaigns c
JOIN responses r ON c.campaign_id = r.campaign_id
GROUP BY c.campaign_name;
# 1. Average Sales per Campaign
select c.campaign_name, avg(r.purchase_amount) as avg_sales
from campaigns c
join responses r on c.campaign_id = r.campaign_id 
group by c.campaign_name;

# Average Age of Respondents per Campaign
SELECT c.campaign_name, AVG(cu.age) AS avg_age
FROM responses r
JOIN customers cu ON r.customer_id = cu.customer_id
JOIN campaigns c ON r.campaign_id = c.campaign_id
GROUP BY c.campaign_name;

# Gender Distribution of Respondents
SELECT cu.gender, COUNT(*) AS count
FROM responses r
JOIN customers cu ON r.customer_id = cu.customer_id
GROUP BY cu.gender;

select * from customers;
select * from campaigns;
select * from responses;

#Total Purchases per City
select cu.city, sum(r.purchase_amount) as total_purchases from responses r
join customers cu on r.customer_id = cu.customer_id
group by cu.city;

#Insights and Recommendations
--- Campaign Performance: The total sales query indicates which campaign generated the highest revenue. This helps in identifying the most successful campaigns.
--- Demographics: Understanding the average age and gender distribution helps in tailoring future campaigns to target the right audience.
--- Geographic Insights: Analyzing the total purchases per city can guide location-specific marketing efforts.