-- schema.sql
-- PostgreSQL schema for Sistema de Gestão de Academia (SGA)

CREATE SCHEMA IF NOT EXISTS sga;
SET search_path = sga;

CREATE TABLE IF NOT EXISTS aluno (
    id_aluno SERIAL PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    endereco TEXT,
    data_nascimento DATE,
    email VARCHAR(120)
);

CREATE TABLE IF NOT EXISTS instrutor (
    id_instrutor SERIAL PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    cpf CHAR(11) UNIQUE,
    telefone VARCHAR(20),
    especialidade VARCHAR(100),
    email VARCHAR(120)
);

CREATE TABLE IF NOT EXISTS plano (
    id_plano SERIAL PRIMARY KEY,
    nome_plano VARCHAR(80) NOT NULL,
    valor NUMERIC(10,2) NOT NULL,
    duracao_meses INTEGER NOT NULL,
    descricao TEXT
);

CREATE TABLE IF NOT EXISTS matricula (
    id_matricula SERIAL PRIMARY KEY,
    id_aluno INTEGER NOT NULL REFERENCES aluno(id_aluno) ON DELETE CASCADE,
    id_plano INTEGER REFERENCES plano(id_plano),
    data_matricula DATE NOT NULL DEFAULT CURRENT_DATE,
    data_inicio DATE,
    data_fim DATE,
    status VARCHAR(30) DEFAULT 'ativo'
);

CREATE TABLE IF NOT EXISTS pagamento (
    id_pagamento SERIAL PRIMARY KEY,
    id_matricula INTEGER NOT NULL REFERENCES matricula(id_matricula) ON DELETE CASCADE,
    valor NUMERIC(10,2) NOT NULL,
    data_pagamento DATE NOT NULL DEFAULT CURRENT_DATE,
    forma_pagamento VARCHAR(50),
    status_pagamento VARCHAR(30) DEFAULT 'pago'
);

CREATE TABLE IF NOT EXISTS aula (
    id_aula SERIAL PRIMARY KEY,
    nome_aula VARCHAR(100) NOT NULL,
    horario TIME,
    dia_semana VARCHAR(15),
    capacidade INTEGER,
    ambiente VARCHAR(80),
    id_instrutor INTEGER REFERENCES instrutor(id_instrutor)
);

-- Associative table for presença (Aluno participa de Aula)
CREATE TABLE IF NOT EXISTS aula_aluno (
    id_aula INTEGER NOT NULL REFERENCES aula(id_aula) ON DELETE CASCADE,
    id_aluno INTEGER NOT NULL REFERENCES aluno(id_aluno) ON DELETE CASCADE,
    data DATE NOT NULL DEFAULT CURRENT_DATE,
    presente BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id_aula, id_aluno, data)
);

CREATE TABLE IF NOT EXISTS equipamento (
    id_equipamento SERIAL PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    tipo VARCHAR(80),
    data_aquisicao DATE,
    estado_conservacao VARCHAR(60)
);

CREATE TABLE IF NOT EXISTS ficha_treino (
    id_ficha SERIAL PRIMARY KEY,
    id_aluno INTEGER NOT NULL REFERENCES aluno(id_aluno) ON DELETE CASCADE,
    data_criacao DATE NOT NULL DEFAULT CURRENT_DATE,
    objetivo TEXT,
    observacoes TEXT
);

CREATE TABLE IF NOT EXISTS ficha_exercicio (
    id_exercicio SERIAL PRIMARY KEY,
    id_ficha INTEGER NOT NULL REFERENCES ficha_treino(id_ficha) ON DELETE CASCADE,
    nome_exercicio VARCHAR(120) NOT NULL,
    repeticoes VARCHAR(60),
    series INTEGER,
    carga VARCHAR(60),
    observacao TEXT
);

-- Indexes (exemplos)
CREATE INDEX IF NOT EXISTS idx_aluno_cpf ON aluno(cpf);
CREATE INDEX IF NOT EXISTS idx_instrutor_cpf ON instrutor(cpf);
