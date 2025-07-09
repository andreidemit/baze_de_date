-- Secvențe pentru tabelele principale

CREATE SEQUENCE seq_pacienti
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

CREATE SEQUENCE seq_specialisti
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

CREATE SEQUENCE seq_specialitati
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

CREATE SEQUENCE seq_categorii_varsta
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

CREATE SEQUENCE seq_consultatii
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

CREATE SEQUENCE seq_teste_psihologice
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

CREATE SEQUENCE seq_rezultate_teste
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

CREATE SEQUENCE seq_tulburari_personalitate
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

CREATE SEQUENCE seq_diagnostice
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

CREATE SEQUENCE seq_medicamente
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

CREATE SEQUENCE seq_prescriptii
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

CREATE SEQUENCE seq_simptome
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

CREATE SEQUENCE seq_simptome_pacienti
  START WITH 1
  INCREMENT BY 1
  NOCACHE;


-- SPECIALITATI
INSERT INTO specialitati VALUES (seq_specialitati.NEXTVAL, 'Psihiatrie', 'Y', 'Poate prescrie medicamente');
INSERT INTO specialitati VALUES (seq_specialitati.NEXTVAL, 'Psihologie clinică', 'N', 'Evaluare psihologică');
INSERT INTO specialitati VALUES (seq_specialitati.NEXTVAL, 'Neuropsihiatrie', 'Y', 'Specialist mixt');
INSERT INTO specialitati VALUES (seq_specialitati.NEXTVAL, 'Psihoterapie', 'N', 'Fără drept de prescripție');
INSERT INTO specialitati VALUES (seq_specialitati.NEXTVAL, 'Psihologie educațională', 'N', 'Lucrează cu copii și adolescenți');

-- CATEGORII VARSTA
INSERT INTO categorii_varsta VALUES (seq_categorii_varsta.NEXTVAL, 'Copil mic', 0, 6, 'Prescolari');
INSERT INTO categorii_varsta VALUES (seq_categorii_varsta.NEXTVAL, 'Copil mare', 7, 12, 'Școlari');
INSERT INTO categorii_varsta VALUES (seq_categorii_varsta.NEXTVAL, 'Adolescent', 13, 17, 'Adolescenți');
INSERT INTO categorii_varsta VALUES (seq_categorii_varsta.NEXTVAL, 'Adult', 18, 64, 'Adulți');
INSERT INTO categorii_varsta VALUES (seq_categorii_varsta.NEXTVAL, 'Senior', 65, 120, 'Persoane vârstnice');

-- TULBURARI PERSONALITATE
INSERT INTO tulburari_personalitate VALUES (seq_tulburari_personalitate.NEXTVAL, 'Tulburarea Borderline de Personalitate', 'F60.3', '6D11.5', 'B', 'MODERATA', 'Tulburare caracterizată prin instabilitate în relații, imagine de sine și afect');
INSERT INTO tulburari_personalitate VALUES (seq_tulburari_personalitate.NEXTVAL, 'Tulburarea Narcisistă de Personalitate', 'F60.81', '6D11.1', 'B', 'USOARA', 'Tipar persistent de grandiositate și lipsă de empatie');
INSERT INTO tulburari_personalitate VALUES (seq_tulburari_personalitate.NEXTVAL, 'Tulburarea Antisocială de Personalitate', 'F60.2', '6D11.2', 'B', 'SEVERA', 'Nerespectarea persistentă a drepturilor altora');
INSERT INTO tulburari_personalitate VALUES (seq_tulburari_personalitate.NEXTVAL, 'Tulburarea Evitantă de Personalitate', 'F60.6', '6D11.3', 'C', 'MODERATA', 'Inhibiție socială, sentimente de inadecvare');
INSERT INTO tulburari_personalitate VALUES (seq_tulburari_personalitate.NEXTVAL, 'Tulburarea Dependentă de Personalitate', 'F60.7', '6D11.4', 'C', 'USOARA', 'Necesitate excesivă de a fi îngrijit');

-- TESTE PSIHOLOGICE
INSERT INTO teste_psihologice VALUES (seq_teste_psihologice.NEXTVAL, 'Minnesota Multiphasic Personality Inventory', 'MMPI-2', 0, 120, 90, 4, 5, 'Test comprehensiv de personalitate pentru adulți');
INSERT INTO teste_psihologice VALUES (seq_teste_psihologice.NEXTVAL, 'Beck Depression Inventory', 'BDI-II', 0, 63, 15, 3, 5, 'Inventar pentru evaluarea severității depresiei');
INSERT INTO teste_psihologice VALUES (seq_teste_psihologice.NEXTVAL, 'Personality Assessment Inventory', 'PAI', 20, 80, 60, 4, 5, 'Evaluarea tulburărilor de personalitate la adulți');
INSERT INTO teste_psihologice VALUES (seq_teste_psihologice.NEXTVAL, 'Youth Self Report', 'YSR', 0, 100, 30, 2, 3, 'Auto-raportare pentru adolescenți');
INSERT INTO teste_psihologice VALUES (seq_teste_psihologice.NEXTVAL, 'Millon Clinical Multiaxial Inventory', 'MCMI-IV', 0, 115, 75, 4, 5, 'Evaluarea tulburărilor clinice și de personalitate');

-- SIMPTOME
INSERT INTO simptome VALUES (seq_simptome.NEXTVAL, 'Anxietate', 'Neliniște accentuată', 'Emoțional');
INSERT INTO simptome VALUES (seq_simptome.NEXTVAL, 'Furie', 'Episoade de furie greu controlabile', 'Emoțional');
INSERT INTO simptome VALUES (seq_simptome.NEXTVAL, 'Insomnie', 'Dificultăți de somn', 'Fiziologic');
INSERT INTO simptome VALUES (seq_simptome.NEXTVAL, 'Izolare socială', 'Tendința de retragere', 'Comportamental');
INSERT INTO simptome VALUES (seq_simptome.NEXTVAL, 'Depresie', 'Tristețe prelungită', 'Emoțional');
INSERT INTO simptome VALUES (seq_simptome.NEXTVAL, 'Halucinații', 'Percepții false', 'Cognitiv');
INSERT INTO simptome VALUES (seq_simptome.NEXTVAL, 'Gânduri suicidare', 'Idei de sinucidere', 'Emoțional');
INSERT INTO simptome VALUES (seq_simptome.NEXTVAL, 'Confuzie', 'Dificultate în concentrare', 'Cognitiv');
INSERT INTO simptome VALUES (seq_simptome.NEXTVAL, 'Oboseală cronică', 'Lipsă constantă de energie', 'Fiziologic');
INSERT INTO simptome VALUES (seq_simptome.NEXTVAL, 'Agitație', 'Neliniște motorie', 'Comportamental');

-- MEDICAMENTE
INSERT INTO medicamente VALUES (seq_medicamente.NEXTVAL, 'Sertralina', 'Sertraline', '50mg', 'comprimat', 'Pfizer', 'Contraindicat în epilepsie severă');
INSERT INTO medicamente VALUES (seq_medicamente.NEXTVAL, 'Quetiapină', 'Quetiapine', '100mg', 'comprimat', 'AstraZeneca', 'Sedare excesivă');
INSERT INTO medicamente VALUES (seq_medicamente.NEXTVAL, 'Escitalopram', 'Escitalopram', '10mg', 'comprimat', 'Lundbeck', 'Evitat în sarcină');
INSERT INTO medicamente VALUES (seq_medicamente.NEXTVAL, 'Risperidonă', 'Risperidone', '2mg', 'comprimat', 'Janssen', 'Tulburări extrapiramidale');
INSERT INTO medicamente VALUES (seq_medicamente.NEXTVAL, 'Aripiprazol', 'Aripiprazole', '10mg', 'comprimat', 'Otsuka', 'Atenție la pacienți cu risc de suicid');

-- Commit pentru tabelele de bază (fără dependențe)
COMMIT;
DBMS_OUTPUT.PUT_LINE('Tabelele de bază au fost populate cu succes!');

-- PACIENTI
INSERT INTO pacienti VALUES (seq_pacienti.NEXTVAL, '6000101123456', 'Popescu', 'Maria', TO_DATE('2000-01-01','YYYY-MM-DD'), 'F', '0722000001', 'maria.popescu@email.com', 'Bucuresti', 4, SYSDATE, NULL);
INSERT INTO pacienti VALUES (seq_pacienti.NEXTVAL, '5010211123456', 'Ionescu', 'Andrei', TO_DATE('2001-02-11','YYYY-MM-DD'), 'M', '0722000002', 'andrei.ionescu@email.com', 'Cluj', 4, SYSDATE, NULL);
INSERT INTO pacienti VALUES (seq_pacienti.NEXTVAL, '7040301123456', 'Radu', 'Bianca', TO_DATE('2004-03-01','YYYY-MM-DD'), 'F', '0722000003', 'bianca.radu@email.com', 'Brașov', 3, SYSDATE, NULL);
INSERT INTO pacienti VALUES (seq_pacienti.NEXTVAL, '6050401123456', 'Ilie', 'Cristina', TO_DATE('2005-04-01','YYYY-MM-DD'), 'F', '0722000004', 'cristina.ilie@email.com', 'Constanța', 3, SYSDATE, NULL);
INSERT INTO pacienti VALUES (seq_pacienti.NEXTVAL, '7020501123456', 'Dumitru', 'Rares', TO_DATE('2002-05-01','YYYY-MM-DD'), 'M', '0722000005', 'rares.dumitru@email.com', 'Iași', 4, SYSDATE, NULL);

-- SPECIALISTI
INSERT INTO specialisti VALUES (seq_specialisti.NEXTVAL, 'Tudor', 'Elena', 1, 'P001', '0723000001', 'elena.tudor@email.com', SYSDATE, 'Y');
INSERT INTO specialisti VALUES (seq_specialisti.NEXTVAL, 'Marin', 'Mihai', 2, 'P002', '0723000002', 'mihai.marin@email.com', SYSDATE, 'Y');
INSERT INTO specialisti VALUES (seq_specialisti.NEXTVAL, 'Grigore', 'Adina', 3, 'P003', '0723000003', 'adina.grigore@email.com', SYSDATE, 'Y');
INSERT INTO specialisti VALUES (seq_specialisti.NEXTVAL, 'Dinu', 'Ioana', 4, 'P004', '0723000004', 'ioana.dinu@email.com', SYSDATE, 'Y');
INSERT INTO specialisti VALUES (seq_specialisti.NEXTVAL, 'Alexe', 'Vlad', 5, 'P005', '0723000005', 'vlad.alexe@email.com', SYSDATE, 'Y');

-- Commit pentru tabele cu dependențe simple
COMMIT;
DBMS_OUTPUT.PUT_LINE('Pacienții și specialiștii au fost inserați cu succes!');

-- SIMPTOME
INSERT INTO simptome VALUES (seq_simptome.NEXTVAL, 'Anxietate', 'Neliniște accentuată', 'Emoțional');
INSERT INTO simptome VALUES (seq_simptome.NEXTVAL, 'Furie', 'Episoade de furie greu controlabile', 'Emoțional');
INSERT INTO simptome VALUES (seq_simptome.NEXTVAL, 'Insomnie', 'Dificultăți de somn', 'Fiziologic');
INSERT INTO simptome VALUES (seq_simptome.NEXTVAL, 'Izolare socială', 'Tendința de retragere', 'Comportamental');
INSERT INTO simptome VALUES (seq_simptome.NEXTVAL, 'Depresie', 'Tristețe prelungită', 'Emoțional');
INSERT INTO simptome VALUES (seq_simptome.NEXTVAL, 'Halucinații', 'Percepții false', 'Cognitiv');
INSERT INTO simptome VALUES (seq_simptome.NEXTVAL, 'Gânduri suicidare', 'Idei de sinucidere', 'Emoțional');
INSERT INTO simptome VALUES (seq_simptome.NEXTVAL, 'Confuzie', 'Dificultate în concentrare', 'Cognitiv');
INSERT INTO simptome VALUES (seq_simptome.NEXTVAL, 'Oboseală cronică', 'Lipsă constantă de energie', 'Fiziologic');
INSERT INTO simptome VALUES (seq_simptome.NEXTVAL, 'Agitație', 'Neliniște motorie', 'Comportamental');

-- ASOCIERE SIMPTOME PENTRU PACIENTI
INSERT INTO simptome_pacienti VALUES (seq_simptome_pacienti.NEXTVAL, 1, 1, SYSDATE-10, 6, NULL);
INSERT INTO simptome_pacienti VALUES (seq_simptome_pacienti.NEXTVAL, 1, 2, SYSDATE-9, 7, NULL);
INSERT INTO simptome_pacienti VALUES (seq_simptome_pacienti.NEXTVAL, 2, 3, SYSDATE-8, 8, NULL);
INSERT INTO simptome_pacienti VALUES (seq_simptome_pacienti.NEXTVAL, 2, 4, SYSDATE-7, 5, NULL);
INSERT INTO simptome_pacienti VALUES (seq_simptome_pacienti.NEXTVAL, 3, 5, SYSDATE-6, 6, NULL);
INSERT INTO simptome_pacienti VALUES (seq_simptome_pacienti.NEXTVAL, 3, 6, SYSDATE-5, 9, NULL);
INSERT INTO simptome_pacienti VALUES (seq_simptome_pacienti.NEXTVAL, 4, 7, SYSDATE-4, 10, NULL);
INSERT INTO simptome_pacienti VALUES (seq_simptome_pacienti.NEXTVAL, 4, 8, SYSDATE-3, 4, NULL);
INSERT INTO simptome_pacienti VALUES (seq_simptome_pacienti.NEXTVAL, 5, 9, SYSDATE-2, 5, NULL);
INSERT INTO simptome_pacienti VALUES (seq_simptome_pacienti.NEXTVAL, 5, 10, SYSDATE-1, 7, NULL);

-- CONSULTATII
INSERT INTO consultatii VALUES (seq_consultatii.NEXTVAL, 1, 1, TO_DATE('2025-07-01', 'YYYY-MM-DD'), '10:00', 50, 'EVALUARE_INITIALA', NULL, 250);
INSERT INTO consultatii VALUES (seq_consultatii.NEXTVAL, 2, 2, TO_DATE('2025-07-02', 'YYYY-MM-DD'), '11:00', 60, 'CONTROL', NULL, 200);
INSERT INTO consultatii VALUES (seq_consultatii.NEXTVAL, 3, 3, TO_DATE('2025-07-03', 'YYYY-MM-DD'), '09:00', 45, 'TERAPIE', NULL, 180);
INSERT INTO consultatii VALUES (seq_consultatii.NEXTVAL, 4, 4, TO_DATE('2025-07-04', 'YYYY-MM-DD'), '14:00', 50, 'EVALUARE_INITIALA', NULL, 220);
INSERT INTO consultatii VALUES (seq_consultatii.NEXTVAL, 5, 5, TO_DATE('2025-07-05', 'YYYY-MM-DD'), '13:00', 55, 'CONTROL', NULL, 190);

-- Commit pentru consultații și simptome
COMMIT;
DBMS_OUTPUT.PUT_LINE('Consultațiile și simptomele au fost inserate cu succes!');

-- DIAGNOSTICE
INSERT INTO diagnostice VALUES (seq_diagnostice.NEXTVAL, 1, 1, 1, TO_DATE('2025-07-01', 'YYYY-MM-DD'), 'CONFIRMAT', NULL);
INSERT INTO diagnostice VALUES (seq_diagnostice.NEXTVAL, 2, 2, 1, TO_DATE('2025-07-02', 'YYYY-MM-DD'), 'PROBABILIST', NULL);
INSERT INTO diagnostice VALUES (seq_diagnostice.NEXTVAL, 3, 3, 1, TO_DATE('2025-07-03', 'YYYY-MM-DD'), 'DIFERENTIAL', NULL);
INSERT INTO diagnostice VALUES (seq_diagnostice.NEXTVAL, 4, 4, 1, TO_DATE('2025-07-04', 'YYYY-MM-DD'), 'CONFIRMAT', NULL);
INSERT INTO diagnostice VALUES (seq_diagnostice.NEXTVAL, 5, 5, 1, TO_DATE('2025-07-05', 'YYYY-MM-DD'), 'PROBABILIST', NULL);

-- REZULTATE TESTE
INSERT INTO rezultate_teste VALUES (seq_rezultate_teste.NEXTVAL, 1, 1, 72, 'Profil de instabilitate emoțională', TO_DATE('2025-07-01','YYYY-MM-DD'), NULL);
INSERT INTO rezultate_teste VALUES (seq_rezultate_teste.NEXTVAL, 2, 2, 35, 'Depresie moderată', TO_DATE('2025-07-02','YYYY-MM-DD'), NULL);
INSERT INTO rezultate_teste VALUES (seq_rezultate_teste.NEXTVAL, 1, 3, 68, 'Profil mixt cu trăsături borderline', TO_DATE('2025-07-03','YYYY-MM-DD'), NULL);
INSERT INTO rezultate_teste VALUES (seq_rezultate_teste.NEXTVAL, 2, 4, 25, 'Simptome ușoare de depresie', TO_DATE('2025-07-04','YYYY-MM-DD'), NULL);
INSERT INTO rezultate_teste VALUES (seq_rezultate_teste.NEXTVAL, 1, 5, 80, 'Instabilitate afectivă severă', TO_DATE('2025-07-05','YYYY-MM-DD'), NULL);

-- PRESCRIPTII
INSERT INTO prescriptii VALUES (seq_prescriptii.NEXTVAL, 1, 1, 1, SYSDATE, '50mg', '1/zi dimineața', 30, 'Administrare după masă');
INSERT INTO prescriptii VALUES (seq_prescriptii.NEXTVAL, 2, 2, 2, SYSDATE, '100mg', '1/zi seara', 60, 'Nu conduceți vehicule');
INSERT INTO prescriptii VALUES (seq_prescriptii.NEXTVAL, 3, 3, 3, SYSDATE, '10mg', '1/zi dimineața', 30, 'Evaluare la 2 săptămâni');
INSERT INTO prescriptii VALUES (seq_prescriptii.NEXTVAL, 4, 4, 4, SYSDATE, '2mg', '2/zi', 45, 'Administrare fixă');
INSERT INTO prescriptii VALUES (seq_prescriptii.NEXTVAL, 5, 5, 5, SYSDATE, '10mg', '1/zi dimineața', 30, 'A se evita alcoolul');

-- Commit final pentru toate datele complexe
COMMIT;
DBMS_OUTPUT.PUT_LINE('Diagnosticele, testele și prescripțiile au fost inserate cu succes!');

-- MEDICAMENTE
INSERT INTO medicamente VALUES (seq_medicamente.NEXTVAL, 'Sertralina', 'Sertraline', '50mg', 'comprimat', 'Pfizer', 'Contraindicat în epilepsie severă');
INSERT INTO medicamente VALUES (seq_medicamente.NEXTVAL, 'Quetiapină', 'Quetiapine', '100mg', 'comprimat', 'AstraZeneca', 'Sedare excesivă');
INSERT INTO medicamente VALUES (seq_medicamente.NEXTVAL, 'Escitalopram', 'Escitalopram', '10mg', 'comprimat', 'Lundbeck', 'Evitat în sarcină');
INSERT INTO medicamente VALUES (seq_medicamente.NEXTVAL, 'Risperidonă', 'Risperidone', '2mg', 'comprimat', 'Janssen', 'Tulburări extrapiramidale');
INSERT INTO medicamente VALUES (seq_medicamente.NEXTVAL, 'Aripiprazol', 'Aripiprazole', '10mg', 'comprimat', 'Otsuka', 'Atenție la pacienți cu risc de suicid');

-- PRESCRIPTII
INSERT INTO prescriptii VALUES (seq_prescriptii.NEXTVAL, 1, 1, 1, SYSDATE, '50mg', '1/zi dimineața', 30, 'Administrare după masă');
INSERT INTO prescriptii VALUES (seq_prescriptii.NEXTVAL, 2, 2, 2, SYSDATE, '100mg', '1/zi seara', 60, 'Nu conduceți vehicule');
INSERT INTO prescriptii VALUES (seq_prescriptii.NEXTVAL, 3, 3, 3, SYSDATE, '10mg', '1/zi dimineața', 30, 'Evaluare la 2 săptămâni');
INSERT INTO prescriptii VALUES (seq_prescriptii.NEXTVAL, 4, 4, 4, SYSDATE, '2mg', '2/zi', 45, 'Administrare fixă');
INSERT INTO prescriptii VALUES (seq_prescriptii.NEXTVAL, 5, 5, 5, SYSDATE, '10mg', '1/zi dimineața', 30, 'A se evita alcoolul');

-- Mesaj final de succes
DBMS_OUTPUT.PUT_LINE('TOATE DATELE AU FOST INSERATE CU SUCCES!');
DBMS_OUTPUT.PUT_LINE('===================================================');
SELECT 'PROCESUL DE POPULARE A FOST FINALIZAT!' AS STATUS FROM dual;
