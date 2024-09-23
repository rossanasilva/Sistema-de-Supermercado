CREATE DATABASE Supermarket_DB
USE Supermarket_DB

CREATE TABLE Cliente (
  cliente_id INT IDENTITY(1,1) NOT NULL,
  nome VARCHAR(80) NOT NULL,
  endereco VARCHAR(80) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  PRIMARY KEY (cliente_id)
)

CREATE TABLE Funcionario (
  funcionario_id INT IDENTITY(1,1) NOT NULL,
  nome VARCHAR(80) NOT NULL,
  cargo VARCHAR(50) NOT NULL,
  data_contratacao DATE NOT NULL,
  PRIMARY KEY (funcionario_id)
)

CREATE TABLE Fornecedor (
    fornecedor_id INT IDENTITY(1,1) NOT NULL,
    nome_empresa VARCHAR(100) NOT NULL,
    endereco VARCHAR(80) NOT NULL,
    contato VARCHAR(20) NOT NULL,
    PRIMARY KEY (fornecedor_id)
)

CREATE TABLE Produto (
    produto_id INT IDENTITY(1,1) NOT NULL,
    nome VARCHAR(80) NOT NULL,
    descricao VARCHAR(200) NOT NULL,
    preco_unitario NUMERIC(6, 2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    fornecedor INT NOT NULL,
    PRIMARY KEY (produto_id),
    FOREIGN KEY (fornecedor) REFERENCES Fornecedor(fornecedor_id)
)

CREATE TABLE Pedido (
    pedido_id INT IDENTITY(1,1) NOT NULL,
    cliente INT NOT NULL,
    funcionario INT NOT NULL,
    data_pedido DATE NOT NULL,
    tipo_pedido VARCHAR(30) DEFAULT 'presencial' CHECK(tipo_pedido IN ('presencial', 'retirada', 'delivery')),
    PRIMARY KEY (pedido_id),
    FOREIGN KEY (cliente) REFERENCES Cliente(cliente_id),
    FOREIGN KEY (funcionario) REFERENCES Funcionario(funcionario_id)
)

CREATE TABLE Item_Pedido (
    item_pedido_id INT IDENTITY(1,1) NOT NULL,
    pedido INT NOT NULL, 
    produto INT NOT NULL, 
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL,
    porcentagem_desconto DECIMAL(5, 2),
    PRIMARY KEY (item_pedido_id),
    FOREIGN KEY (pedido) REFERENCES Pedido(pedido_id),
    FOREIGN KEY (produto) REFERENCES Produto(produto_id)
)