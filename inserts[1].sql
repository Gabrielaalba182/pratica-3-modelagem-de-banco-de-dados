-- inserts.sql
-- Sample data inserts for SGA

-- Alunos
INSERT INTO sga.aluno (nome, cpf, telefone, endereco, data_nascimento, email) VALUES
('Carlos Silva', '12345678901', '11988887777', 'Rua A, 123, São Paulo', '1990-05-21', 'carlos.silva@example.com'),
('Mariana Costa', '23456789012', '21977776666', 'Av B, 456, Rio de Janeiro', '1995-11-02', 'mariana.costa@example.com'),
('Pedro Oliveira', '34567890123', '31966665555', 'Rua C, 789, Belo Horizonte', '1985-01-15', 'pedro.oliveira@example.com');

-- Instrutores
INSERT INTO sga.instrutor (nome, cpf, telefone, especialidade, email) VALUES
('Ana Souza', '98765432100', '11955554444', 'Musculação', 'ana.souza@example.com'),
('Rafael Ramos', '87654321099', '21944443333', 'Funcional', 'rafael.ramos@example.com');

-- Planos
INSERT INTO sga.plano (nome_plano, valor, duracao_meses, descricao) VALUES
('Mensal', 120.00, 1, 'Acesso ilimitado por 1 mês'),
('Trimestral', 330.00, 3, 'Acesso por 3 meses com desconto'),
('Anual', 1200.00, 12, 'Plano anual com mensalidade reduzida');

-- Matrículas
INSERT INTO sga.matricula (id_aluno, id_plano, data_matricula, data_inicio, data_fim, status) VALUES
(1, 1, '2025-11-01', '2025-11-01', '2025-12-01', 'ativo'),
(2, 3, '2025-10-15', '2025-10-15', '2026-10-14', 'ativo'),
(3, 2, '2025-09-10', '2025-09-10', '2025-12-09', 'inativo');

-- Pagamentos
INSERT INTO sga.pagamento (id_matricula, valor, data_pagamento, forma_pagamento, status_pagamento) VALUES
(1, 120.00, '2025-11-01', 'cartão', 'pago'),
(2, 1200.00, '2025-10-15', 'boleto', 'pago'),
(3, 330.00, '2025-09-10', 'cartão', 'pendente');

-- Aulas
INSERT INTO sga.aula (nome_aula, horario, dia_semana, capacidade, ambiente, id_instrutor) VALUES
('Spinning', '18:00', 'Segunda', 20, 'Sala A', 1),
('Funcional', '19:30', 'Quarta', 25, 'Sala B', 2);

-- Presenças (aula_aluno)
INSERT INTO sga.aula_aluno (id_aula, id_aluno, data, presente) VALUES
(1, 1, '2025-11-03', TRUE),
(2, 2, '2025-11-05', TRUE),
(1, 3, '2025-11-03', FALSE);

-- Equipamentos
INSERT INTO sga.equipamento (nome, tipo, data_aquisicao, estado_conservacao) VALUES
('Leg Press', 'Força', '2023-06-10', 'Bom'),
('Esteira X100', 'Cardio', '2021-02-20', 'Regular');

-- Fichas de treino
INSERT INTO sga.ficha_treino (id_aluno, data_criacao, objetivo, observacoes) VALUES
(1, '2025-10-20', 'Hipertrofia', 'Aumentar carga progressivamente'),
(2, '2025-11-02', 'Condicionamento', 'Foco em resistência');

-- Exercícios da ficha
INSERT INTO sga.ficha_exercicio (id_ficha, nome_exercicio, repeticoes, series, carga, observacao) VALUES
(1, 'Supino Reto', '8-10', 4, 'Carga progressiva', ''),
(1, 'Agachamento', '6-8', 4, 'Carga alta', ''),
(2, 'Burpee', '12-15', 3, 'Peso corporal', '');
