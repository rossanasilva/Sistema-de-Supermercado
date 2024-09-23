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

-- Consultas Obrigatórias:

-- a) Exibir o nome dos clientes que realizaram compras via delivery no mês de janeiro de 2024
SELECT DISTINCT c.nome
FROM CLIENTE c
JOIN PEDIDO p ON c.cliente_id = p.cliente
WHERE p.tipo_pedido = 'delivery' AND p.data_pedido BETWEEN '2024-01-01' AND '2024-01-31'

-- b) Exibir o nome do funcionário e a quantidade de pedidos que cada funcionário já atendeu no primeiro semestre de 2024
SELECT f.nome, COUNT(p.pedido_id) AS total_pedidos
FROM Funcionario f
JOIN Pedido p ON f.funcionario_id = p.funcionario
WHERE p.data_pedido BETWEEN '2024-01-01' AND '2024-06-30'
GROUP BY f.nome

-- c) Exibir o total do valor dos pedidos que já foram feitos, agrupando por presencial, retirada em loja e delivery
SELECT p.tipo_pedido, SUM(ip.preco * ip.quantidade * (1 - COALESCE(ip.porcentagem_desconto, 0) / 100)) as valor_total
FROM PEDIDO p
JOIN ITEM_PEDIDO ip ON p.pedido_id = ip.pedido
GROUP BY p.tipo_pedido

-- d) Exibir o nome de todos os fornecedores e os produtos que ele fornece. Exibir em ordem alfabética
SELECT f.nome_empresa, pr.nome
FROM Fornecedor f
JOIN Produto pr ON f.fornecedor_id = pr.fornecedor
ORDER BY f.nome_empresa, pr.nome;

-- e) Exibir o valor total do pedido de um cliente específico (neste caso, cliente_id = 1)
SELECT SUM(ip.preco * ip.quantidade * (1 - ISNULL(ip.porcentagem_desconto, 0)/100)) AS valor_total_pedido
FROM Pedido p
JOIN Item_Pedido ip ON p.pedido_id = ip.pedido
WHERE p.cliente = 1;


-- Consultas adicionais:

-- 1. Listar os produtos com estoque abaixo de 50 unidades e seus respectivos fornecedores
SELECT p.nome AS nome_produto, p.quantidade_estoque, f.nome_empresa
FROM Produto p
JOIN Fornecedor f ON p.fornecedor = f.fornecedor_id
WHERE p.quantidade_estoque < 50

-- 2. Calcular o valor médio dos pedidos por tipo de pedido
SELECT p.tipo_pedido, AVG(ip.preco * ip.quantidade * (1 - ISNULL(ip.porcentagem_desconto, 0)/100)) AS valor_medio
FROM Pedido p
JOIN Item_Pedido ip ON p.pedido_id = ip.pedido
GROUP BY p.tipo_pedido

-- 3. Encontrar o cliente que fez o pedido de maior valor
SELECT c.nome, p.pedido_id, SUM(ip.preco * ip.quantidade * (1 - ISNULL(ip.porcentagem_desconto, 0)/100)) AS total_valor
FROM Pedido p
JOIN Cliente c ON p.cliente = c.cliente_id
JOIN Item_Pedido ip ON p.pedido_id = ip.pedido
GROUP BY c.nome, p.pedido_id
ORDER BY total_valor DESC

-- 4. Listar os funcionários que atenderam pedidos no último mês
SELECT f.nome, COUNT(p.pedido_id) AS total_pedidos
FROM Funcionario f
JOIN Pedido p ON f.funcionario_id = p.funcionario
GROUP BY f.nome;

SELECT f.nome, COUNT(p.pedido_id) AS total_pedidos
FROM Funcionario f
JOIN Pedido p ON f.funcionario_id = p.funcionario
WHERE p.data_pedido BETWEEN '2024-03-01' AND '2024-03-31'
GROUP BY f.nome;