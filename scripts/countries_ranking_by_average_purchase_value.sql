--Countries - ranking by average purchase value

WITH customers_ranking AS 
(
SELECT
     il.CustomerId
    ,cl.FirstName 
    ,cl.LastName 
    ,cl.Country 
    ,cl.SupportRepId 
    ,SUM(il.total) AS TotalPurchaseValue
    ,COUNT(il.total) AS TotalPurchaseNumber
    
FROM invoices AS il

LEFT JOIN 
    customers AS cl
ON 
    il.CustomerId = cl.CustomerId

GROUP BY 
    il.CustomerId

ORDER BY 
    TotalPurchaseValue DESC
)


SELECT
    DENSE_RANK() OVER (ORDER BY ROUND((SUM(TotalPurchaseValue))/(SUM(TotalPurchaseNumber)),2) DESC) AS Rank
    ,Country 
    ,ROUND(SUM(TotalPurchaseValue),2) AS CountryTotalPurchaseValue
    ,ROUND(SUM(TotalPurchaseNumber),2) AS CountryTotalPurchaseNumber
    ,ROUND((SUM(TotalPurchaseValue))/(SUM(TotalPurchaseNumber)),2) AS AveragePurchaseValue
    
FROM 
    customers_ranking

GROUP BY Country
