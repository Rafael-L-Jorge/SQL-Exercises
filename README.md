# SQL Exercises

Este repositório contém uma coleção de exercícios de **SQL aplicados a Dados**, organizados por nível de dificuldade (Básico, Intermediário e Avançado).  

O objetivo deste repositório é **demonstrar minhas habilidades práticas em SQL voltado para área de dados**.  
Os exercícios refletem situações comuns do dia a dia em análise de dados e foram organizados em níveis de dificuldade.  

---

## Status do Projeto

**Este repositório está em construção contínua.**  

- Básico: ✅ Concluído (10/10)   
- Intermediário: ✅ Concluído (10/10) 
- Avançado: Em andamento  

---

## Estrutura do repositório

```
sql-exercises/
│
├── exercicios/         # Exercícios resolvidos
│   ├── 01_basico_resolucoes.sql
│   ├── 02_intermediario_resolucoes.sql
│   └── 03_avancado_resolucoes.sql
│
├── referencias/        # Materiais de apoio
│   ├── dicionario_de_dados.md
│   └── roadmap_30_exercicios.pdf
│   └── roadmap_30_exercicios.md
│
├── database/           # Recursos do banco
│   ├── diagrama_banco_dados.png
│   ├── sql_exercises.sqllite  <-banco pronto para uso
│
├── .gitignore
├── LICENSE
└── README.md
```

---

## Habilidades trabalhadas

### Básico
- Consultas simples: `SELECT, FROM, WHERE`
- Ordenação de dados: `ORDER BY`
- Filtros lógicos: `AND, OR, NOT`
- Aliases: `AS` (colunas e tabelas)
- Tratar valores nulos: `IS NULL`

### Intermediário
- Agregações: `COUNT, SUM, AVG, MIN, MAX`
- Agrupamento: `GROUP BY`
- Filtrar resultados agregados: `HAVING`
- Junções de tabelas: `INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN, CROSS JOIN`
- Funções condicionais: `CASE`
- Subconsultas: (em `SELECT, FROM, WHERE`)
- Common Table Expressions (CTEs): `WITH`

### Avançado
- Funções de janela: `ROW_NUMBER, RANK, DENSE_RANK`
- Totais acumulados e médias móveis: `SUM() OVER, AVG() OVER`
- Particionamento de dados: `PARTITION BY`
- Funções de string: `CONCAT, SUBSTRING, UPPER, LOWER`
- Funções de data: `DATEADD, DATEDIFF, YEAR, MONTH`
- Operações matemáticas: `ROUND, FLOOR, CEIL`
- Combinação de métricas e análises avançadas em BI

---

## Banco de Dados para Exercícios SQL

Este repositório inclui um banco de dados **SQLite** pronto para consultas (`sql_exercises.sqlite`), criado a partir de dados fictícios para fins de estudo.

### Como usar

1. Baixe o arquivo [`sql_exercises.sqlite`](./database/sql_exercises.sqlite).
2. Abra em um cliente SQLite de sua preferência:
   - [DB Browser for SQLite](https://sqlitebrowser.org/dl/) (interface gráfica)
   - [SQLite Online](https://sqliteonline.com/) (no navegador, sem instalar nada)
   - Ou use diretamente em qualquer linguagem que suporte SQLite.

A descrição das tabelas e colunas está disponível no [Dicionário de Dados](./referencias/dicionario_dados.md).

> ⚠️ Todos os dados são fictícios e foram criados apenas para fins de **prática em SQL**.

---

## Licença

Este projeto está licenciado sob a [MIT License](./LICENSE).

---

Desenvolvido por **Rafael Jorge** — para estudos em SQL e Dados.
