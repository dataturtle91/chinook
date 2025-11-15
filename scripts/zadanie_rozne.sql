/*  ZADANIE 1.
Ranking Sprzedaży według Kraju
Zadanie: Znajdź całkowitą kwotę sprzedaży (sumę kolumny Total z tabeli Invoice) dla każdego kraju, z którego pochodzą klienci. 
Wyświetl nazwę kraju (Country z tabeli Customer) i sumę sprzedaży. 
Posortuj wyniki malejąco według sumy sprzedaż
*/

-- Sprawdz,  czy w tabeli faktur InvoiceId są unikatowe 
SELECT
    COUNT(invoiceid) AS total_invoices
    ,COUNT(DISTINCT invoiceid) AS unique_invoices

FROM
    invoices;
    
-- Numery faktur są unikatowe

SELECT
    c.country AS country,
    ROUND(SUM(i.total),2) as total

FROM
    invoices i
LEFT JOIN customers c ON i.customerid = c.customerid

GROUP BY
    country
ORDER BY
    total DESC;

/* ZADANIE 2. 
Najpopularniejszy Gatunek Muzyczny
Zadanie: Określ, który gatunek muzyczny (Genre) został sprzedany w największej łącznej ilości (sumując Quantity z tabeli InvoiceLine). 
Wyświetl nazwę gatunku i łączną liczbę sprzedanych sztuk.
