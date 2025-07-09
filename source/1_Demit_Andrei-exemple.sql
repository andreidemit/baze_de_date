-- Cerere 1: Afișează prescripțiile cu numele pacienților, medicamentele, durata și instrucțiunile pentru specialiștii activi
SELECT 
    p.nume || ' ' || p.prenume AS nume_pacient,
    m.denumire AS medicament,
    DECODE(pr.durata_tratament, NULL, 'Nespecificat', pr.durata_tratament || ' zile') AS durata,
    NVL(pr.instructiuni, 'Fără instrucțiuni') AS instructiuni
FROM pacienti p
JOIN prescriptii pr ON p.cod_pacient = pr.cod_pacient
JOIN medicamente m ON pr.cod_medicament = m.cod_medicament
WHERE pr.cod_specialist IN (
    SELECT s.cod_specialist
    FROM specialisti s
    WHERE s.activ = 'Y'
)
ORDER BY p.nume, m.denumire;


-- Cerere 2: Extrage detaliile pacienților cu numele de utilizator din email, lungimea email-ului și sexul explicit
SELECT 
    detalii.nume_pacient,
    SUBSTR(detalii.email, 1, INSTR(detalii.email, '@') - 1) AS username_email,
    LENGTH(detalii.email) AS lungime_email,
    CASE
        WHEN detalii.sex = 'M' THEN 'Masculin'
        WHEN detalii.sex = 'F' THEN 'Feminin'
        ELSE 'Necunoscut'
    END AS sex_explicit
FROM (
    SELECT 
        p.cod_pacient, p.nume || ' ' || p.prenume AS nume_pacient, p.email, p.sex
    FROM pacienti p
) detalii;


-- Cerere 3: Numără diagnosticele pe specialist și arată data ultimului diagnostic (doar specialiștii cu 2+ diagnostice)
SELECT 
    rez.nume_specialist,
    COUNT(rez.cod_diagnostic) AS nr_diagnostice,
    MAX(rez.data_diagnostic) AS ultima_diagnosticare
FROM (
    SELECT 
        d.cod_diagnostic,
        s.nume || ' ' || s.prenume AS nume_specialist,
        d.data_diagnostic
    FROM diagnostice d
    JOIN specialisti s ON d.cod_specialist = s.cod_specialist
    JOIN pacienti p ON d.cod_pacient = p.cod_pacient
) rez
GROUP BY rez.nume_specialist
HAVING COUNT(rez.cod_diagnostic) >= 2;


-- Cerere 4: Afișează informațiile pacienților cu vârsta în luni, formula de politețe și detaliile telefonului
SELECT 
    p.nume || ' ' || p.prenume AS pacient,
    TRUNC(MONTHS_BETWEEN(SYSDATE, p.data_nasterii)) AS luni_varsta,
    CASE
        WHEN p.sex = 'M' THEN 'DOMNUL'
        WHEN p.sex = 'F' THEN 'DOAMNA'
        ELSE 'PERSOANĂ'
    END AS formula_politete,
    NVL(p.telefon, 'Fără telefon') AS telefon
FROM pacienti p
ORDER BY luni_varsta DESC;


-- Cerere 5: Analizează rezultatele testelor psihologice (MMPI și Beck) cu interpretarea scorurilor și vârsta pacienților
WITH scoruri_relevante AS (
    SELECT 
        p.cod_pacient,
        p.nume || ' ' || p.prenume AS pacient,
        t.denumire AS test,
        rt.scor_obtinut,
        TRUNC(rt.data_aplicarii) AS data_test,
        MONTHS_BETWEEN(SYSDATE, p.data_nasterii) AS luni_varsta
    FROM pacienti p
    JOIN consultatii c ON p.cod_pacient = c.cod_pacient
    JOIN rezultate_teste rt ON c.cod_consultatie = rt.cod_consultatie
    JOIN teste_psihologice t ON rt.cod_test = t.cod_test
    WHERE t.acronim IN ('MMPI-2', 'BDI-II')
)
SELECT 
    pacient,
    test,
    scor_obtinut,
    data_test,
    DECODE(
        test,
        'MMPI-2', CASE 
                   WHEN scor_obtinut >= 70 THEN 'Profil borderline'
                   ELSE 'Normal'
                END,
        'BDI-II', CASE 
                   WHEN scor_obtinut >= 30 THEN 'Depresie severă'
                   WHEN scor_obtinut >= 20 THEN 'Depresie moderată'
                   ELSE 'Simptome ușoare'
                END,
        'Alt test'
    ) AS interpretare,
    ROUND(luni_varsta / 12, 1) AS varsta_ani
FROM scoruri_relevante
ORDER BY varsta_ani DESC, test;


-- Creare view: Vizualizare cuprinzătoare a pacienților diagnosticați cu detaliile specialistului și tulburării
CREATE OR REPLACE VIEW vw_pacienti_diagnosticati AS
SELECT
    p.cod_pacient,
    p.nume AS nume_pacient,
    p.prenume AS prenume_pacient,
    s.nume AS nume_specialist,
    t.denumire AS tulburare,
    t.severitate,
    d.data_diagnostic
FROM pacienti p
JOIN diagnostice d ON p.cod_pacient = d.cod_pacient
JOIN specialisti s ON d.cod_specialist = s.cod_specialist
JOIN tulburari_personalitate t ON d.cod_tulburare = t.cod_tulburare;


-- Operațiune de actualizare: Modifică data diagnosticului pentru un pacient și tulburare specifică
UPDATE vw_pacienti_diagnosticati
SET data_diagnostic = TO_DATE('2023-01-01', 'YYYY-MM-DD')
WHERE cod_pacient = 1 AND tulburare = 'Tulburare borderline';

-- Operațiune de inserare: Adaugă o nouă înregistrare de diagnostic pentru pacient
INSERT INTO vw_pacienti_diagnosticati (
    cod_pacient, nume_pacient, prenume_pacient, nume_specialist, tulburare, severitate, data_diagnostic
) VALUES (
    10, 'Nou', 'Pacient', 'Popescu', 'Tulburare X', 'MODERATA', SYSDATE
);

-- Obține lista tuturor pacienților, împreună cu:
-- numele testului aplicat (dacă există),
--scorul obținut (dacă a fost completat),
-- diagnosticul asociat (dacă a fost stabilit),
-- și medicamentul prescris (dacă există), chiar dacă pacientul nu are încă test, diagnostic sau prescripție.
SELECT 
    p.cod_pacient,
    p.nume || ' ' || p.prenume AS nume_pacient,
    t.denumire AS test_aplicat,
    rt.scor_obtinut,
    tp.denumire AS diagnostic,
    m.denumire AS medicament
FROM pacienti p
LEFT JOIN consultatii c ON p.cod_pacient = c.cod_pacient
LEFT JOIN rezultate_teste rt ON c.cod_consultatie = rt.cod_consultatie
LEFT JOIN teste_psihologice t ON rt.cod_test = t.cod_test
LEFT JOIN diagnostice d ON p.cod_pacient = d.cod_pacient
LEFT JOIN tulburari_personalitate tp ON d.cod_tulburare = tp.cod_tulburare
LEFT JOIN prescriptii pr ON p.cod_pacient = pr.cod_pacient
LEFT JOIN medicamente m ON pr.cod_medicament = m.cod_medicament;

-- Pentru fiecare pacient, verificăm dacă există vreun test pe care nu l-a făcut. Dacă nu există (adică a făcut toate), îl includem.
SELECT p.cod_pacient, p.nume || ' ' || p.prenume AS nume_pacient
FROM pacienti p
WHERE NOT EXISTS (
    SELECT t.cod_test
    FROM teste_psihologice t
    MINUS
    SELECT rt.cod_test
    FROM consultatii c
    JOIN rezultate_teste rt ON c.cod_consultatie = rt.cod_consultatie
    WHERE c.cod_pacient = p.cod_pacient
);

-- Afișează top 3 pacienți care au acumulat cele mai mari scoruri totale de intensitate a simptomelor.

SELECT *
FROM (
    SELECT 
        p.cod_pacient,
        p.nume || ' ' || p.prenume AS nume_pacient,
        SUM(sp.intensitate) AS intensitate_totala
    FROM pacienti p
    JOIN simptome_pacienti sp ON p.cod_pacient = sp.cod_pacient
    GROUP BY p.cod_pacient, p.nume, p.prenume
    ORDER BY intensitate_totala DESC
)
WHERE ROWNUM <= 3;


SELECT 
    p.cod_pacient,
    p.nume || ' ' || p.prenume AS nume_pacient,
    SUM(sp.intensitate) AS intensitate_totala
FROM pacienti p
JOIN simptome_pacienti sp ON p.cod_pacient = sp.cod_pacient
GROUP BY p.cod_pacient, p.nume, p.prenume
ORDER BY intensitate_totala DESC
FETCH FIRST 3 ROWS ONLY;