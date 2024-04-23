/* Data validation  -- 
sum of the items from the invoice_items table agree with the sum (total) of the invoices table */

SELECT 
    invoice_items.InvoiceId AS id
    ,ROUND(SUM(invoice_items.UnitPrice),2) AS invoice_items_total
    ,invoices.InvoiceId AS invoice_id
    ,invoices.total AS total
    ,((ROUND(SUM(invoice_items.UnitPrice),2)-invoices.total)) AS difference
     
FROM 
    invoice_items
    
LEFT JOIN invoices
ON invoice_items.Invoiceid = invoices.InvoiceId

   
GROUP BY
    invoice_items.InvoiceId
    
HAVING difference != 0