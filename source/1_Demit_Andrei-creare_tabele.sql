-- Procedura pentru recrearea tabelelor in ordinea corecta
-- Aceasta procedura elimina toate tabelele existente si le recreeaza in ordinea corecta
CREATE OR REPLACE PROCEDURE recreate_tables AS
BEGIN
    -- Initial, elimina toate tabelele existente in baza de date in ordinea invversata a crearii
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE simptome_pacienti CASCADE CONSTRAINTS';
    EXCEPTION
        WHEN OTHERS THEN NULL; --Ignora daca tabela nu exista
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE prescriptii CASCADE CONSTRAINTS';
    EXCEPTION
        WHEN OTHERS THEN NULL;
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE diagnostice CASCADE CONSTRAINTS';
    EXCEPTION
        WHEN OTHERS THEN NULL;
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE rezultate_teste CASCADE CONSTRAINTS';
    EXCEPTION
        WHEN OTHERS THEN NULL;
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE consultatii CASCADE CONSTRAINTS';
    EXCEPTION
        WHEN OTHERS THEN NULL;
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE tulburari_personalitate CASCADE CONSTRAINTS';
    EXCEPTION
        WHEN OTHERS THEN NULL;
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE teste_psihologice CASCADE CONSTRAINTS';
    EXCEPTION
        WHEN OTHERS THEN NULL;
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE simptome CASCADE CONSTRAINTS';
    EXCEPTION
        WHEN OTHERS THEN NULL;
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE medicamente CASCADE CONSTRAINTS';
    EXCEPTION
        WHEN OTHERS THEN NULL;
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE specialisti CASCADE CONSTRAINTS';
    EXCEPTION
        WHEN OTHERS THEN NULL;
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE pacienti CASCADE CONSTRAINTS';
    EXCEPTION
        WHEN OTHERS THEN NULL;
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE specialitati CASCADE CONSTRAINTS';
    EXCEPTION
        WHEN OTHERS THEN NULL;
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE categorii_varsta CASCADE CONSTRAINTS';
    EXCEPTION
        WHEN OTHERS THEN NULL;
    END;
    
    -- Acuma recreeaza tabelele in ordinea corecta
    
    -- Ordine de creare 1
    EXECUTE IMMEDIATE '
    CREATE TABLE categorii_varsta (
        cod_categorie_varsta NUMBER PRIMARY KEY,
        denumire VARCHAR2(50) NOT NULL,
        varsta_minima NUMBER NOT NULL,
        varsta_maxima NUMBER NOT NULL,
        descriere VARCHAR2(200)
    )';
    
    -- Ordine de creare 2
    EXECUTE IMMEDIATE '
    CREATE TABLE specialitati (
        cod_specialitate NUMBER PRIMARY KEY,
        denumire VARCHAR2(100) NOT NULL,
        prescrie_medicamente CHAR(1) DEFAULT ''N'' CHECK (prescrie_medicamente IN (''Y'', ''N'')),
        descriere VARCHAR2(500)
    )';
    
    -- Ordine de creare 3
    EXECUTE IMMEDIATE '
    CREATE TABLE pacienti (
        cod_pacient NUMBER PRIMARY KEY,
        cnp VARCHAR2(13) UNIQUE NOT NULL,
        nume VARCHAR2(50) NOT NULL,
        prenume VARCHAR2(50) NOT NULL,
        data_nasterii DATE NOT NULL,
        sex CHAR(1) CHECK (sex IN (''M'', ''F'')) NOT NULL,
        telefon VARCHAR2(20),
        email VARCHAR2(100),
        adresa VARCHAR2(200),
        cod_categorie_varsta NUMBER NOT NULL,
        data_inregistrarii DATE DEFAULT SYSDATE,
        reprezentant_legal VARCHAR2(100),
        FOREIGN KEY (cod_categorie_varsta) REFERENCES categorii_varsta(cod_categorie_varsta)
    )';
    
    -- Ordine de creare 4
    EXECUTE IMMEDIATE '
    CREATE TABLE specialisti (
        cod_specialist NUMBER PRIMARY KEY,
        nume VARCHAR2(50) NOT NULL,
        prenume VARCHAR2(50) NOT NULL,
        cod_specialitate NUMBER NOT NULL,
        nr_parafa VARCHAR2(20) UNIQUE NOT NULL,
        telefon VARCHAR2(20),
        email VARCHAR2(100),
        data_angajarii DATE DEFAULT SYSDATE,
        activ CHAR(1)  DEFAULT ''Y'' CHECK (activ IN (''Y'', ''N'')),
        FOREIGN KEY (cod_specialitate) REFERENCES specialitati(cod_specialitate)
    )';
    
    -- Ordine de creare 5
    EXECUTE IMMEDIATE '
    CREATE TABLE medicamente (
        cod_medicament NUMBER PRIMARY KEY,
        denumire VARCHAR2(100) NOT NULL,
        substanta_activa VARCHAR2(100) NOT NULL,
        concentratie VARCHAR2(50),
        forma_farmaceutica VARCHAR2(50),
        producator VARCHAR2(100),
        contraindicatii VARCHAR2(1000)
    )';
    
    -- Ordine de creare 6
    EXECUTE IMMEDIATE '
    CREATE TABLE simptome (
        cod_simptom NUMBER PRIMARY KEY,
        denumire VARCHAR2(100) NOT NULL,
        descriere VARCHAR2(500),
        categorie VARCHAR2(50)
    )';
    
    -- Ordine de creare 7
    EXECUTE IMMEDIATE '
    CREATE TABLE teste_psihologice (
        cod_test NUMBER PRIMARY KEY,
        denumire VARCHAR2(100) NOT NULL,
        acronim VARCHAR2(10),
        scor_minim NUMBER NOT NULL,
        scor_maxim NUMBER NOT NULL,
        durata_aplicare NUMBER,
        categorie_varsta_min NUMBER NOT NULL,
        categorie_varsta_max NUMBER NOT NULL,
        descriere VARCHAR2(1000)
    )';
    
    -- Ordine de creare 8
    EXECUTE IMMEDIATE '
    CREATE TABLE tulburari_personalitate (
        cod_tulburare NUMBER PRIMARY KEY,
        denumire VARCHAR2(100) NOT NULL,
        cod_dsm5 VARCHAR2(10),
        cod_icd11 VARCHAR2(10),
        cluster_personalitate CHAR(1) CHECK (cluster_personalitate IN (''A'', ''B'', ''C'')),
        severitate VARCHAR2(20) CHECK (severitate IN (''USOARA'', ''MODERATA'', ''SEVERA'')),
        descriere CLOB
    )';
    
    -- Ordine de creare 9
    EXECUTE IMMEDIATE '
    CREATE TABLE consultatii (
        cod_consultatie NUMBER PRIMARY KEY,
        cod_pacient NUMBER NOT NULL,
        cod_specialist NUMBER NOT NULL,
        data_consultatie DATE NOT NULL,
        ora_consultatie VARCHAR2(5) NOT NULL,
        durata_minute NUMBER DEFAULT 50 CHECK (durata_minute > 0),
        tip_consultatie VARCHAR2(20) CHECK (tip_consultatie IN (''EVALUARE_INITIALA'', ''CONTROL'', ''TERAPIE'')),
        observatii CLOB,
        cost NUMBER(8,2) CHECK (cost >= 0),
        FOREIGN KEY (cod_pacient) REFERENCES pacienti(cod_pacient),
        FOREIGN KEY (cod_specialist) REFERENCES specialisti(cod_specialist)
    )';
    
    -- Ordine de creare 10
    EXECUTE IMMEDIATE '
    CREATE TABLE rezultate_teste (
        cod_rezultat NUMBER PRIMARY KEY,
        cod_test NUMBER NOT NULL,
        cod_consultatie NUMBER NOT NULL,
        scor_obtinut NUMBER NOT NULL,
        interpretare VARCHAR2(500),
        data_aplicarii DATE DEFAULT SYSDATE,
        observatii VARCHAR2(1000),
        FOREIGN KEY (cod_test) REFERENCES teste_psihologice(cod_test),
        FOREIGN KEY (cod_consultatie) REFERENCES consultatii(cod_consultatie)
    )';
    
    -- Ordine de creare 11
    EXECUTE IMMEDIATE '
    CREATE TABLE diagnostice (
        cod_diagnostic NUMBER PRIMARY KEY,
        cod_pacient NUMBER NOT NULL,
        cod_tulburare NUMBER NOT NULL,
        cod_specialist NUMBER NOT NULL,
        data_diagnostic DATE DEFAULT SYSDATE,
        certitudinea VARCHAR2(20) CHECK (certitudinea IN (''CONFIRMAT'', ''PROBABILIST'', ''DIFERENTIAL'')),
        observatii VARCHAR2(1000),
        FOREIGN KEY (cod_pacient) REFERENCES pacienti(cod_pacient),
        FOREIGN KEY (cod_tulburare) REFERENCES tulburari_personalitate(cod_tulburare),
        FOREIGN KEY (cod_specialist) REFERENCES specialisti(cod_specialist)
    )';
    
    -- Ordine de creare 12
    EXECUTE IMMEDIATE '
    CREATE TABLE prescriptii (
        cod_prescriptie NUMBER PRIMARY KEY,
        cod_pacient NUMBER NOT NULL,
        cod_specialist NUMBER NOT NULL,
        cod_medicament NUMBER NOT NULL,
        data_prescriptie DATE DEFAULT SYSDATE,
        doza VARCHAR2(100) NOT NULL,
        frecventa VARCHAR2(100) NOT NULL,
        durata_tratament NUMBER,
        instructiuni VARCHAR2(500),
        FOREIGN KEY (cod_pacient) REFERENCES pacienti(cod_pacient),
        FOREIGN KEY (cod_specialist) REFERENCES specialisti(cod_specialist),
        FOREIGN KEY (cod_medicament) REFERENCES medicamente(cod_medicament)
    )';
    
    -- Ordine de creare 13
    EXECUTE IMMEDIATE '
    CREATE TABLE simptome_pacienti (
        cod_simptom_pacient NUMBER PRIMARY KEY,
        cod_pacient NUMBER NOT NULL,
        cod_simptom NUMBER NOT NULL,
        data_aparitie DATE,
        intensitate NUMBER CHECK (intensitate BETWEEN 1 AND 10),
        observatii VARCHAR2(500),
        FOREIGN KEY (cod_pacient) REFERENCES pacienti(cod_pacient),
        FOREIGN KEY (cod_simptom) REFERENCES simptome(cod_simptom)
    )';
    
    DBMS_OUTPUT.PUT_LINE('All tables have been successfully recreated!');
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
        RAISE;
END;
/

-- executa procedura pentru a recrea tabelele
-- Asigura-te ca ai privilegiile necesare pentru a crea tabele
-- EXEC recreate_tables;

-- DBA trebuie sa ruleze aceste comenzi pentru utilizatorul tau (inlocuieste 'your_username' cu numele real al utilizatorului) ca sa-ti permita sa creezi/elimini tabele.
GRANT CREATE TABLE TO your_username;
GRANT CREATE ANY TABLE TO your_username;
GRANT DROP ANY TABLE TO your_username;
GRANT UNLIMITED TABLESPACE TO your_username;