-- updates_deletes.sql
-- Examples of UPDATE and DELETE operations (with WHERE conditions)

-- UPDATE examples
-- 1) Update phone for a student
UPDATE sga.aluno
SET telefone = '11999990000'
WHERE id_aluno = 3;

-- 2) Mark a pending payment as paid
UPDATE sga.pagamento
SET status_pagamento = 'pago', data_pagamento = CURRENT_DATE
WHERE id_pagamento = 3 AND status_pagamento <> 'pago';

-- 3) Change instructor for a class
UPDATE sga.aula
SET id_instrutor = 1
WHERE id_aula = 2;

-- DELETE examples
-- 1) Delete an equipment that is deprecated (example)
DELETE FROM sga.equipamento
WHERE id_equipamento = 2 AND estado_conservacao = 'Regular';

-- 2) Remove old attendance records older than 1 year
DELETE FROM sga.aula_aluno
WHERE data < CURRENT_DATE - INTERVAL '1 year';

-- 3) Delete a temporary test student (only if no active matricula)
DELETE FROM sga.aluno
WHERE id_aluno = 999 AND NOT EXISTS (
    SELECT 1 FROM sga.matricula m WHERE m.id_aluno = 999 AND m.status = 'ativo'
);
