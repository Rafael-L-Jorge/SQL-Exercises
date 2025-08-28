# SQL Exercises

Este repositório contém uma coleção de exercícios de **SQL aplicados a Dados**, organizados por nível de dificuldade (Básico, Intermediário e Avançado).  

O objetivo deste repositório é **demonstrar minhas habilidades práticas em SQL voltado para área de dados**.  
Os exercícios refletem situações comuns do dia a dia em análise de dados e foram organizados em níveis de dificuldade.  

Caso alguém queira praticar, o repositório também pode ser utilizado como guia de estudos.  

---

## Status do Projeto

**Este repositório está em construção contínua.**  

- Básico: ✅ Concluído (10/10)   
- Intermediário: Em andamento  
- Avançado: A ser adicionado  

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
│
├── database/           # Recursos do banco
│   ├── diagrama_banco_dados.png
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

## Banco de Dados

O banco de dados utilizado foi **modelado e criado por mim** no projeto [vp-educacional-analytics](https://github.com/Rafael-L-Jorge/vp-educacional-analytics), disponibilizado aqui no GitHub.  

> Nota: Este repositório **não disponibiliza a base de dados real**.  
> Para praticar, utilize o **dicionário de dados** e o **diagrama** incluídos aqui como referência para recriar o banco em seu ambiente.  
> Consulte também o [Roadmap de 30 Exercícios](./referencias/roadmap_30_exercicios.pdf) como guia estruturado de prática.

---

## Como usar

1. Acesse a pasta `exercicios/` e explore as queries resolvidas.  
2. Utilize o **dicionário de dados** em `referencias/` para entender a modelagem.  
3. Consulte o **diagrama do banco** em `database/` para visualizar as relações entre tabelas.  
4. Caso queira um caminho estruturado, veja o **roadmap em PDF** em `referencias/`.  

Além de ser um material de prática, este repositório foi pensado para **evidenciar minhas habilidades em SQL aplicadas a cenários da área de dados**, com consultas organizadas e documentadas.  

---

## Licença

Este projeto está licenciado sob a [MIT License](./LICENSE).

---

Desenvolvido por **Rafael Jorge** — para estudos em SQL e BI.
