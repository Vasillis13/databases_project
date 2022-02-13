DELIMITER $
CREATE PROCEDURE show_fyllo(IN fyl INT, IN ef VARCHAR(50))
BEGIN
DECLARE title VARCHAR(50);
DECLARE author VARCHAR(50);
DECLARE date_approved VARCHAR(50);
DECLARE page_start INT;
DECLARE pages INT;
DECLARE total_pages INT;
DECLARE free_pages INT;
DECLARE total_f INT;
DECLARE finishedFlag INT;

DECLARE mycursor CURSOR FOR
SELECT arthro.titlos, ypovoli.email,arthro.imerominia_eggrisis,arthro.selides
FROM arthro INNER JOIN ypovoli ON arthro.path = ypovoli.path
WHERE arthro.arithmos_fyllou=fyl AND arthro.onoma_efimeridas=ef AND arthro.apotelesma='accepted'
ORDER BY arthro.seira ASC;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;
OPEN mycursor;
SET finishedFlag=0;
SET page_start=0;
SET total_pages=0;
SET free_pages=0;
FETCH mycursor INTO title,author,date_approved,pages;

WHILE(finishedFlag=0) DO
SELECT title;
SELECT author;
SELECT date_approved;
SELECT page_start;
SELECT pages;
SET page_start = page_start + pages;
SET total_pages = total_pages + pages;
FETCH mycursor INTO title,author,date_approved,pages;
END WHILE;

SELECT selides INTO total_f
FROM fyllo WHERE arithmos=fyl AND onoma_efimeridas=ef;

IF(total_f > total_pages) THEN
SELECT 'To fyllo den exei kleisei akoma';
ELSE
SELECT 'To fyllo exei kleisei';
END IF;
CLOSE mycursor;
END$
DELIMITER ;

DELIMITER $
CREATE PROCEDURE update_misthos(IN email_dimosiografou VARCHAR(50))
BEGIN
DECLARE mydate DATE;
DECLARE mines INT;
DECLARE proip INT;
DECLARE imerominia_pros DATE;
DECLARE misth FLOAT;

SET mydate = CURDATE();

SELECT imerominia_proslipsis,proypiresia, misthos
INTO imerominia_pros,proip,misth
FROM ergazomenos INNER JOIN dimosiografos
ON ergazomenos.email = dimosiografos.email
WHERE dimosiografos.email = email_dimosiografou;

SET mines = abs(datediff(mydate,imerominia_pros))/30 + proip;
SET misth = misth + (0.5*mines/100);

UPDATE ergazomenos
SET ergazomenos.misthos=misth
WHERE ergazomenos.email = email_dimosiografou;

END$

DELIMITER ;

DELIMITER $
CREATE TRIGGER update_salary
BEFORE INSERT ON ergazomenos
FOR EACH ROW
BEGIN
SET NEW.misthos=650.00;
END$
DELIMITER ;

DELIMITER $
CREATE TRIGGER update_arthro
AFTER INSERT ON ypovoli
FOR EACH ROW
BEGIN
DECLARE checkemail VARCHAR(50);
SELECT DISTINCT ypovoli.email INTO checkemail
FROM ypovoli INNER JOIN dimosiografos
ON ypovoli.email = dimosiografos.email
INNER JOIN arxisintaktis
ON dimosiografos.email = arxisintaktis.email
WHERE dimosiografos.email = NEW.email AND ypovoli.path = NEW.path;

if (checkemail IS NOT NULL)
THEN
UPDATE arthro 
SET apotelesma ='accepted' WHERE path = NEW.path;
END IF;
END$
DELIMITER ;

DELIMITER $
CREATE TRIGGER check_arthro
BEFORE INSERT ON arthro
FOR EACH ROW
BEGIN
DECLARE checkSelides INT;
DECLARE checkSum INT;
SET checkSelides=0;
SET checkSum=0;

SELECT SUM(selides) INTO checkSum
FROM arthro
WHERE arithmos_fyllou = NEW.arithmos_fyllou AND onoma_efimeridas = NEW.onoma_efimeridas
AND apotelesma = 'accepted';

SELECT selides INTO checkSelides
FROM fyllo
WHERE fyllo.arithmos = NEW.arithmos_fyllou AND onoma_efimeridas = NEW.onoma_efimeridas;

IF ((abs(checkSelides - checkSum)) < NEW.selides)
THEN
SIGNAL SQLSTATE VALUE '45000'
SET MESSAGE_TEXT = 'Too many pages';
END IF;
END$
DELIMITER ;
