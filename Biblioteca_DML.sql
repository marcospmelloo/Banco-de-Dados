-- CREATE DATABASE biblioteca;
-- CREATE SCHEMA  biblioteca01;
CREATE TABLE biblioteca01.livro(
	idlivro SERIAL PRIMARY KEY,
	titulo VARCHAR(100) NOT NULL,
	autor VARCHAR(100)NOT NULL,
	ano_publicacao INT NOT NULL,
	genero VARCHAR(100) NOT NULL,
	quantidade_estoque INT NOT NULL
);

CREATE TABLE biblioteca01.usuario(
	idusuario SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	cpf VARCHAR(11) UNIQUE,
	email VARCHAR(100) UNIQUE,
	telefone VARCHAR(20) NOT NULL,
	endereco VARCHAR(250) NOT NULL
);

CREATE TYPE biblioteca01.status_livro AS ENUM ('emprestado', 'devolvido');

CREATE TABLE biblioteca01.emprestimo(
	idemprestimo SERIAL PRIMARY KEY,
	data_emprestimo DATE NOT NULL,
	data_devolucao DATE,
	status biblioteca01.status_livro NOT NULL,
	idusuario INT REFERENCES biblioteca01.usuario(idusuario),
	idlivro INT REFERENCES biblioteca01.livro(idlivro)
);

ALTER TABLE biblioteca01.livro
	ADD COLUMN editora VARCHAR(100);

---------------------------------------------------------------------------------
--Exercícios Lista 3 - DML

INSERT INTO 
	biblioteca01.livro (titulo, autor, ano_publicacao, genero, quantidade_estoque, editora)
VALUES
	('Dom Casmurro', 'Machado de Assis', 1899, 'Romance', 12, 'Editora Globo'),
	('Memórias Póstumas de Brás Cubas', 'Machado de Assis', 1881, 'Romance', 8, 'Companhia das Letras'),
	('Quincas Borba', 'Machado de Assis', 1891, 'Romance', 10, 'Editora Nova Aguilar'),
	('Helena', 'Machado de Assis', 1876, 'Romance', 7, 'Martin Claret'),
	('Esaú e Jacó', 'Machado de Assis', 1904, 'Romance', 6, 'Penguin Companhia'),
	('Crime e Castigo', 'Fiódor Dostoiévski', 1866, 'Romance', 9, 'Editora 34'),
	('Os Irmãos Karamázov', 'Fiódor Dostoiévski', 1880, 'Romance', 6, 'Companhia das Letras'),
	('O Idiota', 'Fiódor Dostoiévski', 1869, 'Romance', 8, 'Editora 34'),
	('O Jogador', 'Fiódor Dostoiévski', 1867, 'Romance', 5, 'Martin Claret'),
	('Noites Brancas', 'Fiódor Dostoiévski', 1848, 'Novela', 11, 'Penguin Companhia');

SELECT * FROM biblioteca01.livro;

---------------------------------------------------------------------------------------------------

INSERT INTO
	biblioteca01.usuario (nome, cpf, email, telefone, endereco)
VALUES
	('Marcos', '12332112311', 'marcos123@gmail.com', '5524992889988', 'Estrada União e Indústria, Itaipava'),
	('Paulo', '23443223422', 'paulo123@hotmail.com', '5524992554433', 'Estrada Correia da Veiga, Itaipava'),
	('Pedro', '87698745676', 'pedromello@gmail.com', '5524992929292', 'Avenida Barão do Rio Branco, Petrópolis'),
	('Maria', '12345678901', 'maria13058@gmail.com', '5524988276766', 'Avenida Ipiringa, Petrópolis'),
	('Ricardo', '19876543212', 'ricardo123@gmail.com', '5524981412788', 'Rodovia Philuvio Cerqueira Rodrigues, Itaipava');

SELECT * FROM biblioteca01.usuario;

---------------------------------------------------------------------------------------------------

UPDATE biblioteca01.usuario
SET telefone = '5524988273655'
where idusuario = 6;

---------------------------------------

INSERT INTO
	biblioteca01.emprestimo (data_emprestimo, data_devolucao, status, idusuario, idlivro)
VALUES
	('2026/03/01', '2026/03/10', 'devolvido', 1, 8),
	('2026/03/05', NULL, 'emprestado', 4, 10),
	('2026/03/10', '2026/03/20', 'devolvido', 3, 1);

SELECT idusuario FROM biblioteca01.emprestimo;

-- Tentativa de remover um usuário que possui empréstimo
DELETE FROM 
	biblioteca01.usuario
WHERE idusuario = 1;
-- Resultado:
-- Ao tentar excluir o usuário, retornou um erro.
-- Isso acontece porque esse usuário está relacionado a um empréstimo na outra tabela.
-- Como existe uma chave estrangeira, o banco não permite a exclusão para evitar problemas nos dados.

---------------------------------------------------------------------------------------------------------------

--Diferença entre DELETE FROM E TRUNCATE TABLE:
--DELETE FROM: Apaga dados da tabela e pode-se utilizar o comando WHERE.
--Quando usar: quando quiser apagar registros específicos.

--TRUNCATE TABLE: Remove todos os dados da tabela.
--Quando usar: quando quiser apagar a tabela inteira e reiniciar o id.
