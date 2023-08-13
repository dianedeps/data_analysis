mysql -u root -p

CREATE DATABASE arq_dw;

USE arq_dw;
CREATE TABLE Categoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);
INSERT INTO Categoria (nome) VALUES
    ('Sofás'),
    ('Mesas'),
    ('Cadeiras'),
    ('Armários'),
    ('Luminárias'),
    ('Tapetes');


CREATE TABLE Fornecedor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);
INSERT INTO Fornecedor (nome, telefone, email) VALUES
    ('Fornecedor A', '(11) 1234-5678', 'fornecedor_a@email.com'),
    ('Fornecedor B', '(22) 9876-5432', 'fornecedor_b@email.com'),
    ('Fornecedor C', '(33) 4567-8901', 'fornecedor_c@email.com'),
    ('Fornecedor D', '(44) 7777-7777', 'fornecedor_d@email.com'),
    ('Fornecedor E', '(55) 8888-8888', 'fornecedor_e@email.com'),
    ('Fornecedor F', '(66) 9999-9999', 'fornecedor_f@email.com'),
    ('Fornecedor G', '(77) 0000-0000', 'fornecedor_g@email.com');


CREATE TABLE Produto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    categoria_id INT,
    fornecedor_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id),
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(id)
);
INSERT INTO Produto (nome, descricao, preco, categoria_id, fornecedor_id) VALUES
    ('Sofá Retrô', 'Sofá de três lugares com estilo retrô.', 1200.50, 1, 1),
    ('Mesa de Jantar', 'Mesa de jantar com tampo de vidro temperado.', 800.00, 2, 2),
    ('Cadeira Elegance', 'Cadeira estofada com design elegante.', 150.00, 3, 3),
    ('Armário Compacto', 'Armário compacto com gavetas e prateleiras.', 500.00, 4, 1),
    ('Luminária Moderna', 'Luminária de pé com iluminação LED.', 180.75, 5, 2),
    ('Tapete Geométrico', 'Tapete com estampa geométrica.', 70.25, 6, 3),
    ('Estante Moderna', 'Estante com design moderno e várias prateleiras.', 350.00, 4, 2),
    ('Poltrona Conforto', 'Poltrona estofada super confortável.', 250.50, 1, 3),
    ('Mesa de Centro', 'Mesa de centro com acabamento em madeira.', 180.00, 2, 4),
    ('Luminária de Teto', 'Luminária pendente para iluminação de teto.', 120.75, 5, 1),
    ('Cadeira de Escritório', 'Cadeira ergonômica para escritório.', 180.25, 3, 5),
    ('Tapete Felpudo', 'Tapete macio e confortável para sala.', 90.00, 6, 2),
    ('Cama Queen', 'Cama de casal tamanho Queen com estrutura resistente.', 800.00, 1, 4),
    ('Criado-Mudo Vintage', 'Criado-mudo com estilo vintage e gaveta.', 120.00, 4, 3);


CREATE TABLE Cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(200)
);
INSERT INTO Cliente (nome, telefone, email, endereco) VALUES
    ('Cliente A', '(44) 1357-2468', 'cliente_a@email.com', 'Rua dos Clientes, 123'),
    ('Cliente B', '(55) 9876-5432', 'cliente_b@email.com', 'Avenida das Ruas, 456'),
    ('Cliente C', '(66) 2468-1357', 'cliente_c@email.com', 'Praça das Avenidas, 789'),
    ('Cliente D', '(44) 2222-3333', 'cliente_d@email.com', 'Rua dos Clientes, 456'),
    ('Cliente E', '(55) 4444-5555', 'cliente_e@email.com', 'Avenida das Ruas, 789'),
    ('Cliente F', '(66) 6666-7777', 'cliente_f@email.com', 'Praça das Avenidas, 1011'),
    ('Cliente G', '(77) 8888-9999', 'cliente_g@email.com', 'Rua Principal, 1234');


CREATE TABLE Loja (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(20)
);
INSERT INTO Loja (nome, endereco, telefone) VALUES
    ('Loja Centro', 'Rua do Centro, 987', '(11) 5555-1234'),
    ('Loja Norte', 'Avenida do Norte, 654', '(22) 2222-9876'),
    ('Loja Sul', 'Avenida do Sul, 321', '(33) 3333-4567'),
    ('Loja Oeste', 'Rua do Oeste, 987', '(11) 7777-8888'),
    ('Loja Leste', 'Avenida do Leste, 654', '(22) 8888-9999'),
    ('Loja Central', 'Avenida Central, 321', '(33) 9999-0000');

CREATE TABLE Vendedor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    loja_id INT,
    FOREIGN KEY (loja_id) REFERENCES Loja(id)
);
INSERT INTO Vendedor (nome, telefone, email, loja_id) VALUES
    ('Vendedor 1', '(11) 1111-1111', 'vendedor1@email.com', 1),
    ('Vendedor 2', '(22) 2222-2222', 'vendedor2@email.com', 2),
    ('Vendedor 3', '(33) 3333-3333', 'vendedor3@email.com', 3),
    ('Vendedor 4', '(11) 7777-1111', 'vendedor4@email.com', 1),
    ('Vendedor 5', '(22) 8888-2222', 'vendedor5@email.com', 2),
    ('Vendedor 6', '(33) 9999-3333', 'vendedor6@email.com', 3),
    ('Vendedor 7', '(44) 0000-4444', 'vendedor7@email.com', 4);


CREATE TABLE Pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE,
    cliente_id INT,
    vendedor_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
    FOREIGN KEY (vendedor_id) REFERENCES Vendedor(id)
);
INSERT INTO Pedido (data_pedido, cliente_id, vendedor_id) VALUES
    ('2023-07-10', 1, 1),
    ('2023-07-15', 2, 2),
    ('2023-07-20', 3, 3),
    ('2023-07-22', 3, 2),
    ('2023-07-25', 2, 1),
    ('2023-07-28', 1, 4),
    ('2023-06-01', 7, 4),
    ('2023-06-02', 7, 4),
    ('2023-06-03', 4, 5),
    ('2023-06-04', 1, 5),
    ('2023-06-04', 2, 5),
    ('2023-06-04', 3, 6),
    ('2023-06-04', 3, 6),
    ('2023-06-05', 4, 6),
    ('2023-06-05', 5, 7),
    ('2023-06-05', 6, 7),
    ('2023-06-06', 7, 7),
    ('2023-06-06', 1, 7),
    ('2023-06-06', 1, 7),
    ('2023-06-06', 2, 7),
    ('2023-06-06', 2, 7),
    ('2023-06-06', 3, 7),
    ('2023-06-07', 3, 1),
    ('2023-06-07', 4, 1),
    ('2023-06-07', 4, 1),
    ('2023-06-07', 5, 2),
    ('2023-06-08', 5, 2),
    ('2023-06-08', 7, 2);


CREATE TABLE ItemPedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id),
    FOREIGN KEY (produto_id) REFERENCES Produto(id)
);
INSERT INTO ItemPedido (pedido_id, produto_id, quantidade) VALUES
    (1, 1, 2),
    (1, 3, 4),
    (2, 2, 1),
    (2, 5, 3),
    (3, 4, 1),
    (3, 6, 2),
    (4, 3, 2),
    (4, 5, 1),
    (5, 1, 3),
    (5, 2, 2),
    (6, 6, 1),
    (6, 4, 4),
    (7, 7, 2),
    (7, 8, 3),
    (8, 3, 2),
    (8, 5, 1),
    (8, 1, 3),
    (8, 2, 2),
    (8, 6, 1),
    (9, 4, 4),
    (9, 7, 2),
    (9, 8, 3),
    (10, 9, 1),
    (10, 10, 10),
    (10, 1, 1),
    (10, 14, 3),
    (11, 2, 2),
    (11, 8, 5),
    (11, 7, 2),
    (12, 1, 1),
    (12, 11, 3),
    (13, 14, 1),
    (13, 13, 1),
    (13, 1, 1),
    (14, 8, 4),
    (15, 13, 3),
    (15, 11, 2),
    (16, 8, 1),
    (16, 4, 1),
    (16, 6, 1),
    (16, 7, 1),
    (17, 8, 2),
    (17, 1, 2),
    (17, 2, 2),
    (18, 8, 2),
    (19, 13, 1),
    (19, 12, 1),
    (19, 8, 1),
    (20, 6, 4),
    (21, 7, 2),
    (22, 2, 2),
    (22, 3, 2),
    (22, 5, 2),
    (22, 8, 1),
    (22, 9, 1),
    (22, 13, 1),
    (22, 12, 3),
    (23, 8, 2),
    (23, 4, 2),
    (23, 2, 2),
    (23, 7, 1),
    (23, 1, 1),
    (23, 6, 1),
    (24, 1, 1),
    (24, 2, 1),
    (25, 4, 3),
    (25, 5, 3),
    (26, 6, 2),
    (26, 7, 2),
    (26, 8, 2),
    (27, 9, 2),
    (28, 10, 1),
    (28, 11, 1);


CREATE TABLE EmpresaEntregadora (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);
INSERT INTO EmpresaEntregadora (nome, telefone, email) VALUES
    ('Transportadora A', '(11) 4444-4444', 'transportadora_a@email.com'),
    ('Transportadora B', '(22) 5555-5555', 'transportadora_b@email.com'),
    ('Transportadora C', '(33) 6666-6666', 'transportadora_c@email.com'),
    ('Transportadora D', '(11) 7777-4444', 'transportadora_d@email.com'),
    ('Transportadora E', '(22) 8888-5555', 'transportadora_e@email.com'),
    ('Transportadora F', '(33) 9999-6666', 'transportadora_f@email.com'),
    ('Transportadora G', '(44) 0000-1111', 'transportadora_g@email.com');

CREATE TABLE Entrega (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_entrega DATE,
    pedido_id INT,
    empresa_entregadora_id INT,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id),
    FOREIGN KEY (empresa_entregadora_id) REFERENCES EmpresaEntregadora(id)
);
INSERT INTO Entrega (data_entrega, pedido_id, empresa_entregadora_id) VALUES
    ('2023-07-12', 1, 1),
    ('2023-07-18', 2, 2),
    ('2023-07-25', 3, 3),
    ('2023-07-25', 4, 2),
    ('2023-07-28', 5, 1),
    ('2023-06-03', 6, 4),
    ('2023-06-04', 7, 4),
    ('2023-06-04', 8, 4),
    ('2023-06-04', 9, 5),
    ('2023-06-04', 10, 5),
    ('2023-06-05', 11, 5),
    ('2023-06-05', 12, 6),
    ('2023-06-05', 13, 6),
    ('2023-06-06', 14, 6),
    ('2023-06-06', 15, 7),
    ('2023-06-06', 16, 7),
    ('2023-06-06', 17, 7),
    ('2023-06-06', 18, 7),
    ('2023-06-06', 19, 7),
    ('2023-06-07', 20, 7),
    ('2023-06-07', 21, 7),
    ('2023-06-07', 22, 7),
    ('2023-06-07', 23, 1),
    ('2023-06-08', 24, 1),
    ('2023-06-08', 25, 1),
    ('2023-06-08', 26, 2),
    ('2023-06-10', 27, 2),
    ('2023-06-10', 28, 2);

