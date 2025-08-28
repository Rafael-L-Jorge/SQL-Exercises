# Dicionário de dados | Banco SQLServer

## Dim_Alunos
| Nome da Coluna        | Descrição                                                       | Tipo de Dado |
|-----------------------|-----------------------------------------------------------------|--------------|
| `id_aluno`            | Identificador único do aluno                                    | int (PK)     |
| `nome`                | Nome do aluno                                                   | nvarchar     |
| `idade`               | Idade do aluno                                                  | int          |
| `genero`              | Gênero do aluno (`m`, `f`)                       | nvarchar     |
| `origem_educacional`  | Tipo de escola de origem (`pública`, `privada`)                 | nvarchar     |
| `id_turma`            | Chave estrangeira referenciando a turma do aluno                | int (FK)     |


## Dim_Disciplinas
| Nome da Coluna   | Descrição                      | Tipo de Dado |
|------------------|--------------------------------|--------------|
| `id_disciplina`  | Identificador da disciplina    | int (PK)     |
| `nome`           | Nome da disciplina             | nvarchar     |


## Tabela: Dim_Professores
| Nome da Coluna   | Descrição                                 | Tipo de Dado |
|------------------|-------------------------------------------|--------------|
| `id_professor`   | Identificador único do professor          | int (PK)     |
| `nome`           | Nome do professor                         | nvarchar     |


## Dim_Questoes
| Nome da Coluna      | Descrição                                                   | Tipo de Dado |
|---------------------|-------------------------------------------------------------|--------------|
| `id_questao`        | Identificador único da questão                              | int (PK)     |
| `id_simulado`       | Chave estrangeira para `Dim_Simulados`                      | int (FK)     |
| `id_tema`           | Chave estrangeira para `Dim_Temas`                          | int (FK)     |
| `numero_questao`    | Número da questão no simulado (1 a 20)                      | int          |


## Dim_Simulados
| Nome da Coluna   | Descrição                                             | Tipo de Dado |
|------------------|-------------------------------------------------------|--------------|
| `id_simulado`    | Identificador do simulado                             | int (PK)     |
| `nome`           | Nome do simulado                                      | nvarchar     |
| `semana`         | Semana de aplicação                                   | int          |
| `data_aplicacao` | Data de aplicação do simulado                         | date         |
| `id_tipo`        | Chave estrangeira para `Dim_Tipo_Simulado`            | int (FK)     |
| `id_turma`       | Chave estrangeira para `Dim_Turmas`                   | int (FK)     |


## Dim_Temas
| Nome da Coluna      | Descrição                                                     | Tipo de Dado |
|---------------------|---------------------------------------------------------------|--------------|
| `id_tema`           | Identificador do tema                                         | int (PK)     |
| `id_disciplina`     | Chave estrangeira para `Dim_Disciplinas`                      | int (FK)     |
| `nome`              | Nome do tema (ex.: `Citologia`, `Estequiometria`)             | nvarchar     |
| `grau_dificuldade`  | Nível de dificuldade (`Baixo`, `Medio`, `Alto`)               | nvarchar     |


## Dim_Tipo_Simulado
| Nome da Coluna   | Descrição                                     | Tipo de Dado |
|------------------|-----------------------------------------------|--------------|
| `id_tipo`        | Identificador do tipo de simulado             | int (PK)     |
| `descricao`      | Tipo (`Diagnostico`, `Regular`, `Final`)      | nvarchar     |


## Dim_Turmas
| Nome da Coluna   | Descrição                                      | Tipo de Dado |
|------------------|------------------------------------------------|--------------|
| `id_turma`       | Identificador único da turma                   | int (PK)     |
| `nome`           | Nome da turma                                  | nvarchar     |
| `vestibular`     | Nome do vestibular associado à turma           | nvarchar     |


## Tabela: Fato_Rel_Turma_Professor
| Nome da Coluna   | Descrição                                                        | Tipo de Dado |
|------------------|------------------------------------------------------------------|--------------|
| `id_turma`       | Chave estrangeira para `Dim_Turmas`                              | int (PK)     |
| `id_professor`   | Chave estrangeira para `Dim_Professores`                         | int (PK)     |
| `id_disciplina`  | Chave estrangeira para `Dim_Disciplinas`                         | int (PK)     |
| `data_inicio`    | Inicio como professor da turma                                   | date         |
| `data_fim`       | Fim como professor da turma                                      | date         |


## Fato_Respostas
| Nome da Coluna   | Descrição                                                     | Tipo de Dado |
|------------------|---------------------------------------------------------------|--------------|
| `id_resposta`    | Identificador único da resposta                               | int (PK)     |
| `id_aluno`       | Chave estrangeira para `Dim_Alunos`                           | int (FK)     |
| `id_questao`     | Chave estrangeira para `Dim_Questoes`                         | int (FK)     |
| `acertou`        | Resultado da questão (0 = errado, 1 = certo)                  | int          |