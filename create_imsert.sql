CREATE DATABASE ekdoseis;
USE ekdoseis;

CREATE TABLE efimerida

(
onoma VARCHAR(50),
sixnotita ENUM('imerisia','evdomadiaia','miniaia'),
idioktitis VARCHAR(50),
PRIMARY KEY(onoma)
);

INSERT INTO efimerida VALUES
('Proto Thema','evdomadiaia','Nikos Petropoulos'),
('Kathimerini','imerisia','Panos Kostopoulos');


CREATE TABLE fyllo

(
arithmos INT,
onoma_efimeridas VARCHAR(50),
imerominia_kykloforias DATE,
selides INT DEFAULT 30,
PRIMARY KEY(arithmos,onoma_efimeridas),
CONSTRAINT con1
FOREIGN KEY(onoma_efimeridas) REFERENCES
efimerida(onoma) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO fyllo VALUES
(1, 'Proto Thema','2020-06-18',70),
(2, 'Proto Thema','2020-08-12',75),
(1,'Kathimerini','2020-10-10',50),
(2,'Kathimerini','2020-11-11',45);

CREATE TABLE ergazomenos
(
email VARCHAR(50),
onoma VARCHAR(50),
epitheto VARCHAR(50),
misthos FLOAT(7,2),
imerominia_proslipsis DATE,
onoma_efimeridas VARCHAR(50),
PRIMARY KEY(email),
CONSTRAINT con2 
FOREIGN KEY(onoma_efimeridas) REFERENCES
efimerida(onoma) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO ergazomenos VALUES
('erg1@protothema.com', 'Kostas','Konstantinou',900.25,'2019-01-01','Proto Thema'),
('erg2@protothema.com', 'Nikos', 'Nikolopoulos',800.00,'2018-01-01','Proto Thema'),
('erg3@protothema.com','Ioannis','Ioannou',750.45,'2019-11-11','Proto Thema'),
('erg4@protothema.com','Mixalis','Mixalakos',924.00,'2016-05-14','Proto Thema'),
('erg1@kathimerini.com','Paraskevas','Paraskevopoulos',1000.00,'2017-12-12','Kathimerini'),
('erg2@kathimerini.com','Fotis','Fotiou',500.45,'2018-07-07','Kathimerini'),
('erg3@kathimerini.com','Stratos','Stratopoulos',600.12,'2017-05-09','Kathimerini'),
('erg4@kathimerini.com','Efthimios','Efthimiou',1200.11,'2019-01-10','Kathimerini');



CREATE TABLE dimosiografos
(
email VARCHAR(50),
proypiresia INT,
viografiko TEXT,
PRIMARY KEY(email),
CONSTRAINT con3
FOREIGN KEY(email) REFERENCES
ergazomenos(email) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO dimosiografos VALUES
('erg1@protothema.com',5,'Viogafiko Kosta Konstantinou'),
('erg2@protothema.com',2,'Viogafiko Nikou Nikolopoulou'),
('erg1@kathimerini.com',4,'Viogafiko Paraskeva Paraskevopoulou'),
('erg2@kathimerini.com',1,'Viogafiko Foti Fotiou'),
('erg4@protothema.com',3,'Viogafiko plousio'),
('erg4@kathimerini.com',3,'Viogafiko spoudaio');






CREATE TABLE dioikitikos
(
email VARCHAR(50),
kathikonta ENUM('Secretary','Logistics'),
odos VARCHAR(50),
arithmos INT,
poli VARCHAR(50),
PRIMARY KEY(email),
CONSTRAINT con4
FOREIGN KEY(email) REFERENCES
ergazomenos(email) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO dioikitikos VALUES
('erg3@protothema.com','Secretary','Korinthou',56,'Patra'),
('erg3@kathimerini.com','Logistics','Ermou',100,'Patra');

CREATE TABLE tilephono
(
email VARCHAR(50),
arithmos INT,
PRIMARY KEY(email,arithmos),
CONSTRAINT con5
FOREIGN KEY(email) REFERENCES
dioikitikos(email) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tilephono VALUES
('erg3@protothema.com',2610111111),
('erg3@kathimerini.com',2610222222);



CREATE TABLE arxisintaktis
(
email VARCHAR(50),
PRIMARY KEY(email),
CONSTRAINT con6
FOREIGN KEY(email) REFERENCES
dimosiografos(email) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO arxisintaktis VALUES
('erg4@protothema.com'),
('erg4@kathimerini.com');


CREATE TABLE katigoria
(
kodikos INT,
onoma VARCHAR(50),
perigrafi TEXT,
kodikos_gonikis INT,
PRIMARY KEY(kodikos),
CONSTRAINT con7
FOREIGN KEY(kodikos_gonikis)
REFERENCES katigoria(kodikos) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO katigoria VALUES
(1,'Athlitika','Perigrafi Athlitikwn',null),
(2,'Politika','Perigrafi Politikwn',null),
(3,'Koinwnika','Perigrafi Koinwnikwn',null),
(4,'Podosfairo','Perigrafi Podosfairou',1),
(5,'Mpasket','Perigrafi Mpasket',1),
(6,'Esoteriki Politiki','Perigrafi Esoterikis Politikis',2),
(7,'Eksoteriki Politiki','Perigrafi Eksoterikis Politikis',2);



CREATE TABLE arthro
(
path VARCHAR(50),
titlos VARCHAR(50),
perigrafi TEXT,
selides INT,
imerominia_eggrisis DATE,
apotelesma ENUM('accepted','rejected', 'to be revised'),
seira INT,
kodikos_katigorias INT,
arithmos_fyllou INT,
onoma_efimeridas VARCHAR(50),
email VARCHAR(50),
PRIMARY KEY(path),
CONSTRAINT con8
FOREIGN KEY(kodikos_katigorias)
REFERENCES katigoria(kodikos) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT con9
FOREIGN KEY(arithmos_fyllou)
REFERENCES fyllo(arithmos) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT con10
FOREIGN KEY(onoma_efimeridas)
REFERENCES fyllo(onoma_efimeridas) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT con11
FOREIGN KEY(email)
REFERENCES arxisintaktis(email) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO arthro VALUES
('C/User/arthro1.txt','Isopalia gia OSFP kai PAO','Description1',3,'2020-11-28','accepted',2,4,1,'Proto Thema','erg4@protothema.com'),
('C/User/arthro2.txt','Megali Oikonomiki Krisi','Description2',5,'2020-11-26','accepted',1,6,1,'Proto Thema','erg4@protothema.com'),
('C/User/arthro3.txt','Krisimes Sxeseis Elladas kai Toyrkias','Description3',3,'2020-11-25','accepted',1,7,1,'Kathimerini','erg4@kathimerini.com'),
('C/User/arthro4.txt','Niki gia tin Aek','Description4',2,'2020-11-27','accepted',2,4,1,'Kathimerini','erg4@kathimerini.com'),
('C/User/arthro5.txt','Ntermpi Paok kai Ari','Description5',6,'2020-11-28','accepted',3,4,1,'Kathimerini','erg4@kathimerini.com'),
('C/User/arthro6.txt','Anevike i Anergeia','Description6',8,'2020-11-29',null,null,4,1,'Kathimerini',null);



CREATE TABLE ypovoli
(
email VARCHAR(50),
path VARCHAR(50),
imerominia_ypovolis DATE,
PRIMARY KEY(email,path),
CONSTRAINT con12
FOREIGN KEY(email) REFERENCES
dimosiografos(email) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT con13
FOREIGN KEY(path) REFERENCES
arthro(path) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO ypovoli VALUES

('erg1@protothema.com','C/User/arthro1.txt','2020-10-30'),

('erg2@protothema.com','C/User/arthro2.txt','2020-10-29'),

('erg1@kathimerini.com','C/User/arthro3.txt','2020-10-30'),

('erg2@kathimerini.com','C/User/arthro4.txt','2020-10-28'),

('erg1@kathimerini.com','C/User/arthro5.txt','2020-10-27'),

('erg2@kathimerini.com','C/User/arthro6.txt','2020-10-25');


CREATE TABLE leksikleidi
(
path VARCHAR(50),
leksi VARCHAR(50),
PRIMARY KEY(path,leksi),
CONSTRAINT con14
FOREIGN KEY(path)
REFERENCES arthro(path) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO leksikleidi VALUES

('C/User/arthro6.txt','anergeia'),

('C/User/arthro5.txt','podosfairo');

