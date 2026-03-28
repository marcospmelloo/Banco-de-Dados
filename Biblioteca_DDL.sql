CREATE DATABASE biblioteca;
CREATE SCHEMA  biblioteca01;
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
