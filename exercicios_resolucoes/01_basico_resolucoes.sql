-- 1) Liste os nomes e idades dos alunos com idade maior que 20.
SELECT
	nome,
	idade
FROM
	Dim_Alunos
WHERE idade > 20

-- 2) Traga os professores cujo nome começa com a letra 'A'.
SELECT
	nome
FROM
	Dim_Professores
WHERE nome LIKE 'A%'

-- 3) Mostre os simulados ordenados da aplicação mais recente para a mais antiga.
SELECT
	nome,
	data_aplicacao
FROM
	Dim_Simulados
ORDER BY data_aplicacao DESC

-- 4) Liste todas as turmas cujo vestibular seja 'Enem'.
SELECT
	*
FROM
	Dim_Turmas
WHERE vestibular = 'Enem'

-- 5) Mostre apenas os alunos do gênero masculino que estudaram em escola privada.
SELECT *
FROM
	Dim_Alunos
WHERE genero = 'M' AND LOWER (origem_educacional) = 'privada'

-- 6) Liste os nomes dos simulados aplicados em 2025.
SELECT
	nome
FROM
	Dim_Simulados
WHERE YEAR(data_aplicacao) = 2025

-- 7) Crie uma coluna calculada exibindo 'Maior de Idade' ou 'Menor de Idade' para cada aluno.
SELECT
	nome, 
	idade,
	CASE	
		WHEN idade < 18 THEN 'Menor de Idade'
		ELSE 'Maior de Idade'
	END AS Maioridade
FROM Dim_Alunos

-- 8) Mostre todos os temas e seus graus de dificuldade.
SELECT 
	nome,
	grau_dificuldade
FROM
	Dim_Temas

-- 9) Traga as turmas e substitua valores nulos no vestibular por 'Não Informado'.
SELECT
	nome,
	COALESCE (vestibular, 'Não Informado') AS Vestibular
FROM Dim_Turmas


-- 10) Liste os 5 alunos mais novos (idade mais baixa).
SELECT TOP 5
	*
FROM
	Dim_Alunos
ORDER BY idade ASC