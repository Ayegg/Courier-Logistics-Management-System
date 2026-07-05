-- Stergerea tabelelor in caz ca exista deja (pentru a putea rula scriptul de mai multe ori)
-- Ordinea este inversa crearii pentru a respecta constrangerile de chei externe
DROP TABLE dcColet CASCADE CONSTRAINTS;
DROP TABLE cbCurier CASCADE CONSTRAINTS;
DROP TABLE cbDepozit CASCADE CONSTRAINTS;
DROP TABLE cbTarif CASCADE CONSTRAINTS;
DROP TABLE cbOras CASCADE CONSTRAINTS;

-- 1. Creare tabel cbOras
CREATE TABLE cbOras (
    orasID VARCHAR2(10) PRIMARY KEY,
    nume VARCHAR2(50) NOT NULL
);

-- 2. Creare tabel cbTarif
CREATE TABLE cbTarif (
    orasPlecare VARCHAR2(10),
    orasDestinatie VARCHAR2(10),
    km NUMBER(6,2),
    tarif NUMBER(8,2),
    CONSTRAINT pk_cbTarif PRIMARY KEY (orasPlecare, orasDestinatie),
    CONSTRAINT fk_tarif_plecare FOREIGN KEY (orasPlecare) REFERENCES cbOras(orasID),
    CONSTRAINT fk_tarif_dest FOREIGN KEY (orasDestinatie) REFERENCES cbOras(orasID)
);

-- 3. Creare tabel cbDepozit
CREATE TABLE cbDepozit (
    codDep VARCHAR2(10) PRIMARY KEY,
    adresa VARCHAR2(100),
    oras VARCHAR2(10),
    tel VARCHAR2(15),
    CONSTRAINT fk_depozit_oras FOREIGN KEY (oras) REFERENCES cbOras(orasID)
);

-- 4. Creare tabel cbCurier
CREATE TABLE cbCurier (
    curierID VARCHAR2(10) PRIMARY KEY,
    cnp VARCHAR2(13) UNIQUE NOT NULL,
    nume VARCHAR2(50) NOT NULL,
    tel VARCHAR2(15),
    nrMas VARCHAR2(15)
);

-- 5. Creare tabel dcColet
CREATE TABLE dcColet (
    colID VARCHAR2(10) PRIMARY KEY,
    curierID VARCHAR2(10),
    data DATE,
    codDep VARCHAR2(10),
    greutate NUMBER(5,2),
    adresa VARCHAR2(100),
    oras VARCHAR2(10),
    CONSTRAINT fk_colet_curier FOREIGN KEY (curierID) REFERENCES cbCurier(curierID),
    CONSTRAINT fk_colet_depozit FOREIGN KEY (codDep) REFERENCES cbDepozit(codDep),
    CONSTRAINT fk_colet_oras FOREIGN KEY (oras) REFERENCES cbOras(orasID)
);
