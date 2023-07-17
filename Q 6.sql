Q 6. What is the average revenue generated per day during the marketing 
campaigns?

SELECT campaign_name, purchase_date,avg(QUANTITY*PRICE) AS avg_revenue
FROM marketing_campaigns
JOIN transactions
using(product_id)
JOIN sustainable_clothing 
USING(product_id)
WHERE purchase_date BETWEEN start_date AND end_date
GROUP BY purchase_date
order by purchase_date,avg_revenue desc;

SET GLOBAL sql_mode = (SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
