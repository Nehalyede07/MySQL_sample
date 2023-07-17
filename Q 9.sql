with CTE as 
(SELECT sum(quantity*price) as revenue_in_campaign
FROM transactions t
JOIN sustainable_clothing s ON t.product_id=s.product_id
JOIN marketing_campaigns m ON t.purchase_date BETWEEN m.start_date AND m.end_date
AND t.product_id=m.product_id),

CTE2 as
(SELECT sum(quantity*price) as total_revenue
FROM transactions t
JOIN sustainable_clothing s ON t.product_id=s.product_id)

SELECT total_revenue,revenue_in_campaign,
       total_revenue - revenue_in_campaign as revenue_outside_campaign
       FROM CTE,CTE2;
