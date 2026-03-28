--Lista 6--

-- 1. Crie um índice na tabela livro para melhorar a busca pelo campo titulo. 

CREATE INDEX idx_livro_titulo ON biblioteca01.livro (titulo);

-----------------------------------------------------------------------
-- 2. Crie um índice na tabela emprestimo para otimizar a busca por data_emprestimo. 

CREATE INDEX idx_emprestimo_data ON biblioteca01.emprestimo (data_emprestimo);

-----------------------------------------------------------------------
-- 3. Crie uma VIEW chamada vw_historico_emprestimos que exiba o nome do usuário, título do
-- livro, data do empréstimo e data de devolução. 

CREATE VIEW vw_historico_emprestimos AS
SELECT 
    u.nome,
    l.titulo,
    em.data_emprestimo,
    em.data_devolucao
FROM biblioteca01.emprestimo em
JOIN biblioteca01.usuario u 
	ON em.idusuario = u.idusuario
JOIN biblioteca01.livro l 
	ON em.idlivro = l.idlivro;

SELECT * FROM vw_historico_emprestimos;

-----------------------------------------------------------------------
--  4. Explique como um índice pode melhorar a performance de uma consulta e quais são os
-- impactos negativos de usar muitos índices. 

-- O índice deixa a busca mais rápida, porque o banco não precisa olhar linha por linha
-- ele usa uma estrutura organizada que já aponta onde está o dado.

-- Entre os impactos negativos, vemos que muitos índices ocupam espaço e podem deixar os comandos de
-- insert, update e delete mais lentos.

-----------------------------------------------------------------------
-- 5. Teste a performance de uma consulta antes e depois de criar um índice usando EXPLAIN ANALYZE.  

DROP INDEX IF EXISTS biblioteca01.idx_livro_titulo;

EXPLAIN ANALYZE
SELECT * FROM biblioteca01.livro
WHERE titulo = 'Dom Casmurro';
-- aqui faz busca completa, sem index (mais lento)


CREATE INDEX idx_livro_titulo ON biblioteca01.livro (titulo);

EXPLAIN ANALYZE
SELECT * FROM biblioteca01.livro
WHERE titulo = 'Dom Casmurro';
-- aqui usa índice (mais rápido)
