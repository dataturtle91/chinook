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
Wyświetl nazwę gatunku i łączną liczbę sprzedanych sztuk. */

SELECT
    g.name AS genre
    ,SUM(i.quantity) AS quantity

FROM
    invoice_items i
    
LEFT JOIN tracks t  ON i.trackid = t.trackid
LEFT JOIN genres g  ON t.genreid = g.genreid

GROUP BY
    genre
ORDER BY quantity DESC;

/* ZADANIE 3.
Najlepiej sprzedający pracownik
Zadanie: Zidentyfikuj pracownika (Employee), który jest odpowiedzialny za najwyższą łączną kwotę sprzedaży (sumę Total z tabeli Invoice). 
Pracownik jest powiązany z klientem poprzez kolumnę SupportRepId w tabeli Customer. 
Wyświetl imię, nazwisko pracownika oraz łączną kwotę sprzedaży, którą obsłużył. */

SELECT
    e.firstname
    ,e.lastname
    ,ROUND(SUM(i.total),2) AS total
    
FROM 
    invoices i
LEFT JOIN customers c ON i.customerid = c.customerid
LEFT JOIN employees e ON c.supportrepid = e.employeeid

GROUP BY
    e.employeeid
    
ORDER BY total DESC
LIMIT 1;

/* ZADANIE 4.
Klienci, którzy kupili Utwory danego Artysty
Zadanie: Znajdź imię i nazwisko wszystkich klientów, którzy kupili co najmniej jeden utwór artysty o imieniu "Led Zeppelin". 
Upewnij się, że na liście nie ma duplikatów. */

/* ZADANIE 5.
Największy Spender (Klient)
Zadanie: Zidentyfikuj klienta, który wydał najwięcej pieniędzy ogółem (sumując Total z tabeli Invoice). 
Wyświetl jego imię, nazwisko i całkowitą kwotę, jaką wydał. */




