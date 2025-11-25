-- queries.sql
-- Example SELECT queries for evaluation

-- 1) List all active students with their current plan and status
SELECT a.id_aluno, a.nome, a.cpf, p.nome_plano, m.status, m.data_inicio, m.data_fim
FROM sga.aluno a
LEFT JOIN sga.matricula m ON m.id_aluno = a.id_aluno AND m.status = 'ativo'
LEFT JOIN sga.plano p ON p.id_plano = m.id_plano
ORDER BY a.nome;

-- 2) Payments pending (status_pagamento != 'pago')
SELECT pg.id_pagamento, a.nome AS aluno, pg.valor, pg.data_pagamento, pg.status_pagamento
FROM sga.pagamento pg
JOIN sga.matricula m ON m.id_matricula = pg.id_matricula
JOIN sga.aluno a ON a.id_aluno = m.id_aluno
WHERE pg.status_pagamento <> 'pago'
ORDER BY pg.data_pagamento DESC
LIMIT 10;

-- 3) Attendance report: students who attended a specific class (by name) in the past month
SELECT aa.data, a.nome AS aluno, au.nome_aula, aa.presente
FROM sga.aula_aluno aa
JOIN sga.aluno a ON a.id_aluno = aa.id_aluno
JOIN sga.aula au ON au.id_aula = aa.id_aula
WHERE au.nome_aula = 'Spinning'
  AND aa.data >= CURRENT_DATE - INTERVAL '30 days'
  AND aa.presente = TRUE
ORDER BY aa.data DESC;

-- 4) List fichas de treino with exercises
SELECT f.id_ficha, al.nome AS aluno, fe.nome_exercicio, fe.series, fe.repeticoes
FROM sga.ficha_treino f
JOIN sga.aluno al ON al.id_aluno = f.id_aluno
JOIN sga.ficha_exercicio fe ON fe.id_ficha = f.id_ficha
ORDER BY f.data_criacao DESC
LIMIT 20;
