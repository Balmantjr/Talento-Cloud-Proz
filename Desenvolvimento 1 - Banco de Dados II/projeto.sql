-- Passo 1: Criar a base de dados
CREATE DATABASE IF NOT EXISTS Loja;
USE Loja;

-- Passo 2: Criar as tabelas
CREATE TABLE IF NOT EXISTS Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Pedidos (
    PedidoID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    DataPedido DATE NOT NULL,
    ValorTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Passo 3: Inserir dados nas tabelas
-- Inserindo dados na tabela Clientes
INSERT INTO Clientes (Nome, Email) VALUES
('João Silva', 'joao.silva@example.com'),
('Maria Oliveira', 'maria.oliveira@example.com');

-- Inserindo dados na tabela Pedidos
INSERT INTO Pedidos (ClienteID, DataPedido, ValorTotal) VALUES
(1, '2023-10-01', 150.00),
(2, '2023-10-02', 200.00),
(1, '2023-10-03', 99.99);

-- Passo 4: Realizar consultas com JOIN
-- Consulta 1: Listar todos os pedidos com os nomes dos clientes
SELECT Pedidos.PedidoID, Clientes.Nome, Pedidos.DataPedido, Pedidos.ValorTotal
FROM Pedidos
INNER JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID;

-- Consulta 2: Listar todos os clientes e seus pedidos (mesmo os que não fizeram pedidos)
SELECT Clientes.Nome, Pedidos.PedidoID, Pedidos.DataPedido, Pedidos.ValorTotal
FROM Clientes
LEFT JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID;

-- Consulta 3: Listar apenas os clientes que fizeram pedidos
SELECT DISTINCT Clientes.Nome
FROM Clientes
INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID;