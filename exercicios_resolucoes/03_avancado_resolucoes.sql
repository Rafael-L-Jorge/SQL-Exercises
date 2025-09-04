-- 1) Liste os 3 alunos mais velhos de cada turma.
WITH AlunosMaisVelhos AS (
    SELECT
        a.id_aluno,
        a.nome,
        t.nome AS turma,      
        Idade,
        ROW_NUMBER() OVER (
            PARTITION BY t.nome
            ORDER BY a.idade DESC
        ) AS rn
    FROM 
		Dim_Alunos a
	LEFT JOIN Dim_Turmas t
	ON A.id_turma = t.id_turma
)
SELECT 
	id_aluno, 
	nome, 
	turma, 
	idade
FROM 
	AlunosMaisVelhos
WHERE rn <= 3
ORDER BY turma, rn

-- 2) Crie um ranking de professores por quantidade de turmas em que atuaram.
WITH QtdTurmas AS (
    SELECT 
        p.id_professor,
        p.nome AS professor,
        COUNT(t.id_turma) AS qtd_turmas
    FROM 
		Fato_Rel_Turma_Professor frt
	JOIN Dim_Turmas t
		ON frt.id_turma = t.id_turma
	JOIN Dim_Professores p 
		ON frt.id_professor = p.id_professor
    GROUP BY p.id_professor, p.nome
)
SELECT
    id_professor,
    professor,
    qtd_turmas,
    RANK() OVER (ORDER BY qtd_turmas DESC) AS ranking
FROM 
	QtdTurmas
ORDER BY ranking
	
-- 3) Calcule a taxa de acerto acumulada de cada aluno ao longo do tempo.
SELECT
    a.nome AS aluno,
    s.nome AS simulado,
    s.data_aplicacao,
    r.acertou,

    -- acertos acumulados até a resposta atual
    SUM(r.acertou) OVER (
        PARTITION BY r.id_aluno
        ORDER BY s.data_aplicacao, q.numero_questao
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS acertos_acumulados,

    -- total de questões respondidas até o momento
    COUNT(*) OVER (
        PARTITION BY r.id_aluno
        ORDER BY s.data_aplicacao, q.numero_questao
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS total_acumulado,

    -- taxa de acerto acumulada
    CAST(
        1.0 * SUM(r.acertou) OVER (
            PARTITION BY r.id_aluno
            ORDER BY s.data_aplicacao, q.numero_questao
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        )
        /
        NULLIF(COUNT(*) OVER (
            PARTITION BY r.id_aluno
            ORDER BY s.data_aplicacao, q.numero_questao
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ), 0)
        AS DECIMAL(5,2)
    ) AS taxa_acerto_acumulada

FROM Fato_Respostas r
JOIN Dim_Alunos a
  ON a.id_aluno = r.id_aluno
JOIN Dim_Questoes q
  ON r.id_questao = q.id_questao
JOIN Dim_Simulados s
  ON q.id_simulado = s.id_simulado
ORDER BY r.id_aluno, s.data_aplicacao, q.numero_questao


-- 4) Mostre a média móvel de acertos dos alunos a cada simulado.
-- Passo 1: taxa de acerto por simulado
WITH TaxaPorSimulado AS (
    SELECT
        a.id_aluno,
        a.nome AS aluno,
        s.id_simulado,
        s.nome AS simulado,
        s.data_aplicacao,
        CAST(SUM(r.acertou) AS FLOAT) / COUNT(*) AS taxa_acerto
    FROM 
		Fato_Respostas r
    JOIN Dim_Alunos a
      ON a.id_aluno = r.id_aluno
    JOIN Dim_Questoes q
      ON r.id_questao = q.id_questao
    JOIN Dim_Simulados s
      ON q.id_simulado = s.id_simulado
    GROUP BY a.id_aluno, a.nome, s.id_simulado, s.nome, s.data_aplicacao
)

-- Passo 2: média móvel da taxa de acerto
SELECT
    aluno,
    simulado,
    data_aplicacao,
    taxa_acerto,
    AVG(taxa_acerto) OVER (
        PARTITION BY id_aluno
        ORDER BY data_aplicacao
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS media_movel_3
FROM 
	TaxaPorSimulado
ORDER BY aluno, data_aplicacao

-- 5) Traga o percentual de questões de dificuldade 'Alta' por disciplina.
SELECT
    d.nome AS disciplina,
    COUNT(q.id_questao) AS total_questoes,
    SUM(CASE WHEN t.grau_dificuldade = 'Alto' THEN 1 ELSE 0 END) AS questoes_alta,
    CAST(
        100.0 * SUM(CASE WHEN t.grau_dificuldade = 'Alto' THEN 1 ELSE 0 END) 
        / NULLIF(COUNT(q.id_questao), 0)
        AS DECIMAL(5,2)
    ) AS perc_alta
FROM 
	Dim_Questoes q
JOIN Dim_Temas t
  ON q.id_tema = t.id_tema
JOIN Dim_Disciplinas d
  ON t.id_disciplina = d.id_disciplina
GROUP BY d.nome
ORDER BY perc_alta DESC

-- 6) Mostre para cada simulado, o total de alunos distintos que participaram.
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
ORDER BY s.nome

-- 7) Liste os temas com percentual de erro acima de 40%.
SELECT
    t.nome AS tema,
    d.nome AS disciplina,
    COUNT(r.id_resposta) AS total_respostas,
    SUM(CASE WHEN r.acertou = 0 THEN 1 ELSE 0 END) AS erros,
    CAST(
        100.0 * SUM(CASE WHEN r.acertou = 0 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(r.id_resposta), 0)
        AS DECIMAL(5,2)
    ) AS perc_erro
FROM 
	Fato_Respostas r
JOIN Dim_Questoes q
  ON r.id_questao = q.id_questao
JOIN Dim_Temas t
  ON q.id_tema = t.id_tema
JOIN Dim_Disciplinas d
  ON t.id_disciplina = d.id_disciplina
GROUP BY t.nome, d.nome
HAVING 
    100.0 * SUM(CASE WHEN r.acertou = 0 THEN 1 ELSE 0 END)
    / NULLIF(COUNT(r.id_resposta), 0) > 40
ORDER BY perc_erro DESC



-- 8) Crie uma CTE que calcule a média de idade dos alunos por turma e depois mostre quais turmas têm média > 22 anos.
WITH MediaIdadeTurma AS (
    SELECT
        t.nome AS turma,
        AVG(a.idade) AS media_idade
    FROM 
		Dim_Alunos a
    JOIN Dim_Turmas t
      ON a.id_turma = t.id_turma
    GROUP BY t.nome
)
SELECT turma, media_idade
FROM 
	MediaIdadeTurma
WHERE media_idade > 22
ORDER BY media_idade DESC



-- 9) Use COALESCE para exibir 'Sem Disciplina' caso algum professor não tenha disciplina associada.
SELECT
    p.nome AS professor,
    COALESCE(d.nome, 'Sem Disciplina') AS disciplina
FROM 
	Dim_Professores p
LEFT JOIN Fato_Rel_Turma_Professor frt
  ON p.id_professor = frt.id_professor
LEFT JOIN Dim_Disciplinas d
  ON frt.id_disciplina = d.id_disciplina
ORDER BY professor


-- 10) Liste todas as combinações possíveis entre professores e simulados.
SELECT
    p.nome AS professor,
    s.nome AS simulado
FROM 
	Dim_Professores p
CROSS JOIN Dim_Simulados s
ORDER BY professor, simulado
