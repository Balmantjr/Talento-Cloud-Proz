-- Criação do banco de dados ESCOLA
CREATE DATABASE ESCOLA;

-- Seleciona o banco de dados ESCOLA para uso
USE ESCOLA;

-- Criação da tabela ALUNO
CREATE TABLE ALUNO (
    ID INT PRIMARY KEY,          -- Chave primária do tipo INT
    Nome VARCHAR(100),          -- Atributo Nome do tipo VARCHAR com até 100 caracteres
    Matricula VARCHAR(20),      -- Atributo Matricula do tipo VARCHAR com até 20 caracteres
    Email VARCHAR(100),         -- Atributo Email do tipo VARCHAR com até 100 caracteres
    Endereco VARCHAR(200),      -- Atributo Endereco do tipo VARCHAR com até 200 caracteres
    Telefone VARCHAR(20)        -- Atributo Telefone do tipo VARCHAR com até 20 caracteres
);

-- Criação da tabela EMPRÉSTIMO
CREATE TABLE EMPRESTIMO (
    Codigo INT PRIMARY KEY,     -- Chave primária do tipo INT
    Data_hora DATETIME,         -- Atributo Data_hora do tipo DATETIME
    Matric_Aluno VARCHAR(20),   -- Atributo Matric_Aluno do tipo VARCHAR com até 20 caracteres
    Data_devolucao DATE         -- Atributo Data_devolucao do tipo DATE
);

-- Criação da tabela LIVRO
CREATE TABLE LIVRO (
    Cod_Livro INT PRIMARY KEY,  -- Chave primária do tipo INT
    Titulo VARCHAR(200),        -- Atributo Titulo do tipo VARCHAR com até 200 caracteres
    Autor VARCHAR(100),         -- Atributo Autor do tipo VARCHAR com até 100 caracteres
    Cod_Sessao INT              -- Atributo Cod_Sessao do tipo INT
);

-- Criação da tabela SESSAO
CREATE TABLE SESSAO (
    Codigo INT PRIMARY KEY,     -- Chave primária do tipo INT
    Descricao VARCHAR(100),     -- Atributo Descricao do tipo VARCHAR com até 100 caracteres
    Localizacao VARCHAR(100)    -- Atributo Localizacao do tipo VARCHAR com até 100 caracteres
);

-- Criação da tabela LIVRO_EMPRÉSTIMO
CREATE TABLE LIVRO_EMPRESTIMO (
    Cod_Livro INT,              -- Chave estrangeira para LIVRO
    Cod_Emprestimo INT,         -- Chave estrangeira para EMPRÉSTIMO
    PRIMARY KEY (Cod_Livro, Cod_Emprestimo),
    FOREIGN KEY (Cod_Livro) REFERENCES LIVRO(Cod_Livro),
    FOREIGN KEY (Cod_Emprestimo) REFERENCES EMPRESTIMO(Codigo)
);

-- Inserção de dados na tabela ALUNO
INSERT INTO ALUNO (ID, Nome, Matricula, Email, Endereco, Telefone) VALUES
(01, 'João Carlos', '1234', 'Jcarlos@gmail.com', 'Rua 13 de maio', '(11)7825-4489'),
(02, 'José Vitor', '2345', 'Jvitor@gmail.com', 'Rua da Saudade', '(11)7825-6589'),
(03, 'Paulo André', '3456', 'Pandr@gmail.com', 'Rua do Sol', '(11)7825-4495');

-- Inserção de dados na tabela EMPRÉSTIMO
INSERT INTO EMPRESTIMO (Codigo, Data_hora, Matric_Aluno, Data_devolucao) VALUES
(01, '2022-03-12 15:25:00', '1234', '2022-03-15'),
(02, '2022-03-15 14:32:00', '3456', '2022-03-18'),
(03, '2022-03-20 03:51:00', '2345', '2022-03-23');

-- Inserção de dados na tabela LIVRO
INSERT INTO LIVRO (Cod_Livro, Titulo, Autor, Cod_Sessao) VALUES
(01, 'Modelo Conceitual e Diagramas ER', 'Pressman, Roger S.', 03),
(02, 'Livro 2: Modelo Relacional e Álgebra Relacional', 'Heuser, Carlos Alberto', 01),
(03, 'Livro 3: Linguagem SQL', 'Beighley, Lynn', 02);

-- Inserção de dados na tabela SESSAO
INSERT INTO SESSAO (Codigo, Descricao, Localizacao) VALUES
(01, 'Sessao1', 'Partilheira1'),
(02, 'Sessao2', 'Partilheira2'),
(03, 'Sessao3', 'Partilheira3');

-- Inserção de dados na tabela LIVRO_EMPRÉSTIMO
INSERT INTO LIVRO_EMPRESTIMO (Cod_Livro, Cod_Emprestimo) VALUES
(03, 01),
(01, 03),
(02, 02);
