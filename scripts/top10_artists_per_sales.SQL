WITH artists_invoice_items AS
(
SELECT
    ii.InvoiceId,
    ar.Name,
    ii.Quantity,
    ii.UnitPrice,
    ii.Quantity * ii.UnitPrice as TotalPrice
       
FROM
    invoice_items ii
    
LEFT JOIN tracks t ON ii.TrackId = t.TrackId
LEFT JOIN albums al ON t.AlbumId = al.AlbumId
LEFT JOIN artists ar ON al.ArtistId = ar.ArtistId
)

SELECT
    Name
    ,ROUND(SUM(TotalPrice),2) AS Sales

FROM 
    artists_invoice_items
    
GROUP BY
    Name
    
ORDER BY
    Sales DESC
    
LIMIT 10 

