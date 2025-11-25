---
title: Documentação SQL
---

# Documentação e instruções para executar os scripts SQL

Este diretório contém os scripts SQL necessários para criar e povoar o banco de dados do SGA.

## Arquivos importantes
- `schema.sql` — criação do schema `sga` e tabelas.
- `inserts.sql` — scripts de inserção de dados.
- `queries.sql` — exemplos de consultas.
- `updates_deletes.sql` — exemplos de UPDATE e DELETE.
- `README.md` — instruções detalhadas (contidas no zip de scripts).

## Como usar
1. Baixe o zip dos scripts pelo link **Download dos scripts SQL** na página inicial.
2. Siga as instruções no README incluso (abrir `README.md` no zip).
3. Execute `schema.sql` antes de `inserts.sql`.

## Observações
- Os scripts foram desenvolvidos para PostgreSQL. Ajustes mínimos podem ser necessários para outro SGBD.
- Recomenda-se rodar em ambiente de testes.
