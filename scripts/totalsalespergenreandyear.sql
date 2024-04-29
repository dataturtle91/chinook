-- Total sales per genre and year

WITH InvoicesAndTracks AS
(
SELECT 

       i.BillingCountry
       ,strftime('%Y', i.InvoiceDate) AS year
       ,ii.TrackId
       ,ii.UnitPrice * ii.Quantity AS total_price
       ,t.GenreId
FROM 
    invoice_items AS ii
  
LEFT JOIN tracks AS t
ON ii.TrackId = t.TrackId

LEFT JOIN invoices AS i
ON ii.InvoiceId = i.InvoiceId
)




SELECT
        iat.Year
        ,g.Name
        ,ROUND(SUM(iat.Total_price),2) AS Total_sales
FROM 
    InvoicesAndTracks AS iat

LEFT JOIN genres AS g
ON iat.GenreId = g.GenreId

GROUP BY 
    g.Name,
    iat.Year
ORDER BY 
    iat.year ASC, 
    total_sales DESC;
