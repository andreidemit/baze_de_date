-- ========================================
-- MANAGEMENT SECVENȚE - BAZA DE DATE PSIHOLOGIE
-- ========================================
-- Autor: Demit Andrei
-- Data: July 2025
-- Descriere: Script pentru managementul complet al secvențelor

-- ========================================
-- 1. ELIMINAREA TUTUROR SECVENȚELOR
-- ========================================

CREATE OR REPLACE PROCEDURE drop_all_sequences AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('ELIMINAREA SECVENȚELOR EXISTENTE...');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    
    -- Elimină fiecare secvență individual
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_pacienti';
        DBMS_OUTPUT.PUT_LINE('✓ seq_pacienti eliminată');
    EXCEPTION
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('⚠️ seq_pacienti nu există');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_specialisti';
        DBMS_OUTPUT.PUT_LINE('✓ seq_specialisti eliminată');
    EXCEPTION
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('⚠️ seq_specialisti nu există');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_specialitati';
        DBMS_OUTPUT.PUT_LINE('✓ seq_specialitati eliminată');
    EXCEPTION
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('⚠️ seq_specialitati nu există');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_categorii_varsta';
        DBMS_OUTPUT.PUT_LINE('✓ seq_categorii_varsta eliminată');
    EXCEPTION
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('⚠️ seq_categorii_varsta nu există');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_consultatii';
        DBMS_OUTPUT.PUT_LINE('✓ seq_consultatii eliminată');
    EXCEPTION
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('⚠️ seq_consultatii nu există');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_teste_psihologice';
        DBMS_OUTPUT.PUT_LINE('✓ seq_teste_psihologice eliminată');
    EXCEPTION
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('⚠️ seq_teste_psihologice nu există');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_rezultate_teste';
        DBMS_OUTPUT.PUT_LINE('✓ seq_rezultate_teste eliminată');
    EXCEPTION
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('⚠️ seq_rezultate_teste nu există');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_tulburari_personalitate';
        DBMS_OUTPUT.PUT_LINE('✓ seq_tulburari_personalitate eliminată');
    EXCEPTION
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('⚠️ seq_tulburari_personalitate nu există');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_diagnostice';
        DBMS_OUTPUT.PUT_LINE('✓ seq_diagnostice eliminată');
    EXCEPTION
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('⚠️ seq_diagnostice nu există');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_medicamente';
        DBMS_OUTPUT.PUT_LINE('✓ seq_medicamente eliminată');
    EXCEPTION
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('⚠️ seq_medicamente nu există');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_prescriptii';
        DBMS_OUTPUT.PUT_LINE('✓ seq_prescriptii eliminată');
    EXCEPTION
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('⚠️ seq_prescriptii nu există');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_simptome';
        DBMS_OUTPUT.PUT_LINE('✓ seq_simptome eliminată');
    EXCEPTION
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('⚠️ seq_simptome nu există');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_simptome_pacienti';
        DBMS_OUTPUT.PUT_LINE('✓ seq_simptome_pacienti eliminată');
    EXCEPTION
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('⚠️ seq_simptome_pacienti nu există');
    END;
    
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('ELIMINAREA SECVENȚELOR FINALIZATĂ!');
END;
/

-- ========================================
-- 2. RESETAREA TUTUROR SECVENȚELOR
-- ========================================

CREATE OR REPLACE PROCEDURE reset_all_sequences AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('RESETAREA SECVENȚELOR LA VALOAREA 1...');
    DBMS_OUTPUT.PUT_LINE('==========================================');
    
    -- Elimină și recreează secvențele
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_pacienti';
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_pacienti START WITH 1 INCREMENT BY 1 NOCACHE';
    DBMS_OUTPUT.PUT_LINE('✓ seq_pacienti resetată');
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_specialisti';
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_specialisti START WITH 1 INCREMENT BY 1 NOCACHE';
    DBMS_OUTPUT.PUT_LINE('✓ seq_specialisti resetată');
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_specialitati';
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_specialitati START WITH 1 INCREMENT BY 1 NOCACHE';
    DBMS_OUTPUT.PUT_LINE('✓ seq_specialitati resetată');
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_categorii_varsta';
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_categorii_varsta START WITH 1 INCREMENT BY 1 NOCACHE';
    DBMS_OUTPUT.PUT_LINE('✓ seq_categorii_varsta resetată');
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_consultatii';
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_consultatii START WITH 1 INCREMENT BY 1 NOCACHE';
    DBMS_OUTPUT.PUT_LINE('✓ seq_consultatii resetată');
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_teste_psihologice';
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_teste_psihologice START WITH 1 INCREMENT BY 1 NOCACHE';
    DBMS_OUTPUT.PUT_LINE('✓ seq_teste_psihologice resetată');
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_rezultate_teste';
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_rezultate_teste START WITH 1 INCREMENT BY 1 NOCACHE';
    DBMS_OUTPUT.PUT_LINE('✓ seq_rezultate_teste resetată');
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_tulburari_personalitate';
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_tulburari_personalitate START WITH 1 INCREMENT BY 1 NOCACHE';
    DBMS_OUTPUT.PUT_LINE('✓ seq_tulburari_personalitate resetată');
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_diagnostice';
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_diagnostice START WITH 1 INCREMENT BY 1 NOCACHE';
    DBMS_OUTPUT.PUT_LINE('✓ seq_diagnostice resetată');
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_medicamente';
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_medicamente START WITH 1 INCREMENT BY 1 NOCACHE';
    DBMS_OUTPUT.PUT_LINE('✓ seq_medicamente resetată');
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_prescriptii';
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_prescriptii START WITH 1 INCREMENT BY 1 NOCACHE';
    DBMS_OUTPUT.PUT_LINE('✓ seq_prescriptii resetată');
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_simptome';
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_simptome START WITH 1 INCREMENT BY 1 NOCACHE';
    DBMS_OUTPUT.PUT_LINE('✓ seq_simptome resetată');
    
    BEGIN
        EXECUTE IMMEDIATE 'DROP SEQUENCE seq_simptome_pacienti';
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_simptome_pacienti START WITH 1 INCREMENT BY 1 NOCACHE';
    DBMS_OUTPUT.PUT_LINE('✓ seq_simptome_pacienti resetată');
    
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('RESETAREA SECVENȚELOR FINALIZATĂ!');
END;
/

-- ========================================
-- 3. CREAREA TUTUROR SECVENȚELOR
-- ========================================

CREATE OR REPLACE PROCEDURE create_all_sequences AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('CREAREA TUTUROR SECVENȚELOR...');
    DBMS_OUTPUT.PUT_LINE('==================================');
    
    -- Creează secvențele doar dacă nu există
    BEGIN
        EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_pacienti START WITH 1 INCREMENT BY 1 NOCACHE';
        DBMS_OUTPUT.PUT_LINE('✓ seq_pacienti creată');
    EXCEPTION 
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('⚠️ seq_pacienti există deja');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_specialisti START WITH 1 INCREMENT BY 1 NOCACHE';
        DBMS_OUTPUT.PUT_LINE('✓ seq_specialisti creată');
    EXCEPTION 
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('⚠️ seq_specialisti există deja');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_specialitati START WITH 1 INCREMENT BY 1 NOCACHE';
        DBMS_OUTPUT.PUT_LINE('✓ seq_specialitati creată');
    EXCEPTION 
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('⚠️ seq_specialitati există deja');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_categorii_varsta START WITH 1 INCREMENT BY 1 NOCACHE';
        DBMS_OUTPUT.PUT_LINE('✓ seq_categorii_varsta creată');
    EXCEPTION 
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('⚠️ seq_categorii_varsta există deja');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_consultatii START WITH 1 INCREMENT BY 1 NOCACHE';
        DBMS_OUTPUT.PUT_LINE('✓ seq_consultatii creată');
    EXCEPTION 
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('⚠️ seq_consultatii există deja');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_teste_psihologice START WITH 1 INCREMENT BY 1 NOCACHE';
        DBMS_OUTPUT.PUT_LINE('✓ seq_teste_psihologice creată');
    EXCEPTION 
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('⚠️ seq_teste_psihologice există deja');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_rezultate_teste START WITH 1 INCREMENT BY 1 NOCACHE';
        DBMS_OUTPUT.PUT_LINE('✓ seq_rezultate_teste creată');
    EXCEPTION 
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('⚠️ seq_rezultate_teste există deja');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_tulburari_personalitate START WITH 1 INCREMENT BY 1 NOCACHE';
        DBMS_OUTPUT.PUT_LINE('✓ seq_tulburari_personalitate creată');
    EXCEPTION 
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('⚠️ seq_tulburari_personalitate există deja');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_diagnostice START WITH 1 INCREMENT BY 1 NOCACHE';
        DBMS_OUTPUT.PUT_LINE('✓ seq_diagnostice creată');
    EXCEPTION 
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('⚠️ seq_diagnostice există deja');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_medicamente START WITH 1 INCREMENT BY 1 NOCACHE';
        DBMS_OUTPUT.PUT_LINE('✓ seq_medicamente creată');
    EXCEPTION 
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('⚠️ seq_medicamente există deja');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_prescriptii START WITH 1 INCREMENT BY 1 NOCACHE';
        DBMS_OUTPUT.PUT_LINE('✓ seq_prescriptii creată');
    EXCEPTION 
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('⚠️ seq_prescriptii există deja');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_simptome START WITH 1 INCREMENT BY 1 NOCACHE';
        DBMS_OUTPUT.PUT_LINE('✓ seq_simptome creată');
    EXCEPTION 
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('⚠️ seq_simptome există deja');
    END;
    
    BEGIN
        EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_simptome_pacienti START WITH 1 INCREMENT BY 1 NOCACHE';
        DBMS_OUTPUT.PUT_LINE('✓ seq_simptome_pacienti creată');
    EXCEPTION 
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('⚠️ seq_simptome_pacienti există deja');
    END;
    
    DBMS_OUTPUT.PUT_LINE('==================================');
    DBMS_OUTPUT.PUT_LINE('🎯 CREAREA SECVENȚELOR FINALIZATĂ!');
END;
/

-- ========================================
-- 4. AFIȘAREA STĂRII SECVENȚELOR
-- ========================================

CREATE OR REPLACE PROCEDURE show_sequences_status AS
    CURSOR seq_cursor IS 
        SELECT sequence_name, last_number 
        FROM user_sequences 
        WHERE sequence_name LIKE 'SEQ_%'
        ORDER BY sequence_name;
    
    seq_count NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('STAREA CURENTĂ A SECVENȚELOR');
    DBMS_OUTPUT.PUT_LINE('================================');
    DBMS_OUTPUT.PUT_LINE('NUME SECVENȚĂ                     | VALOARE CURENTĂ');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------|----------------');
    
    FOR seq_rec IN seq_cursor LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD(seq_rec.sequence_name, 35) || '| ' || seq_rec.last_number);
        seq_count := seq_count + 1;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('================================');
    DBMS_OUTPUT.PUT_LINE('Total secvențe găsite: ' || seq_count);
    
    IF seq_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('⚠️ Nu au fost găsite secvențe!');
    END IF;
END;
/

-- ========================================
-- GHID DE UTILIZARE
-- ========================================

/*
📖 GHID DE UTILIZARE:

1. Pentru ELIMINAREA tuturor secvențelor:
   EXEC drop_all_sequences;

2. Pentru RESETAREA tuturor secvențelor la 1:
   EXEC reset_all_sequences;

3. Pentru CREAREA tuturor secvențelor:
   EXEC create_all_sequences;

4. Pentru AFIȘAREA stării secvențelor:
   EXEC show_sequences_status;

5. Pentru INTEROGAREA manuală:
   SELECT sequence_name, last_number 
   FROM user_sequences 
   WHERE sequence_name LIKE 'SEQ_%'
   ORDER BY sequence_name;

📋 WORKFLOW RECOMANDAT:
1. EXEC drop_all_sequences;      -- Curăță totul
2. EXEC create_all_sequences;    -- Recreează cu valori fresh
3. -- Rulează scriptul de inserare date
4. EXEC show_sequences_status;   -- Verifică starea finală
*/

-- Afișează ghidul la sfârșitul execuției
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('PROCEDURILE DE MANAGEMENT SECVENȚE AU FOST CREATE!');
    DBMS_OUTPUT.PUT_LINE('=====================================================');
    DBMS_OUTPUT.PUT_LINE('Utilizează: EXEC show_sequences_status; pentru a vedea starea curentă');
END;
/
