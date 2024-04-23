/* total sales value per genre */ 

WITH tspg AS (
    SELECT ii.InvoiceId AS invoice_id,
           i.InvoiceDate AS date,
           ii.TrackId AS track_id,
           t.GenreId AS genre_id,
           ROUND(SUM(ii.Quantity * ii.UnitPrice) ) AS total_sales
      FROM invoice_items AS ii
           LEFT JOIN
           tracks AS t ON t.TrackId = ii.TrackId
           LEFT JOIN
           invoices AS i ON ii.InvoiceId = i.InvoiceId
     GROUP BY genre_id
)
SELECT genres.Name AS genre,
       tspg.total_sales
  FROM tspg
       LEFT JOIN
       genres ON tspg.genre_id = genres.GenreId
 ORDER BY total_sales DESC;

