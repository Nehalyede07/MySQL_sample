Q 7. What is the percentage contribution of each product to the total 
revenue?

with CTE as
(SELECT sum(Quantity*price) as total_revenue
FROM transactions t
JOIN sustainable_clothing s ON s.product_id = t.product_id),

CTE2 as
(SELECT product_name, sum(quantity*price) as total_prod_revenue
FROM transactions t
JOIN sustainable_clothing s ON t.product_id = s.product_id
GROUP BY product_name)

SELECT product_name,
(total_prod_revenue*100)/total_revenue as percent_contri
FROM CTE,CTE2;
