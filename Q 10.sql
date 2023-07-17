WITH CTE as
(SELECT product_name,avg(Quantity) as Avg_sold_Quantity
FROM transactions t 
JOIN sustainable_clothing s ON t.product_id=s.Product_ID
GROUP BY 1)

SELECT product_name,Avg_sold_Quantity,
dense_rank() over(ORDER BY Avg_sold_Quantity) as rank_avg
from CTE;
