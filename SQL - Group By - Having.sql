--Podaj ilu jest praconików, ktrzy maj¹ prze³o¿onego
SELECT
	COUNT(IdPrzelozonego)
	FROM Pracownicy


--Podaj najtañsz¹ opcjê dostawy poza odbiorem osobistym
SELECT TOP 1 *
	FROM RodzajDostawy
WHERE Nazwa <> 'Odbiór osobisty'
ORDER BY Cena


--Ilu pracowników jest przypisanych do danego prze³o¿onego? Wyklucz tych bez prze³o¿onego
SELECT IdPrzelozonego, COUNT(*) AS Ilosc
	FROM Pracownicy
WHERE IdPrzelozonego IS NOT NULL
GROUP BY IdPrzelozonego


--Podaj dni maja, w których by³o conajmniej 5 sprzeda¿y sklepie stacjonarym
SELECT DAY (DataZakupu) AS Data_zakupu, COUNT (*) AS Ilosc
	FROM ZakupySklepStacjonarny
WHERE MONTH (DataZakupu) = 5
GROUP BY DAY (DataZakupu)
HAVING COUNT (*) >=5



--W którym dziale s¹ najwy¿sze œrednie zarobki
SELECT TOP 1 IdDzialu, CAST(AVG(PensjaPodstawowa) AS decimal (10, 2)) AS SrednieZarodbki
	FROM Pracownicy
GROUP BY IdDzialu
ORDER BY SrednieZarodbki DESC


--Podaj kwarta³, w którym by³o najwiêcej zakupów online
SELECT TOP 1 DATEPART (QQ, DataZakupu) AS Kwartal, COUNT(*) AS Ilosc_zakupow
	FROM ZakupySklepOnline
GROUP BY DATEPART (QQ, DataZakupu)
ORDER BY Ilosc_zakupow DESC


--W którym dziale mê¿czyŸni maj¹ najni¿sze œrednie zarobki
SELECT TOP 1 IdDzialu, CAST(AVG(PensjaPodstawowa) AS decimal (10,2)) AS Srednie_zarobki
	FROM Pracownicy
WHERE RIGHT (Imie, 1) <> 'a'
GROUP BY IdDzialu
ORDER BY Srednie_zarobki


--Za któr¹ dostawê zap³acono najwiêcej
SELECT TOP 1 NumerDostawy, SUM(CenaZaSztuke * Ilosc) AS Kwota
	FROM DostawaProduktow
GROUP BY NumerDostawy
ORDER BY Kwota DESC

