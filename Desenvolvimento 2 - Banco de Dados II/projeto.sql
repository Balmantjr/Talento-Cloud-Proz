-- Passo 1: Criar o banco de dados
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Escola')
BEGIN
    CREATE DATABASE Escola;
END;
GO

USE Escola;
GO

-- Passo 2: Criar as tabelas
-- Tabela Alunos
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Alunos' AND type = 'U')
BEGIN
    CREATE TABLE Alunos (
        AlunoID INT PRIMARY KEY IDENTITY(1,1),
        Nome VARCHAR(100) NOT NULL,
        Email VARCHAR(100) UNIQUE NOT NULL,
        DataMatricula DATE
    );
END;
GO

-- Tabela Historico
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Historico' AND type = 'U')
BEGIN
    CREATE TABLE Historico (
        HistoricoID INT PRIMARY KEY IDENTITY(1,1),
        AlunoID INT,
        DataRegistro DATE,
        Acao VARCHAR(50),
        FOREIGN KEY (AlunoID) REFERENCES Alunos(AlunoID)
    );
END;
GO

-- Passo 3: Criar o Trigger
-- O trigger será acionado após um INSERT na tabela Alunos
CREATE OR ALTER TRIGGER trg_AfterInsertAluno
ON Alunos
AFTER INSERT
AS
BEGIN
    -- Insere um registro no histórico com a data de matrícula
    INSERT INTO Historico (AlunoID, DataRegistro, Acao)
    SELECT i.AlunoID, GETDATE(), 'Matrícula realizada'
    FROM inserted i;
END;
GO

-- Passo 4: Inserir dados na tabela Alunos (para testar o trigger)
INSERT INTO Alunos (Nome, Email) VALUES
('João Silva', 'joao.silva@example.com'),
('Maria Oliveira', 'maria.oliveira@example.com');
GO

-- Passo 5: Consultar os dados para verificar o funcionamento do trigger
-- Consulta 1: Listar todos os alunos
SELECT * FROM Alunos;
GO

-- Consulta 2: Listar o histórico de ações
SELECT * FROM Historico;
GO