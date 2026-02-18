--Podaj produkty kosztuj¹ce wiêcej ni¿ œrednia cena asortymentu
SELECT *
	FROM Produkty
WHERE Cena> (SELECT AVG(Cena) FROM Produkty)