1. Descrierea modelului real, a utilității acestuia și a regulilor de funcționare.
2. Prezentarea constrângerilor (restricții, reguli) impuse asupra modelului.
3. Descrierea entităților, incluzând precizarea cheii primare.
4. Descrierea relațiilor, incluzând precizarea cardinalității acestora.
5. Descrierea atributelor, incluzând tipul de date și eventualele constrângeri, valori implicite, valori posibile ale atributelor.
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