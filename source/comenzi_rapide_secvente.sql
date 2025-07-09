-- ========================================
-- COMENZI RAPIDE PENTRU SECVENȚE
-- ========================================
-- Rulează aceste comenzi direct în SQL Developer

--  ELIMINARE COMPLETĂ
EXEC drop_all_sequences;

-- RESETARE LA 1
EXEC reset_all_sequences;

-- CREARE TOATE SECVENȚELE
EXEC create_all_sequences;

-- VERIFICARE STARE
EXEC show_sequences_status;

-- INTEROGARE MANUALĂ SECVENȚE
SELECT sequence_name, last_number 
FROM user_sequences 
WHERE sequence_name LIKE 'SEQ_%'
ORDER BY sequence_name;

-- WORKFLOW COMPLET DE RESETARE:
/*
EXEC drop_all_sequences;      -- Șterge tot
EXEC create_all_sequences;    -- Recrează cu valori 1
EXEC show_sequences_status;   -- Verifică rezultatul
*/
