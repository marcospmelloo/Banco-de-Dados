--Comandos DQL para o banco de dados Biblioteca--

--1. Selecione todos os livros cadastrados no banco de dados.

SELECT * FROM biblioteca01.livro;

--2. Liste o nome do usuário e o título do livro de todos os empréstimos realizados, utilizando um JOIN.

SELECT u.nome, l.titulo FROM biblioteca01.emprestimo em
	JOIN biblioteca01.usuario u
		ON u.idusuario = em.idusuario
	JOIN biblioteca01.livro l
		ON l.idlivro = em.idlivro;
		
--3. Selecione todos os empréstimos que ainda não foram devolvidos (status = 'emprestado'). 

SELECT * FROM biblioteca01.emprestimo WHERE status = 'emprestado';

--4. Liste todos os autores e os livros que eles escreveram. 

SELECT autor, titulo FROM biblioteca01.livro;

--5. Crie uma consulta que mostre todos os usuários e os livros que já pegaram emprestado, incluindo usuários que nunca pegaram livros.

SELECT u.nome, l.titulo FROM biblioteca01.usuario u
	LEFT JOIN biblioteca01.emprestimo em
		ON u.idusuario = em.idusuario
	LEFT JOIN biblioteca01.livro l
		ON l.idlivro = em.idlivro;
