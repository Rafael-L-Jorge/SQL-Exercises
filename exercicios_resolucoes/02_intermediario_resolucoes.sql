-- 1) Mostre a quantidade de alunos por origem educacional (pública/privada).
SELECT
	origem_educacional,
	COUNT(*) AS Total_Alunos
FROM
	Dim_Alunos
GROUP BY origem_educacional


-- 2) Traga a quantidade de questões em cada simulado.
SELECT 
    s.nome,
    COUNT(q.id_questao) AS total_questoes
FROM 
	Dim_Questoes q
JOIN Dim_Simulados s 
	ON q.id_simulado = s.id_simulado
GROUP BY s.nome

-- 3) Liste os simulados que tiveram mais de 15 questões.
SELECT
    s.nome,
    COUNT(q.id_questao) AS Total_questoes
FROM 
	Dim_Questoes q
JOIN Dim_Simulados s 
	ON q.id_simulado = s.id_simulado
GROUP BY s.nome
HAVING COUNT(q.id_questao) > 15


-- 4) Mostre o total de simulados aplicados por ano.
SELECT
	YEAR(data_aplicacao) AS Ano,
	COUNT(*) AS total_simulados
FROM
	Dim_Simulados
GROUP BY YEAR(data_aplicacao)

-- 5) Traga os nomes dos alunos e os nomes das turmas em que estão.
SELECT
	a.nome AS nome_aluno,
	t.nome AS nome_turma
FROM 
	Dim_Alunos a
INNER JOIN Dim_Turmas t
	ON a.id_turma = t.id_turma

-- 6) Mostre as disciplinas e os professores associados.
SELECT DISTINCT 
	d.nome AS Disciplina,
    p.nome AS Professor
FROM 
	Fato_Rel_Turma_Professor frt
JOIN Dim_Disciplinas d 
	ON frt.id_disciplina = d.id_disciplina
JOIN Dim_Professores p 
	ON frt.id_professor = p.id_professor

-- 7) Liste os temas junto com o nome da disciplina correspondente.
SELECT
	t.nome AS Tema,
	d.nome AS Disciplina
FROM 
	Dim_Temas t
JOIN Dim_Disciplinas d
	ON t.id_disciplina = d.id_disciplina

-- 8) Crie uma lista de simulados e a quantidade de alunos que participaram.
SELECT
    s.nome AS Simulado,
    COUNT(DISTINCT r.id_aluno) AS Total_Alunos
FROM 
	Fato_Respostas r
JOIN Dim_Questoes q 
	ON r.id_questao = q.id_questao
JOIN Dim_Simulados s 
	ON q.id_simulado = s.id_simulado
GROUP BY s.nome

-- 9) Mostre os alunos que nunca responderam nenhuma questão.
SELECT
    a.nome AS Aluno,
    a.idade AS Idade,
    a.genero AS Genero,
    a.origem_educacional AS Origem_Educacional
FROM 
	Dim_Alunos a
LEFT JOIN Fato_Respostas r 
	ON a.id_aluno = r.id_aluno
WHERE r.id_resposta IS NULL
 
-- 10) Liste os simulados e indique 'Antigo' para antes de 2025 e 'Recente' para depois.
SELECT
	nome,
	CASE
		WHEN YEAR(data_aplicacao) < 2025 THEN 'Antigo'
		ELSE 'Recente'
	END AS Status_Simulado
FROM
	Dim_Simulados