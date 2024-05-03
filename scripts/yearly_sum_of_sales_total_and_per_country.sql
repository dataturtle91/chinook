-- Yearly sum of sales - total and per country

WITH total_sum AS
    (
    
    SELECT
      
        strftime('%Y',InvoiceDate) AS year
        ,BillingCountry
        ,SUM(Total) AS totalsum
    
    FROM 
        invoices
    GROUP BY
        year
        ,BillingCountry
    ORDER BY
        year ASC
        ,Totalsum DESC
    )

SELECT
    year
    ,BillingCountry AS billing_country
    ,ROUND(TotalSum) AS country_sum
    ,ROUND(SUM(TotalSum) OVER (PARTITION BY year),2) AS general_sum
    ,ROUND((TotalSum)/(SUM(TotalSum) OVER (PARTITION BY year)),2) * 100 AS '% percentage'

 FROM 
     total_sum
