-- Total order value, average order value and number of orders per country

SELECT
       BillingCountry AS country
       ,COUNT(CustomerId) AS number_of_purchases
       ,ROUND(SUM(Total),2) AS total_order_value
       ,ROUND(ROUND(SUM(Total),2)/COUNT(CustomerId),2) AS average_order_value
  FROM 
      invoices  
GROUP BY 
    country
ORDER BY
    total_order_value DESC
