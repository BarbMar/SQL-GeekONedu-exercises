--Podaj imiona, nazwiska i numery PESEL pracowników tylko z poprawnej d³ugoœci nr PESEL.
--Jeœli nie ma podanego nr PESEL podaj tak¹ informacjê
SELECT Imie, Nazwisko, ISNULL (PESEL, 'brak PESELu') AS PESEL
	FROM Pracownicy
WHERE LEN (PESEL) = 11 OR PESEL IS NULL


--Podaj inicja³y procowników
SELECT LEFT(Imie, 1) + LEFT(Nazwisko ,1) AS Inicjaly
	FROM Pracownicy


--Podaj zakupy zrobione w weekend
SELECT *
	FROM ZakupySklepOnline
WHERE DATEPART (DW, DataZakupu) IN (7,1)


--Podaj praconików zatrudnionych w pierwszych po³owach roku
SELECT *
	FROM Pracownicy
WHERE MONTH (DataZatrudnienia)<=6


--Podaj telefony Samsung z serii S z dospiskiem Galaxy (np. Samsung Galaxy S8)
SELECT REPLACE (Nazwa, 'Samsung S', 'Samsung Galaxy S') AS Nazwa
	FROM Produkty
WHERE Nazwa LIKE 'Samsung%'


--Podaj mê¿czyzn zatrudnionych w drugim kwartale dowolnego roku
SELECT *
	FROM Pracownicy
WHERE RIGHT (Imie, 1) <> 'a' AND DATEPART (QQ, DataZatrudnienia) = 2


--Usuñ polskie znaki z nazw produktów
SELECT
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(Nazwa, '¹', 'a'), 'æ', 'c'), 'ê', 'e'), '³', 'l'), 'ñ', 'n'), 'ó', 'o'), 'œ', 's'), 'Ÿ', 'z'), '¿', 'z')
	FROM Produkty


--Na podstawie nr PESEL podaj kobiety (10 cyfra jest 0 lub parzysta)
SELECT *
	FROM Pracownicy
WHERE SUBSTRING(PESEL, 10, 1) IN('0','2','4','6','8')
AND LEN(PESEL)=11



--Do nazwy telefonów Samsung dodaj dopisek Galaxy, np. Samsung Galaxy Note 8 i Samsung Galaxy S8
SELECT 
REPLACE(REPLACE (Nazwa, 'Samsung Note', 'Samsung Galaxy Note'), 'Samsung S', 'Samsung Galaxy S') AS Nazwa
	FROM Produkty
WHERE Nazwa LIKE 'Samsung%'


--Przygotuj indentyfikatory dla pracowników (imiê i nazwisko w 1 kolumnie pisane wielkimi literami)
SELECT UPPER (Imie +' '+ Nazwisko)
	FROM Pracownicy


--ZnajdŸ pracowników zatrudnionych w weekend
SELECT*
	FROM Pracownicy
WHERE DATEPART(DW, DataZatrudnienia) IN (7,1)


--Przygotuj maile pracowników (pierwsza litera imienia, kropka, nazwisko, @sklep.pl)
SELECT LOWER(LEFT(Imie, 1) + '.' + Nazwisko + '@sklep.pl')
	FROM Pracownicy


--Policz wyp³aty pracowników (w kolumnie premia podane jest 30 jako 30%)
SELECT
	Imie, Nazwisko,
	CAST(PensjaPodstawowa + PensjaPodstawowa*Premia/100.0 AS decimal(10,2))	AS Wyp³ata
	FROM Pracownicy


--Policz kwoty netto dla produktów (podane s¹ brutto, zawieraj¹ 23% Vatu)
SELECT Nazwa, (Cena/1.23)*100 AS CenaNetto
	FROM Produkty

