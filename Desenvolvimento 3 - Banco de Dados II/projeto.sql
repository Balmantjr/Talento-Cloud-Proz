-- Passo 1: Criar o banco de dados
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'EmpresaVendas')
BEGIN
    CREATE DATABASE EmpresaVendas;
END;
GO

USE EmpresaVendas;
GO

-- Passo 2: Criar a tabela Vendas
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Vendas' AND type = 'U')
BEGIN
    CREATE TABLE Vendas (
        VendaID INT PRIMARY KEY IDENTITY(1,1),
        ProdutoID INT NOT NULL,
        Quantidade INT NOT NULL,
        DataVenda DATE NOT NULL
    );
END;
GO

-- Passo 3: Inserir dados de exemplo na tabela Vendas
INSERT INTO Vendas (ProdutoID, Quantidade, DataVenda) VALUES
(1, 5, '2023-10-01'),
(2, 3, '2023-10-01'),
(1, 2, '2023-10-02'),
(3, 7, '2023-10-02'),
(2, 4, '2023-10-03'),
(3, 1, '2023-10-03'),
(1, 6, '2023-10-03');
GO

-- Passo 4: Criar o stored procedure para o relatório diário
CREATE OR ALTER PROCEDURE RelatorioDiarioProdutosVendidos
AS
BEGIN
    -- Seleciona a quantidade total de produtos vendidos por dia
    SELECT 
        DataVenda,
        SUM(Quantidade) AS TotalProdutosVendidos
    FROM 
        Vendas
    GROUP BY 
        DataVenda
    ORDER BY 
        DataVenda;
END;
GO

-- Passo 5: Executar o stored procedure para testar
EXEC RelatorioDiarioProdutosVendidos;
GO