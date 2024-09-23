USE Supermarket_DB

-- Inserção de clientes
INSERT INTO Cliente (nome, endereco, telefone) 
VALUES ('João Silva', 'Rua A, 123', '(11) 1234-5678'),
       ('Maria Santos', 'Av. B, 456', '(11) 2345-6789'),
       ('Pedro Oliveira', 'Rua C, 789', '(11) 3456-7890')

SELECT * FROM Cliente

-- Inserção de funcionários
INSERT INTO Funcionario (nome, cargo, data_contratacao) 
VALUES ('Ana Pereira', 'Caixa', '2023-01-15'),
       ('Carlos Souza', 'Atendente', '2023-02-20'),
       ('Fernanda Lima', 'Gerente', '2022-11-10')

SELECT * FROM Funcionario

-- Inserção de fornecedores
INSERT INTO Fornecedor (nome_empresa, endereco, contato) 
VALUES ('Distribuidora ABC', 'Rua X, 100', 'contato@abc.com'),
       ('Alimentos XYZ', 'Av. Y, 200', 'vendas@xyz.com')

SELECT * FROM Fornecedor

-- Inserção de produtos
INSERT INTO Produto (nome, descricao, preco_unitario, quantidade_estoque, fornecedor)
VALUES ('Arroz', 'Pacote 5kg', 20.50, 100, 1),
       ('Feijão', 'Pacote 1kg', 8.75, 150, 1),
       ('Leite', 'Caixa 1L', 4.50, 200, 2)
       
SELECT * FROM Produto

-- Inserção de pedidos
INSERT INTO Pedido (cliente, funcionario, data_pedido, tipo_pedido) 
VALUES (1, 1, '2024-01-10', 'delivery'),
       (2, 2, '2024-02-15', 'presencial'),
       (3, 3, '2024-03-20', 'retirada')

SELECT * FROM Pedido

-- Inserção de itens de pedido
INSERT INTO Item_Pedido (pedido, produto, preco, quantidade, porcentagem_desconto) 
VALUES (1, 1, 20.50, 2, NULL),
       (1, 2, 8.75, 3, 5.00),
       (2, 3, 4.50, 5, NULL),
       (3, 1, 20.50, 1, NULL),
       (3, 2, 8.75, 2, NULL)

SELECT * FROM Item_Pedido