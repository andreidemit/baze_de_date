## 1. **Descrierea modelului real, a utilității acestuia și a regulilor de funcționare**

### Modelul real

Sistemul propus este o bază de date destinată clinicilor și cabinetelor de psihiatrie și psihologie, având ca scop facilitarea evaluării, diagnosticării și monitorizării pacienților cu suspiciuni de tulburări de personalitate.

### Utilitatea sistemului

- **Evaluare sistematică:** Permite aplicarea standardizată a testelor psihologice și a instrumentelor de screening.
- **Istoric medical complet:** Păstrează evidența consultațiilor, simptomelor și tratamentelor pentru fiecare pacient.
- **Diagnostic diferențial:** Facilitează identificarea și diferențierea tulburărilor de personalitate.
- **Monitorizare progres:** Urmărește evoluția pacienților în timp și eficiența tratamentelor aplicate.
- **Gestionare resurse:** Optimizează programarea consultațiilor și alocarea specialiștilor.

### Regulile de funcționare

1. **Evaluarea pacienților:**
    - Fiecare pacient poate fi evaluat de unul sau mai mulți specialiști (psihiatri sau psihologi).
    - Evaluarea se realizează prin aplicarea de teste standardizate (ex: MMPI, Beck, Hamilton).

2. **Interpretarea rezultatelor:**
    - Rezultatele testelor sunt interpretate și consemnate în fișa pacientului.
    - Diagnosticul se stabilește conform criteriilor DSM-5 sau ICD-11.

3. **Prescrierea tratamentelor:**
    - Psihiatrii pot prescrie medicamente.
    - Psihologii pot recomanda terapii.

4. **Monitorizarea pacienților:**
    - Consultațiile de control sunt programate periodic pentru monitorizarea evoluției pacientului.

## 2. Prezentarea constrângerilor (restricții, reguli) impuse asupra modelului

### Constrângeri de integritate
- **Unicitate:** Fiecare pacient are un singur CNP/ID unic.
- **Referențială:** Consultațiile trebuie să fie asociate cu un pacient și un medic existent.
- **Temporală:** Data consultației nu poate fi în viitor.
- **Calificări:** Doar psihiatrii pot prescrie medicamente.
- **Vârstă:** Pacienții minori necesită acordul părinților/tutorilor.

### Constrângeri de validare
- **Intervale scoruri:** Scorurile testelor trebuie să fie în intervalele specifice fiecărui test.
- **Rezultate test:** Rezultatele trebuie să fie introduse doar după aplicarea testului.
- **Prescripții:** Medicamentele pot fi prescrise doar pacienților cu anumite diagnostice.
- **Doze terapeutice:** Dozele medicamentelor trebuie să respecte limitele terapeutice.

### Constrângeri de securitate
- **Acces restricționat:** Accesul la datele medicale este restricționat pe roluri.
- **Auditare:** Istoricul modificărilor trebuie păstrat pentru auditare.
- **Confidențialitate:** Confidențialitatea datelor pacienților trebuie asigurată.


## 3. Descrierea entităților, incluzând precizarea cheii primare

### PACIENTI
- **Cheie primară:** `cod_pacient`
- **Descriere:** Informații despre pacienții care se prezintă pentru evaluare.

### SPECIALISTI
- **Cheie primară:** `cod_specialist`
- **Descriere:** Psihiatri și psihologi care efectuează evaluările.

### SPECIALITATI
- **Cheie primară:** `cod_specialitate`
- **Descriere:** Tipurile de specializări (psihiatrie, psihologie clinică, etc.).

### CONSULTATII
- **Cheie primară:** `cod_consultatie`
- **Descriere:** Ședințele de evaluare și tratament.

### TESTE_PSIHOLOGICE
- **Cheie primară:** `cod_test`
- **Descriere:** Instrumentele de evaluare standardizate.

### REZULTATE_TESTE
- **Cheie primară:** `cod_rezultat`
- **Descriere:** Scorurile obținute la testele aplicate.

### TULBURARI_PERSONALITATE
- **Cheie primară:** `cod_tulburare`
- **Descriere:** Clasificarea tulburărilor conform DSM-5/ICD-11.

### DIAGNOSTICE
- **Cheie primară:** `cod_diagnostic`
- **Descriere:** Diagnosticele stabilite pentru pacienți.

### MEDICAMENTE
- **Cheie primară:** `cod_medicament`
- **Descriere:** Medicamentele utilizate în tratament.

### PRESCRIPTII
- **Cheie primară:** `cod_prescriptie`
- **Descriere:** Prescripțiile medicale emise.

### CATEGORII_VARSTA
- **Cheie primară:** `cod_categorie_varsta`
- **Descriere:** Grupe de vârstă pentru evaluare specifică.

### SIMPTOME
- **Cheie primară:** `cod_simptom`
- **Descriere:** Simptomele identificate la pacienți.

### SIMPTOME_PACIENTI
- **Cheie primară:** `cod_simptom_pacient`
- **Descriere:** Asocierea simptomelor cu pacienții (tabel asociativ).

## 4. Descrierea relațiilor, incluzând precizarea cardinalității acestora

### Relații 1:M (Unul la mulți)

1. **CATEGORII_VARSTA - PACIENTI (1:M)**
   - Cardinalitate: (1,1) - (0,N)
   - Un pacient aparține unei singure categorii de vârstă (participare totală)
   - O categorie de vârstă poate include zero sau mai mulți pacienți (participare parțială)

2. **SPECIALITATI - SPECIALISTI (1:M)**
   - Cardinalitate: (1,1) - (0,N)
   - Un specialist are o singură specialitate (participare totală)
   - O specialitate poate fi practicată de zero sau mai mulți specialiști (participare parțială)

3. **PACIENTI - CONSULTATII (1:M)**
   - Cardinalitate: (1,1) - (0,N)
   - O consultație aparține unui singur pacient (participare totală)
   - Un pacient poate avea zero sau mai multe consultații (participare parțială)

4. **SPECIALISTI - CONSULTATII (1:M)**
   - Cardinalitate: (1,1) - (0,N)
   - O consultație este efectuată de un singur specialist (participare totală)
   - Un specialist poate efectua zero sau mai multe consultații (participare parțială)

5. **TESTE_PSIHOLOGICE - REZULTATE_TESTE (1:M)**
   - Cardinalitate: (1,1) - (0,N)
   - Un rezultat aparține unui singur test (participare totală)
   - Un test poate genera zero sau mai multe rezultate (participare parțială)

6. **CONSULTATII - REZULTATE_TESTE (1:M)**
   - Cardinalitate: (1,1) - (0,N)
   - Un rezultat aparține unei singure consultații (participare totală)
   - O consultație poate include zero sau mai multe rezultate de teste (participare parțială)

7. **TULBURARI_PERSONALITATE - DIAGNOSTICE (1:M)**
   - Cardinalitate: (1,1) - (0,N)
   - Un diagnostic se referă la o singură tulburare (participare totală)
   - O tulburare poate fi diagnosticată zero sau de mai multe ori (participare parțială)

8. **PACIENTI - DIAGNOSTICE (1:M)**
   - Cardinalitate: (1,1) - (0,N)
   - Un diagnostic aparține unui singur pacient (participare totală)
   - Un pacient poate avea zero sau mai multe diagnostice (participare parțială)

9. **SPECIALISTI - DIAGNOSTICE (1:M)**
   - Cardinalitate: (1,1) - (0,N)
   - Un diagnostic este stabilit de un singur specialist (participare totală)
   - Un specialist poate stabili zero sau mai multe diagnostice (participare parțială)

10. **MEDICAMENTE - PRESCRIPTII (1:M)**
    - Cardinalitate: (1,1) - (0,N)
    - O prescripție se referă la un singur medicament (participare totală)
    - Un medicament poate fi prescris zero sau de mai multe ori (participare parțială)

11. **PACIENTI - PRESCRIPTII (1:M)**
    - Cardinalitate: (1,1) - (0,N)
    - O prescripție aparține unui singur pacient (participare totală)
    - Un pacient poate primi zero sau mai multe prescripții (participare parțială)

12. **SPECIALISTI - PRESCRIPTII (1:M)**
    - Cardinalitate: (1,1) - (0,N)
    - O prescripție este emisă de un singur specialist (participare totală)
    - Un specialist poate emite zero sau mai multe prescripții (participare parțială)

### Relații M:M (Mulți la mulți) - implementate prin tabele asociative

13. **PACIENTI - SIMPTOME (M:M) prin SIMPTOME_PACIENTI**
    - Cardinalitate: (0,N) - (0,N)
    - Un pacient poate prezenta zero sau mai multe simptome (participare parțială)
    - Un simptom poate fi prezent la zero sau mai mulți pacienți (participare parțială)
    - Tabelul asociativ SIMPTOME_PACIENTI conține atribute adiționale: data_aparitie, intensitate, observatii

### Notații pentru cardinalitate:
- **(0,1)**: Opțional, maximum unul
- **(1,1)**: Obligatoriu, exact unul
- **(0,N)**: Opțional, oricâte
- **(1,N)**: Obligatoriu, cel puțin unul

## 5. Descrierea atributelor, incluzând tipul de date și eventualele constrângeri, valori implicite, valori posibile ale atributelor

### PACIENTI
- **cod_pacient**: `NUMBER`, PK, NOT NULL  
- **nume**: `VARCHAR2(50)`, NOT NULL  
- **prenume**: `VARCHAR2(50)`, NOT NULL  
- **cnp**: `VARCHAR2(13)`, UNIQUE, NOT NULL  
- **data_nasterii**: `DATE`, NOT NULL  
- **sex**: `CHAR(1)`, CHECK IN ('M', 'F'), NOT NULL  
- **telefon**: `VARCHAR2(20)`  
- **email**: `VARCHAR2(100)`  
- **adresa**: `VARCHAR2(200)`  
- **cod_categorie_varsta**: `NUMBER`, FK, NOT NULL  
- **data_inregistrarii**: `DATE`, DEFAULT SYSDATE  
- **reprezentant_legal**: `VARCHAR2(100)` (pentru minori)  

### SPECIALISTI
- **cod_specialist**: `NUMBER`, PK, NOT NULL  
- **nume**: `VARCHAR2(50)`, NOT NULL  
- **prenume**: `VARCHAR2(50)`, NOT NULL  
- **cod_specialitate**: `NUMBER`, FK, NOT NULL  
- **nr_parafa**: `VARCHAR2(20)`, UNIQUE, NOT NULL  
- **telefon**: `VARCHAR2(20)`  
- **email**: `VARCHAR2(100)`  
- **data_angajarii**: `DATE`, DEFAULT SYSDATE  
- **activ**: `CHAR(1)`, CHECK IN ('Y', 'N'), DEFAULT 'Y'  

### SPECIALITATI
- **cod_specialitate**: `NUMBER`, PK, NOT NULL  
- **denumire**: `VARCHAR2(100)`, NOT NULL  
- **prescrie_medicamente**: `CHAR(1)`, CHECK IN ('Y', 'N'), DEFAULT 'N'  
- **descriere**: `VARCHAR2(500)`  

### CONSULTATII
- **cod_consultatie**: `NUMBER`, PK, NOT NULL  
- **cod_pacient**: `NUMBER`, FK, NOT NULL  
- **cod_specialist**: `NUMBER`, FK, NOT NULL  
- **data_consultatie**: `DATE`, NOT NULL  
- **ora_consultatie**: `VARCHAR2(5)`, NOT NULL  
- **durata_minute**: `NUMBER`, CHECK > 0, DEFAULT 50  
- **tip_consultatie**: `VARCHAR2(20)`, CHECK IN ('EVALUARE_INITIALA', 'CONTROL', 'TERAPIE')  
- **observatii**: `CLOB`  
- **cost**: `NUMBER(8,2)`, CHECK >= 0  

### TESTE_PSIHOLOGICE
- **cod_test**: `NUMBER`, PK, NOT NULL  
- **denumire**: `VARCHAR2(100)`, NOT NULL  
- **acronim**: `VARCHAR2(10)`  
- **scor_minim**: `NUMBER`, NOT NULL  
- **scor_maxim**: `NUMBER`, NOT NULL  
- **durata_aplicare**: `NUMBER` (în minute)  
- **categorie_varsta_min**: `NUMBER`, NOT NULL  
- **categorie_varsta_max**: `NUMBER`, NOT NULL  
- **descriere**: `VARCHAR2(1000)`  

### REZULTATE_TESTE
- **cod_rezultat**: `NUMBER`, PK, NOT NULL  
- **cod_test**: `NUMBER`, FK, NOT NULL  
- **cod_consultatie**: `NUMBER`, FK, NOT NULL  
- **scor_obtinut**: `NUMBER`, NOT NULL  
- **interpretare**: `VARCHAR2(500)`  
- **data_aplicarii**: `DATE`, DEFAULT SYSDATE  
- **observatii**: `VARCHAR2(1000)`  

### TULBURARI_PERSONALITATE
- **cod_tulburare**: `NUMBER`, PK, NOT NULL  
- **denumire**: `VARCHAR2(100)`, NOT NULL  
- **cod_dsm5**: `VARCHAR2(10)`  
- **cod_icd11**: `VARCHAR2(10)`  
- **cluster_personalitate**: `CHAR(1)`, CHECK IN ('A', 'B', 'C')  
- **severitate**: `VARCHAR2(20)`, CHECK IN ('USOARA', 'MODERATA', 'SEVERA')  
- **descriere**: `CLOB`  

### DIAGNOSTICE
- **cod_diagnostic**: `NUMBER`, PK, NOT NULL  
- **cod_pacient**: `NUMBER`, FK, NOT NULL  
- **cod_tulburare**: `NUMBER`, FK, NOT NULL  
- **cod_specialist**: `NUMBER`, FK, NOT NULL  
- **data_diagnostic**: `DATE`, DEFAULT SYSDATE  
- **certitudinea**: `VARCHAR2(20)`, CHECK IN ('CONFIRMAT', 'PROBABILIST', 'DIFERENTIAL')  
- **observatii**: `VARCHAR2(1000)`  

### MEDICAMENTE
- **cod_medicament**: `NUMBER`, PK, NOT NULL  
- **denumire**: `VARCHAR2(100)`, NOT NULL  
- **substanta_activa**: `VARCHAR2(100)`, NOT NULL  
- **concentratie**: `VARCHAR2(50)`  
- **forma_farmaceutica**: `VARCHAR2(50)`  
- **producator**: `VARCHAR2(100)`  
- **contraindicatii**: `VARCHAR2(1000)`  

### PRESCRIPTII
- **cod_prescriptie**: `NUMBER`, PK, NOT NULL  
- **cod_pacient**: `NUMBER`, FK, NOT NULL  
- **cod_specialist**: `NUMBER`, FK, NOT NULL  
- **cod_medicament**: `NUMBER`, FK, NOT NULL  
- **data_prescriptie**: `DATE`, DEFAULT SYSDATE  
- **doza**: `VARCHAR2(100)`, NOT NULL  
- **frecventa**: `VARCHAR2(100)`, NOT NULL  
- **durata_tratament**: `NUMBER` (în zile)  
- **instructiuni**: `VARCHAR2(500)`  

### CATEGORII_VARSTA
- **cod_categorie_varsta**: `NUMBER`, PK, NOT NULL  
- **denumire**: `VARCHAR2(50)`, NOT NULL  
- **varsta_minima**: `NUMBER`, NOT NULL  
- **varsta_maxima**: `NUMBER`, NOT NULL  
- **descriere**: `VARCHAR2(200)`  

### SIMPTOME
- **cod_simptom**: `NUMBER`, PK, NOT NULL  
- **denumire**: `VARCHAR2(100)`, NOT NULL  
- **descriere**: `VARCHAR2(500)`  
- **categorie**: `VARCHAR2(50)`  

### SIMPTOME_PACIENTI
- **cod_simptom_pacient**: `NUMBER`, PK, NOT NULL  
- **cod_pacient**: `NUMBER`, FK, NOT NULL  
- **cod_simptom**: `NUMBER`, FK, NOT NULL  
- **data_aparitie**: `DATE`  
- **intensitate**: `NUMBER`, CHECK BETWEEN 1 AND 10  
- **observatii**: `VARCHAR2(500)`  

6. Realizarea diagramei entitate-relație corespunzătoare descrierii de la punctele 3-5.
7. Realizarea diagramei conceptuale corespunzătoare diagramei entitate-relație proiectate la punctul 6. Diagrama conceptuală obținută trebuie să conțină minimum 6 tabele (fără considerarea subentităților), dintre care cel puțin un tabel asociativ.
8. Enumerarea schemelor relaționale corespunzătoare diagramei conceptuale proiectate la punctul 7.
9. Realizarea normalizării până la forma normală 3 (FN1-FN3).
10. Crearea unei secvențe ce va fi utilizată în inserarea înregistrărilor în tabele (punctul 11).
11. Crearea tabelelor în SQL și inserarea de date coerente în fiecare dintre acestea (minimum 5 înregistrări în fiecare tabel neasociativ; minimum 10 înregistrări în tabelele asociative).
12. Formulați în limbaj natural și implementați 5 cereri SQL complexe ce vor utiliza, în ansamblul lor, următoarele elemente:
• subcereri sincronizate în care intervin cel puțin 3 tabele
• subcereri nesincronizate în clauza FROM
• grupări de date cu subcereri nesincronizate in care intervin cel putin 3 tabele, funcții grup, filtrare la nivel de grupuri (in cadrul aceleiasi cereri)
• ordonări si utilizarea funcțiilor NVL și DECODE (in cadrul aceleiasi cereri)
• utilizarea a cel puțin 2 funcții pe șiruri de caractere, 2 funcții pe date calendaristice, a cel puțin unei expresii CASE
• utilizarea a cel puțin 1 bloc de cerere (clauza WITH)
Observație: Într-o cerere se vor regăsi mai multe elemente dintre cele enumerate mai sus, astfel încât cele 5 cereri să le cuprindă pe toate.
13. Implementarea a 3 operații de actualizare și de suprimare a datelor utilizând subcereri.
14. Crearea unei vizualizări complexe. Dați un exemplu de operație LMD permisă pe vizualizarea respectivă și un exemplu de operație LMD nepermisă.
15. Formulați în limbaj natural și implementați în SQL: o cerere ce utilizează operația outer-join pe minimum 4 tabele, o cerere ce utilizează operația division și o cerere care implementează analiza top-n.
Observație: Cele 3 cereri sunt diferite de cererile de la exercițiul 12.
16. Optimizarea unei cereri, aplicând regulile de optimizare ce derivă din proprietățile operatorilor algebrei relaționale. Cererea va fi exprimată prin expresie algebrică, arbore algebric și limbaj (SQL), atât anterior cât și ulterior optimizării. ALTERNATIVĂ: două instrucțiuni select echivalente semantic, de comparat din punct de vedere a execuției (explicat plan de execuție).
17. a. Realizarea normalizării BCNF[, FN4, FN5].
b. Aplicarea denormalizării, justificând necesitatea acesteia. ALTERNATIVĂ: alegerea unor relații/join-uri din model și reprezentarea acestora într-o bază de date NoSql (MongoDb, Cassandra etc.)
18. Tranzacții: ilustrarea consistency levels in Oracle cu tranzacții care operează asupra modelului ales. (model consistency_level.sql)
19. Optimizarea a două cereri utilizând indexare