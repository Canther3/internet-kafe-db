DROP TABLE IF EXISTS Bilgisayar;
DROP TABLE IF EXISTS Musteri;
DROP TABLE IF EXISTS Oyun;
DROP TABLE IF EXISTS Calisan;
DROP TABLE IF EXISTS Masa;
-- burda hata alýyordum 
--Msg 2714, Level 16, State 6, Line 1
--There is already an object named 'OdevTablosu1' in the database. bu þekildeydi ondan dolayý her çalýþtýrdýðýmda tabloyu silip yeni bir  tablo oluþturyorum her sildiðinde ayný tablodan oluþturuyor.
CREATE TABLE Bilgisayar (
    PcNo varchar(30),
    Markasý varchar(12)
);

CREATE TABLE Musteri (
    MusteriAd varchar(30)
);



CREATE TABLE Oyun (
    OyunAdi varchar(30),
    Yapýmcisi varchar(12),
    CýkýsTarih varchar(12)
);


CREATE TABLE Calisan (
    CalisanTC varchar(30),
    CalisanAdi varchar(12),
    Maas int,
    TelNo varchar(12)
);


CREATE TABLE Masa (
    id int,
    Sayi varchar(30),
    MasaSorumlusu varchar(30)
);


INSERT INTO Bilgisayar(PcNo,Markasý)
VALUES 
    ('1', 'Dell'),
	('2', 'Asus'),
	('3', 'Lenovo'),
	('4', 'HP'),
	('5', 'MSI');

	
INSERT INTO Musteri(MusteriAd)
VALUES 
    ('Ahmet'),
	('Sýla'),
	('Sara'),
	('Melis'),
	('Can');
	
INSERT INTO Oyun(OyunAdi, Yapýmcisi,CýkýsTarih)
VALUES 
    ('Counter Strike 2','valve','2023 Yazý'),
	('Valorant','Riot Games','02.06.2020'),
	('COD4',' activision','5.11.2007'),
	('battlefield V','EA','9.11.2018'),
	('need for speed hot pursuit','EA','16.11.2010');
	
INSERT INTO Calisan(CalisanAdi,CalisanTC,Maas)
VALUES 
    ('Sude', '12345678910','10000'),
	('Sýla', '98745632101','10000'),
	('Sara', '45678912378','10000'),
	('Mina', '78965412369','10000'),
	('Selinay','74185296321','10000');

	
	
INSERT INTO Masa(id, Sayi, MasaSorumlusu)
VALUES 
    (1, 'Sude', 'Sude'),
    (2, 'Sýla', 'Sýla'),
    (3, 'Sara', 'Sara'),
    (4, 'Mina', 'Mina'),
    (5, 'Selinay', 'Selinay');




SELECT * FROM Calisan;

SELECT CalisanAdi FROM Calisan;


SELECT * FROM Calisan WHERE CalisanAdi = 'Mina';

SELECT * FROM Bilgisayar WHERE Markasý LIKE 'MSI';


SELECT * FROM Calisan WHERE CalisanTC BETWEEN '12345678910' AND '45678912378';


SELECT * FROM Musteri ORDER BY MusteriAd ASC;


SELECT OyunAdi, COUNT(*) FROM Oyun GROUP BY OyunAdi;

SELECT * FROM Calisan WHERE CalisanTC = (SELECT MAX(CalisanTC) FROM Calisan);


SELECT * FROM Calisan WHERE CalisanTC = (SELECT MAX(CalisanTC) FROM Calisan);



SELECT Musteri.MusteriAd, Calisan.CalisanAdi
FROM Musteri
INNER JOIN Calisan ON Musteri.MusteriAd = Calisan.CalisanAdi;





SELECT Oyun.OyunAdi, Oyun.Yapýmcisi, Masa.MasaSorumlusu
FROM Oyun
INNER JOIN Masa ON Oyun.OyunAdi = Masa.MasaSorumlusu
INNER JOIN Calisan ON Calisan.CalisanTC = Masa.MasaSorumlusu;



SELECT Bilgisayar.PcNo, Bilgisayar.Markasý, Masa.Sayi
FROM Bilgisayar
INNER JOIN Masa ON Bilgisayar.PcNo = Masa.id;




SELECT Calisan.CalisanTC, Calisan.CalisanAdi, Oyun.OyunAdi
FROM Calisan
INNER JOIN Oyun ON Calisan.CalisanTC = Oyun.Yapýmcisi;





SELECT Musteri.MusteriAd, Oyun.OyunAdi, Calisan.CalisanAdi
FROM Musteri
INNER JOIN Oyun ON Musteri.MusteriAd = Oyun.Yapýmcisi
INNER JOIN Calisan ON Oyun.OyunAdi = Calisan.CalisanAdi;



SELECT Oyun.OyunAdi, Oyun.CýkýsTarih
FROM Oyun
INNER JOIN Calisan ON Oyun.OyunAdi = Calisan.CalisanAdi;




SELECT Masa.MasaSorumlusu, Masa.Sayi, Calisan.CalisanAdi
FROM Masa
INNER JOIN Calisan ON Masa.MasaSorumlusu = Calisan.CalisanAdi;





SELECT Calisan.CalisanAdi, Calisan.Maas
FROM Calisan
INNER JOIN Masa ON Calisan.CalisanAdi = Masa.MasaSorumlusu;



SELECT Bilgisayar.PcNo, Bilgisayar.Markasý, Oyun.OyunAdi
FROM Bilgisayar
INNER JOIN Oyun ON Bilgisayar.PcNo = Oyun.Yapýmcisi;




SELECT Bilgisayar.PcNo, Bilgisayar.Markasý, Oyun.OyunAdi
FROM Bilgisayar
INNER JOIN Oyun ON Bilgisayar.PcNo = Oyun.Yapýmcisi;


CREATE LOGIN KullaniciAdi WITH PASSWORD = 'Parola123';

USE SonOdevFinal;
CREATE USER KullaniciAdi FOR LOGIN KullaniciAdi;

GRANT SELECT, INSERT, UPDATE, DELETE ON Bilgisayar TO KullaniciAdi;
GRANT SELECT, INSERT, UPDATE, DELETE ON Oyun TO KullaniciAdi;
GRANT SELECT, INSERT, UPDATE, DELETE ON Musteri TO KullaniciAdi;
GRANT SELECT, INSERT, UPDATE, DELETE ON Calisan TO KullaniciAdi;
GRANT SELECT, INSERT, UPDATE, DELETE ON Masa TO KullaniciAdi;

GO



