-- Golirea tabelelor inainte de inserare
DELETE FROM dcColet;
DELETE FROM cbCurier;
DELETE FROM cbDepozit;
DELETE FROM cbTarif;
DELETE FROM cbOras;

-- INSERARE 8 ORASE
INSERT ALL
    INTO cbOras (orasID, nume) VALUES ('tm1', 'Timisoara')
    INTO cbOras (orasID, nume) VALUES ('tm2', 'Lugoj')
    INTO cbOras (orasID, nume) VALUES ('ar1', 'Arad')
    INTO cbOras (orasID, nume) VALUES ('cs1', 'Resita')
    INTO cbOras (orasID, nume) VALUES ('bh1', 'Oradea')
    INTO cbOras (orasID, nume) VALUES ('cj1', 'Cluj-Napoca')
    INTO cbOras (orasID, nume) VALUES ('b1', 'Bucuresti')
    INTO cbOras (orasID, nume) VALUES ('sb1', 'Sibiu')
SELECT * FROM dual;

-- INSERARE 6 DEPOZITE
INSERT ALL
    INTO cbDepozit (codDep, adresa, oras, tel) VALUES ('DTM01', 'Calea Sagului 1', 'tm1', '0711111111')
    INTO cbDepozit (codDep, adresa, oras, tel) VALUES ('DTM02', 'Gheorghe Lazar 2', 'tm1', '0711111112')
    INTO cbDepozit (codDep, adresa, oras, tel) VALUES ('DAR01', 'Aurel Vlaicu 3', 'ar1', '0711111113')
    INTO cbDepozit (codDep, adresa, oras, tel) VALUES ('DCS01', 'Traian Vuia 4', 'cs1', '0711111114')
    INTO cbDepozit (codDep, adresa, oras, tel) VALUES ('DBH01', 'Emanoil Gojdu 5', 'bh1', '0711111115')
    INTO cbDepozit (codDep, adresa, oras, tel) VALUES ('DCJ01', 'Fagetului 6', 'cj1', '0711111116')
SELECT * FROM dual;

-- INSERARE 8 CURIERI
INSERT ALL
    INTO cbCurier (curierID, cnp, nume, tel, nrMas) VALUES ('C001', '1900101000001', 'Popescu Ion', '0722222221', 'TM01ABC')
    INTO cbCurier (curierID, cnp, nume, tel, nrMas) VALUES ('C002', '1900101000002', 'Ionescu Vasile', '0722222222', 'TM02DEF')
    INTO cbCurier (curierID, cnp, nume, tel, nrMas) VALUES ('C003', '1900101000003', 'Radu Mihai', '0722222223', 'AR01GHI')
    INTO cbCurier (curierID, cnp, nume, tel, nrMas) VALUES ('C004', '1900101000004', 'Stan Andrei', '0722222224', 'CS01JKL')
    INTO cbCurier (curierID, cnp, nume, tel, nrMas) VALUES ('C005', '1900101000005', 'Ilie Florin', '0722222225', 'BH01MNO')
    INTO cbCurier (curierID, cnp, nume, tel, nrMas) VALUES ('C006', '1900101000006', 'Dima George', '0722222226', 'CJ01PQR')
    INTO cbCurier (curierID, cnp, nume, tel, nrMas) VALUES ('C007', '1900101000007', 'Lungu Stefan', '0722222227', 'B01STU')
    INTO cbCurier (curierID, cnp, nume, tel, nrMas) VALUES ('C008', '1900101000008', 'Marin Alexandru', '0722222228', 'SB01VWX')
SELECT * FROM dual;

-- INSERARE 20 TARIFE (orasPlecare corespunde celor 6 depozite: tm1, ar1, cs1, bh1, cj1)
INSERT ALL
    INTO cbTarif (orasPlecare, orasDestinatie, km, tarif) VALUES ('tm1', 'tm2', 60.5, 50)
    INTO cbTarif (orasPlecare, orasDestinatie, km, tarif) VALUES ('tm1', 'ar1', 50.0, 45)
    INTO cbTarif (orasPlecare, orasDestinatie, km, tarif) VALUES ('tm1', 'cs1', 100.0, 80)
    INTO cbTarif (orasPlecare, orasDestinatie, km, tarif) VALUES ('tm1', 'b1', 550.0, 200)
    INTO cbTarif (orasPlecare, orasDestinatie, km, tarif) VALUES ('ar1', 'tm1', 50.0, 45)
    INTO cbTarif (orasPlecare, orasDestinatie, km, tarif) VALUES ('ar1', 'bh1', 115.0, 90)
    INTO cbTarif (orasPlecare, orasDestinatie, km, tarif) VALUES ('ar1', 'b1', 600.0, 220)
    INTO cbTarif (orasPlecare, orasDestinatie, km, tarif) VALUES ('ar1', 'cj1', 250.0, 150)
    INTO cbTarif (orasPlecare, orasDestinatie, km, tarif) VALUES ('cs1', 'tm1', 100.0, 80)
    INTO cbTarif (orasPlecare, orasDestinatie, km, tarif) VALUES ('cs1', 'tm2', 60.0, 50)
    INTO cbTarif (orasPlecare, orasDestinatie, km, tarif) VALUES ('cs1', 'b1', 450.0, 180)
    INTO cbTarif (orasPlecare, orasDestinatie, km, tarif) VALUES ('cs1', 'sb1', 280.0, 160)
    INTO cbTarif (orasPlecare, orasDestinatie, km, tarif) VALUES ('bh1', 'ar1', 115.0, 90)
    INTO cbTarif (orasPlecare, orasDestinatie, km, tarif) VALUES ('bh1', 'cj1', 150.0, 110)
    INTO cbTarif (orasPlecare, orasDestinatie, km, tarif) VALUES ('bh1', 'tm1', 160.0, 120)
    INTO cbTarif (orasPlecare, orasDestinatie, km, tarif) VALUES ('bh1', 'b1', 600.0, 230)
    INTO cbTarif (orasPlecare, orasDestinatie, km, tarif) VALUES ('cj1', 'bh1', 150.0, 110)
    INTO cbTarif (orasPlecare, orasDestinatie, km, tarif) VALUES ('cj1', 'ar1', 250.0, 150)
    INTO cbTarif (orasPlecare, orasDestinatie, km, tarif) VALUES ('cj1', 'sb1', 170.0, 130)
    INTO cbTarif (orasPlecare, orasDestinatie, km, tarif) VALUES ('cj1', 'b1', 450.0, 180)
SELECT * FROM dual;

-- INSERARE 30 COLETE
DECLARE
    v_data DATE := TO_DATE('24-04-2023', 'DD-MM-YYYY');
BEGIN
    FOR i IN 1..30 LOOP
        INSERT INTO dcColet (colID, curierID, data, codDep, greutate, adresa, oras)
        VALUES (
            'COL' || LPAD(i, 3, '0'), 
            'C00' || (MOD(i, 8) + 1),  -- Aici am adaugat parantezele!
            v_data + MOD(i, 5), 
            CASE MOD(i, 6) 
                WHEN 0 THEN 'DTM01' WHEN 1 THEN 'DTM02' WHEN 2 THEN 'DAR01' 
                WHEN 3 THEN 'DCS01' WHEN 4 THEN 'DBH01' ELSE 'DCJ01' 
            END,
            ROUND(DBMS_RANDOM.VALUE(0.5, 20.0), 2), 
            'Adresa Destinatie ' || i, 
            CASE MOD(i, 8)
                WHEN 0 THEN 'tm1' WHEN 1 THEN 'tm2' WHEN 2 THEN 'ar1' WHEN 3 THEN 'cs1'
                WHEN 4 THEN 'bh1' WHEN 5 THEN 'cj1' WHEN 6 THEN 'b1' ELSE 'sb1'
            END
        );
    END LOOP;
    COMMIT;
END;
