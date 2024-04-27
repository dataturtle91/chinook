--Customers - ranking by total purchase value

WITH customers_ranking AS 
(
SELECT
     il.CustomerId
    ,cl.FirstName 
    ,cl.LastName 
    ,cl.Country 
    ,cl.SupportRepId 
    ,SUM(il.total) AS TotalPurchaseValue
    
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
    DENSE_RANK() OVER (ORDER BY TotalPurchaseValue DESC) AS Rank
    ,CustomerId
    ,FirstName 
    ,LastName 
    ,Country 
    ,SupportRepId 
    ,TotalPurchaseValue
    
FROM 
    customers_ranking
