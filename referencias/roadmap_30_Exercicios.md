Roadmap de 30 Exercícios de SQL.
Este documento apresenta 30 exercícios inéditos em SQL, organizados em níveis Básico, Intermediário e Avançado.


\*\*Básico\*\*

-- 1) Liste os nomes e idades dos alunos com idade maior que 20. (SELECT, WHERE)



-- 2) Traga os professores cujo nome começa com a letra 'A'. (SELECT, WHERE, LIKE)



-- 3) Mostre os simulados ordenados da aplicação mais recente para a mais antiga. (ORDER BY DESC)



-- 4) Liste todas as turmas cujo vestibular seja 'Enem'. (SELECT, WHERE)



-- 5) Mostre apenas os alunos do gênero masculino que estudaram em escola privada. (WHERE, AND)



-- 6) Liste os nomes dos simulados aplicados em 2025. (YEAR(), WHERE)



-- 7) Crie uma coluna calculada exibindo 'Maior de Idade' ou 'Menor de Idade' para cada aluno. (CASE)



-- 8) Mostre todos os temas e seus graus de dificuldade. (SELECT)



-- 9) Traga as turmas e substitua valores nulos no vestibular por 'Não Informado'. (COALESCE)



-- 10) Liste os 5 alunos mais novos (idade mais baixa). (ORDER BY, TOP)





\*\*Intermediário\*\*

-- 1) Mostre a quantidade de alunos por origem educacional (pública/privada). (GROUP BY, COUNT)



-- 2) Traga a quantidade de questões em cada simulado. (COUNT, GROUP BY)



-- 3) Liste os simulados que tiveram mais de 15 questões. (GROUP BY, HAVING)



-- 4) Mostre o total de simulados aplicados por ano. (YEAR, GROUP BY, COUNT)



-- 5) Traga os nomes dos alunos e os nomes das turmas em que estão. (INNER JOIN)



-- 6) Mostre as disciplinas e os professores associados. (JOIN, DISTINCT)



-- 7) Liste os temas junto com o nome da disciplina correspondente. (JOIN)



-- 8) Crie uma lista de simulados e a quantidade de alunos que participaram. (JOIN, COUNT, DISTINCT)



-- 9) Mostre os alunos que nunca responderam nenhuma questão. (LEFT JOIN, IS NULL)



-- 10) Liste os simulados e indique 'Antigo' para antes de 2025 e 'Recente' para depois. (CASE)





\*\*Avançado\*\*



-- 1) Liste os 3 alunos mais velhos de cada turma. (ROW\_NUMBER(), PARTITION BY)



-- 2) Crie um ranking de professores por quantidade de turmas em que atuaram. (RANK(), COUNT, GROUP BY)



-- 3) Calcule a taxa de acerto acumulada de cada aluno ao longo do tempo. (SUM() OVER, ORDER BY)



-- 4) Mostre a média móvel de acertos dos alunos a cada simulado. (AVG() OVER, ROWS BETWEEN)



-- 5) Traga o percentual de questões de dificuldade 'Alta' por disciplina. (JOIN, COUNT, GROUP BY)



-- 6) Mostre para cada simulado, o total de alunos distintos que participaram. (COUNT(DISTINCT), JOIN)



-- 7) Liste os temas com percentual de erro acima de 40%. (SUM, COUNT, GROUP BY, HAVING)



-- 8) Crie uma CTE que calcule a média de idade dos alunos por turma e depois mostre quais turmas têm média > 22 anos. (WITH, CTE, AVG)



-- 9) Use COALESCE para exibir 'Sem Disciplina' caso algum professor não tenha disciplina associada. (LEFT JOIN, COALESCE)



-- 10) Liste todas as combinações possíveis entre professores e simulados. (CROSS JOIN)



