--Poka¿ 1 kobietê i 1 mê¿czyznê
SELECT TOP 1 *
	FROM Pracownicy
WHERE RIGHT(Imie, 1) = 'a'
UNION
SELECT TOP 1 *
	FROM Pracownicy
WHERE RIGHT(Imie, 1) <> 'a'


--Poka¿ imiê, nazwisko i p³eæ pracownika
SELECT Imie, Nazwisko, 
CASE WHEN RIGHT(Imie, 1) = 'a' THEN 'kobieta' ELSE 'mê¿czyzna' END AS 'Plec'
	FROM Pracownicy


--Podaj produkty kosztuj¹ce wiêcej ni¿ œrednia cena asortymentu
SELECT *
	FROM Produkty
WHERE Cena> (SELECT AVG(Cena) FROM Produkty)


--Ile jest kobiet, a ile mê¿czyzn wœród pracowników
SELECT x.Plec, COUNT (*) AS Ilosc
	FROM (
		SELECT CASE WHEN RIGHT(Imie, 1) = 'a' THEN 'kobieta' ELSE 'mê¿czyzna' END AS Plec
			FROM Pracownicy) x
GROUP BY x.Plec


-- Podaj iloœæ sprzedanego asortymentu w sklepie stacjonarnym z podzia³em na miesi¹ce podaj¹c ich nazwy oraz zachowuj¹c kolejnoœæ miesiêcy
SELECT CASE 
		WHEN MONTH (z.DataZakupu)=1 THEN 'Styczen'
		WHEN MONTH (z.DataZakupu)=2 THEN 'Luty'
		WHEN MONTH (z.DataZakupu)=3 THEN 'Marzec'
		WHEN MONTH (z.DataZakupu)=4 THEN 'Kwiecie'
		WHEN MONTH (z.DataZakupu)=5 THEN 'Maj'
		WHEN MONTH (z.DataZakupu)=6 THEN 'Czerwiec'
		WHEN MONTH (z.DataZakupu)=7 THEN 'Lipiec'
		WHEN MONTH (z.DataZakupu)=8 THEN 'Sierpien'
		WHEN MONTH (z.DataZakupu)=9 THEN 'Wrzesien'
		WHEN MONTH (z.DataZakupu)=10 THEN 'Pazdziernik'
		WHEN MONTH (z.DataZakupu)=11 THEN 'Listopad'
		WHEN MONTH (z.DataZakupu)=12 THEN 'Grudzien'
END AS Miesiac,
SUM(zp.Ilosc) AS Ilosc
	FROM ZakupySklepStacjonarny z
	INNER JOIN ZakupySklepStacjonarnyProdukt zp
	ON zp.IdZakup = z.IdZakupySklepStacjonarny
GROUP BY MONTH(z.DataZakupu)
ORDER BY MONTH(z.DataZakupu)


--Ile razy wybrano dostawa Poczta Polska dla zakupów online w ka¿dej kategorii produktu
SELECT x.Nazwa, COUNT(*) AS Ilosc
	FROM
		(SELECT kp.Nazwa 	
			FROM Produkty p
			INNER JOIN KategorieProduktow kp
			ON p.IdKategorii = kp.IdKategorieProduktow 
			INNER JOIN ZakupySklepOnlineProdukt zp
			ON zp.IdProduktu = p.IdProdukty
			INNER JOIN ZakupySklepOnline z
			ON z.IdZakupySklepOnline = zp.IdZakup
			INNER JOIN RodzajDostawy rd
			ON rd.IdRodzajDostawy = z.Dostawa
	WHERE rd.Nazwa = 'Poczta Polska'
	GROUP BY kp.Nazwa, z.IdZakupySklepOnline) x
GROUP BY x.Nazwa