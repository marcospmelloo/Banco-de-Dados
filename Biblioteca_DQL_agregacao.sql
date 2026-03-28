-----Lista 5 - Funções de agregação e agrupamento-----

-- 1. Conte quantos livros estão cadastrados na biblioteca usando COUNT. 

SELECT COUNT(*) AS Total_livros FROM biblioteca01.livro;

-----------------------------------------------------------------------
-- 2. Descubra a média de tempo de empréstimo dos livros utilizando AVG.

SELECT ROUND(AVG(data_devolucao - data_emprestimo), 2) AS media_dias 
FROM biblioteca01.emprestimo;

-----------------------------------------------------------------------
-- 3. Encontre o livro mais antigo e o mais recente utilizando MIN e MAX. 

SELECT 
	MIN(ano_publicacao) AS mais_antigo,
	MAX(ano_publicacao) AS mais_recente
FROM biblioteca01.livro;


-----------------------------------------------------------------------
-- 4. Liste quantos empréstimos cada usuário já fez, agrupando por nome do usuário. 

SELECT u.nome, COUNT(em.idemprestimo) AS total_emprestimos
FROM biblioteca01.usuario u
LEFT JOIN biblioteca01.emprestimo em
    ON u.idusuario = em.idusuario
GROUP BY u.nome
ORDER BY COUNT (em.idemprestimo) DESC;

-----------------------------------------------------------------------
-- 5. Mostre quantos livros existem por gênero, agrupando os resultados.

SELECT genero, COUNT(*) AS quantidade_livros
FROM biblioteca01.livro
GROUP BY genero;