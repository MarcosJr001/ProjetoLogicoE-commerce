-- Criar o banco de dados
CREATE DATABASE ecommerce;
USE ecommerce;

-- Tabela de Clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    tipo ENUM('PF', 'PJ') NOT NULL,
    cpf_cnpj VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(20)
);

-- Tabela de Vendedores
CREATE TABLE vendedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(20)
);

-- Tabela de Fornecedores
CREATE TABLE fornecedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    contato VARCHAR(255)
);

-- Tabela de Produtos
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    fornecedor_id INT,
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(id)
);

-- Tabela de Pedidos
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pendente', 'enviado', 'entregue') DEFAULT 'pendente',
    codigo_rastreamento VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Tabela de Itens do Pedido
CREATE TABLE itens_pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Tabela de Formas de Pagamento
CREATE TABLE pagamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    tipo ENUM('cartao', 'boleto', 'pix') NOT NULL,
    detalhes VARCHAR(255),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Inserindo alguns dados
INSERT INTO clientes (nome, tipo, cpf_cnpj, email, telefone) VALUES
('João Silva', 'PF', '12345678901', 'joao@email.com', '11999999999'),
('Empresa XYZ', 'PJ', '12345678000199', 'contato@xyz.com', '1133334444');

INSERT INTO fornecedores (nome, contato) VALUES
('Fornecedor A', 'fornecedorA@email.com'),
('Fornecedor B', 'fornecedorB@email.com');

INSERT INTO produtos (nome, preco, estoque, fornecedor_id) VALUES
('Produto 1', 100.00, 50, 1),
('Produto 2', 200.00, 30, 2);

INSERT INTO pedidos (cliente_id, status, codigo_rastreamento) VALUES
(1, 'pendente', 'RAST12345');

INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco) VALUES
(1, 1, 2, 100.00);

INSERT INTO pagamentos (cliente_id, tipo, detalhes) VALUES
(1, 'cartao', 'Visa - final 1234');

-- Queries solicitadas
-- 1. Quantos pedidos foram feitos por cada cliente?
SELECT c.nome, COUNT(p.id) AS total_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.nome;

-- 2. Algum vendedor também é fornecedor?
SELECT v.nome AS vendedor, f.nome AS fornecedor
FROM vendedores v
INNER JOIN fornecedores f ON v.nome = f.nome;

-- 3. Relação de produtos, fornecedores e estoques
SELECT p.nome AS produto, f.nome AS fornecedor, p.estoque
FROM produtos p
LEFT JOIN fornecedores f ON p.fornecedor_id = f.id;

-- 4. Relação de nomes dos fornecedores e nomes dos produtos
SELECT f.nome AS fornecedor, p.nome AS produto
FROM fornecedores f
LEFT JOIN produtos p ON f.id = p.fornecedor_id;