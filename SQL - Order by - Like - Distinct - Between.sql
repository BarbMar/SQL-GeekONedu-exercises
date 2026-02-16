
--Podaj dostawców spoza Wroc³awia
SELECT *
	FROM Dostawcy
WHERE Miasto NOT LIKE 'Wroc_aw'


--Podaj 4 najtañsze produkty z kategorii 2
SELECT TOP 4 *
	FROM Produkty
WHERE IdKategorii= 2
	ORDER BY Cena

--Podaj 2 najtañsze zestawy LEGO
SELECT TOP 2 *
	FROM Produkty
WHERE Nazwa LIKE '%LEGO%'
	ORDER BY Cena

--Podaj wszystkie produkty zwi¹zane ze Star Wars
SELECT *
	FROM Produkty
WHERE Nazwa LIKE '%Star Wars%'


--Podaj Canony z serii D (np. 6D) dro¿sze ni¿ 5000 z³
SELECT *
	FROM Produkty
WHERE Nazwa LIKE 'Canon%[0-9]D%' AND Cena>5000


--Podaj unikalne imiona pracowników
SELECT 
	DISTINCT Imie
FROM Pracownicy;


--Podaj imie i nazwisko pracownika, jeœli zosta³ zatrudniony po 01.01.2019 roku
SELECT
	Imie, nazwisko
FROM Pracownicy
WHERE DataZatrudnienia> '2019-01-01'


--Poka¿ pracowników zatrudnionych w latach 2010-2015
SELECT *
	FROM Pracownicy
WHERE DataZatrudnienia BETWEEN '2010-01-01' AND '2015-12-31'


--Poka¿ pracowników o imionach Anna, Tomasz i Kamila
SELECT * 
	FROM Pracownicy
WHERE Imie IN('Anna', 'Tomasz', 'Kamila')


--Poka¿ zakupy online zawieraj¹ce komentarz
SELECT *
	FROM ZakupySklepOnline
WHERE Komentarz <> ''


--Poka¿ pracowników zarabiaj¹cych poni¿ej 4000z³ i posiadaj¹cych prze³o¿onego
SELECT *
	FROM Pracownicy
WHERE PensjaPodstawowa < 4000 AND IdPrzelozonego IS NOT NULL


--Podaj 3 najdro¿sze Nikody z serii D
SELECT TOP 3 *
	FROM Produkty
WHERE Nazwa LIKE 'Nikon%D[0-9]%'
ORDER BY Cena DESC



