# Sistem de Bază de Date pentru Psihiatrie și Psihologie

## 📋 Descrierea Proiectului

Acest proiect reprezintă o bază de date completă destinată clinicilor și cabinetelor de psihiatrie și psihologie, având ca scop facilitarea evaluării, diagnosticării și monitorizării pacienților cu suspiciuni de tulburări de personalitate.

### Utilitatea Sistemului

- **Evaluare sistematică:** Permite aplicarea standardizată a testelor psihologice și a instrumentelor de screening
- **Istoric medical complet:** Păstrează evidența consultațiilor, simptomelor și tratamentelor pentru fiecare pacient
- **Diagnostic diferențial:** Facilitează identificarea și diferențierea tulburărilor de personalitate
- **Monitorizare progres:** Urmărește evoluția pacienților în timp și eficiența tratamentelor aplicate
- **Gestionare resurse:** Optimizează programarea consultațiilor și alocarea specialiștilor

## 🗂️ Structura Proiectului

### 📁 Directorul `docs/`

Conține documentația completă a proiectului:

- **`1_Demit_Andrei-proiect.md`** - Documentația principală cu descrierea modelului, regulile de funcționare și constrângerile sistemului
- **`1_Demit_Andrei-proiect.pdf`** - Versiunea PDF a documentației principale
- **`1_Demit_Andrei-diagrama-conceptuala.md`** - Documentația diagramei conceptuale
- **`1_Demit_Andrei-ER-diagram.md`** - Documentația diagramei ER (Entity-Relationship)
- **`diagrama_Concept.png`** - Diagrama conceptuală în format imagine
- **`diagrama_ER.png`** - Diagrama ER în format imagine
- **`sql_scripts_run.png`** - Captură de ecran cu rularea scripturilor SQL

### 📁 Directorul `source/`

Conține toate scripturile SQL necesare pentru implementarea bazei de date:

#### Scripturi de Administrare Bază de Date

- **`1_Demit_Andrei-creare_tabele.sql`** 
  - **Scop:** Creează toate tabelele bazei de date în ordinea corectă
  - **Funcționalitate:** Include procedura `recreate_tables` care elimină și recreează toate tabelele respectând constrângerile de cheie externă
  - **Tabele create:** categorii_varsta, specialitati, pacienti, specialisti, medicamente, simptome, teste_psihologice, tulburari_personalitate, consultatii, rezultate_teste, diagnostice, prescriptii, simptome_pacienti

- **`1_Demit_Andrei-eliminare_tabele.sql`**
  - **Scop:** Elimină toate tabelele din baza de date
  - **Funcționalitate:** Include procedura `drop_tables` care șterge toate tabelele în ordinea inversă creării pentru a evita conflictele de constrângeri

#### Scripturi pentru Secvențe

- **`1_Demit_Andrei-creare_inserare.sql`**
  - **Scop:** Creează toate secvențele necesare pentru cheile primare auto-increment
  - **Funcționalitate:** Definește secvențe pentru toate tabelele principale (seq_pacienti, seq_specialisti, seq_consultatii, etc.)

- **`1_Demit_Andrei-management_secvente.sql`**
  - **Scop:** Management complet al secvențelor bazei de date
  - **Funcționalități incluse:**
    - `drop_all_sequences` - Elimină toate secvențele existente
    - `create_all_sequences` - Creează toate secvențele necesare
    - `reset_all_sequences` - Resetează toate secvențele la valoarea 1
    - `show_sequences_status` - Afișează starea curentă a tuturor secvențelor

- **`comenzi_rapide_secvente.sql`**
  - **Scop:** Comenzi rapide pentru managementul secvențelor
  - **Funcționalitate:** Conține comenzi pre-definite pentru operațiuni frecvente cu secvențele
  - **Utilizare:** Pentru rulare directă în SQL Developer

#### Scripturi de Interogare și Exemple

- **`1_Demit_Andrei-exemple.sql`**
  - **Scop:** Exemple de interogări complexe asupra bazei de date
  - **Conține:**
    - Interogări cu JOIN-uri multiple
    - Utilizarea funcțiilor SQL (DECODE, NVL, CASE, SUBSTR, etc.)
    - Grupări și agregări
    - Subinterogări
    - Exemple practice pentru rapoarte medicale

## 🏗️ Arhitectura Bazei de Date

### Entități Principale

1. **Pacienti** - Informații despre pacienții clinicii
2. **Specialisti** - Detalii despre psihiatri și psihologi
3. **Consultatii** - Evidența consultațiilor medicale
4. **Teste_psihologice** - Catalogul testelor disponibile
5. **Rezultate_teste** - Rezultatele testelor aplicate
6. **Diagnostice** - Diagnosticele stabilite
7. **Prescriptii** - Medicamentele prescrise
8. **Tulburari_personalitate** - Catalogul tulburărilor
9. **Simptome** - Lista simptomelor
10. **Medicamente** - Catalogul medicamentelor disponibile

### Relații Importante

- Un pacient poate avea multiple consultații
- O consultație poate include mai multe teste
- Un specialist poate evalua mai mulți pacienți
- Un diagnostic poate include mai multe tulburări
- Un pacient poate avea mai multe prescripții

## 🚀 Cum să Utilizezi Proiectul

### Pasul 1: Configurarea Bazei de Date

```sql
-- 1. Rulează scriptul de creare a tabelelor
@1_Demit_Andrei-creare_tabele.sql

-- 2. Execută procedura de creare
EXEC recreate_tables;
```

### Pasul 2: Configurarea Secvențelor

```sql
-- Rulează managementul secvențelor
@1_Demit_Andrei-management_secvente.sql

-- Creează toate secvențele
EXEC create_all_sequences;
```

### Pasul 3: Verificarea Instalării

```sql
-- Verifică secvențele
EXEC show_sequences_status;

-- Verifică tabelele
SELECT table_name FROM user_tables ORDER BY table_name;
```

### Pasul 4: Exemple de Utilizare

```sql
-- Rulează exemplele pentru a vedea funcționalitatea
@1_Demit_Andrei-exemple.sql
```

## 🛠️ Cerințe Tehnice

- **SGBD:** Oracle Database (11g sau superior)
- **Interfață:** SQL Developer sau orice client Oracle compatibil
- **Privilegii:** CREATE TABLE, CREATE SEQUENCE, EXECUTE

## 📊 Caracteristici Avansate

- **Proceduri stocate** pentru managementul automatizat
- **Secvențe auto-increment** pentru chei primare
- **Constrângeri de integritate** referențială
- **Validări** pentru datele medicale
- **Auditare** prin triggere (opțional)

## 🤝 Contribuții

Pentru modificări sau îmbunătățiri, vă rugăm să:
1. Documentați orice schimbare în fișierele corespunzătoare
2. Testați scripturile înainte de implementare
3. Actualizați diagramele dacă este necesar

## 📞 Contact

**Autor:** Demit Andrei  
**Data:** Iulie 2025  
**Proiect:** Baze de Date - Sistem Psihiatrie și Psihologie

---

*Acest proiect face parte dintr-un hackathon dedicat dezvoltării de soluții pentru domeniul medical-psihologic.*
