--Podaj, jak¹ mamy bi¿uteriê
SELECT p.Nazwa
	FROM Produkty p
INNER JOIN KategorieProduktow kp 
	ON p.IdKategorii = kp.IdKategorieProduktow
WHERE kp.Nazwa = 'Bi¿uteria'


--Podaj klientów, którzy nie maj¹ karty sta³ego klienta
SELECT *
	FROM Klienci k
LEFT JOIN KartaStalegoKlienta ksk
	ON k.IdKlienci = ksk.IdKlienta
WHERE ksk.IdKartaStalegoKlienta IS NULL


--Jakie ceny telefonów by³y w marcu?
SELECT *
	FROM Produkty p
INNER JOIN CenyProduktow cp
	ON p.IdProdukty = cp.IdProduktu
INNER JOIN KategorieProduktow kp
	ON kp.IdKategorieProduktow = p.IdKategorii
WHERE MONTH(cp.DataOd) <= 3 AND MONTH(cp.DataDo) >= 3
AND kp.Nazwa = 'Telefony'


--Podaj nazwy produktów kupionych w sklepie online w styczniu
SELECT DISTINCT p.Nazwa
	FROM Produkty p
INNER JOIN ZakupySklepOnlineProdukt zp
	ON p.IdProdukty = zp.IdProduktu
INNER JOIN ZakupySklepOnline z
	ON zp.IdZakup = z.IdZakupySklepOnline
WHERE MONTH (z.DataZakupu) = 1


--Podaj mê¿czyzn i ich prze³o¿onych, jeœli maj¹
SELECT p1.Imie AS ImiePracownika, p1.Nazwisko AS NazwiskoPracownika, p2.Imie AS ImiePrze³o¿onego, p2.Nazwisko AS NazwiskoPrze³o¿onego
	FROM Pracownicy p1
LEFT JOIN Pracownicy P2
	ON p1.IdPrzelozonego = p2.IdPracownicy
WHERE RIGHT (p1.Imie, 1) <> 'a'


--Ilu klientów nie kupi³o nigdy nic w sklepie online
SELECT COUNT(*) AS IloscKlientow
	FROM Klienci k
LEFT JOIN ZakupySklepOnline z
	ON k.IdKlienci = z.IdKlienta
WHERE z.IdZakupySklepOnline IS NULL