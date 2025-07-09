
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
    WHERE t.denumire IN ('MMPI', 'Beck')
)
SELECT 
    pacient,
    test,
    scor_obtinut,
    data_test,
    DECODE(
        test,
        'MMPI', CASE 
                   WHEN scor_obtinut >= 70 THEN 'Profil borderline'
                   ELSE 'Normal'
                END,
        'Beck', CASE 
                   WHEN scor_obtinut >= 30 THEN 'Depresie severă'
                   WHEN scor_obtinut >= 20 THEN 'Depresie moderată'
                   ELSE 'Simptome ușoare'
                END,
        'Alt test'
    ) AS interpretare,
    ROUND(luni_varsta / 12, 1) AS varsta_ani
FROM scoruri_relevante
ORDER BY varsta_ani DESC, test;
