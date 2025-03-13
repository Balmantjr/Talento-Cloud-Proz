-- Criação da tabela CLIENTES
CREATE TABLE CLIENTES (
    ID INT PRIMARY KEY AUTO_INCREMENT,  -- Chave primária
    Nome VARCHAR(100) NOT NULL,         -- Nome do cliente
    Email VARCHAR(100),                 -- Email do cliente
    DataCadastro DATE                   -- Data de cadastro do cliente
);

-- Inserção de dados de exemplo na tabela CLIENTES
INSERT INTO CLIENTES (Nome, Email, DataCadastro) VALUES
('João Silva', 'joao.silva@example.com', '2023-10-01'),
('Maria Oliveira', 'maria.oliveira@example.com', '2023-10-01'),
('Carlos Souza', 'carlos.souza@example.com', '2023-10-02'),
('Ana Costa', 'ana.costa@example.com', '2023-10-01');

-- Criação da função para contar clientes cadastrados em um dia específico
DELIMITER $$

CREATE FUNCTION ContarClientesPorDia(data_consulta DATE) 
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total_clientes INT;

    -- Conta o número de clientes cadastrados na data especificada
    SELECT COUNT(*) INTO total_clientes
    FROM CLIENTES
    WHERE DataCadastro = data_consulta;

    RETURN total_clientes;
END$$

DELIMITER ;

-- Uso da função para contar clientes cadastrados em um dia específico
SELECT ContarClientesPorDia('2023-10-01') AS Total_Clientes;