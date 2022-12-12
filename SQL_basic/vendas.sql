CREATE DATABASE venda;

USE venda;

-----------------------------------------------------------------------------------------------
------------------------------------- CRIAÇÃO DAS TABELAS -------------------------------------
-----------------------------------------------------------------------------------------------

CREATE OR REPLACE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    email VARCHAR(70),

    fkEndereco INT,
    fkCliente_indicado INT,

    FOREIGN KEY (fkEndereco) REFERENCES endereco(id_endereco),
    FOREIGN KEY (fkCliente_indicado) REFERENCES cliente(id_cliente)
);

CREATE OR REPLACE endereco (
    id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(45),
    bairro VARCHAR(70),
    numero INT,
    cep CHAR(9)
);

CREATE OR REPLACE venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    total_venda decimal(10,2),
    data_venda date
);

CREATE OR REPLACE produto (
    id_produto INT AUTO_INCREMENT,
    nome VARCHAR(45),
    descricao VARCHAR(45),
    preco_produto decimal(10,2),

    fkCliente INT,

    FOREIGN KEY (fkCliente) REFERENCES cliente(id_cliente),
    PRIMARY KEY (id_produto, fkCliente)
);

CREATE OR REPLACE historico_vendas (
    quantidade INT,
    desconto INT,

    fkProduto INT,
    fkVenda INT,
    fkCliente INT,

    FOREIGN KEY (fkProduto) REFERENCES produto(id_produto),
    FOREIGN KEY (fkVenda) REFERENCES venda(id_venda),
    FOREIGN KEY (fkCliente) REFERENCES cliente(id_cliente),
    PRIMARY KEY (fkProduto, fkVenda, fkCliente)
);

------------------------------------------------------------------------------------------------
--------------------------------------- INSERIR OS DADOS ---------------------------------------
------------------------------------------------------------------------------------------------

INSERT INTO cliente(nome, email, fkEndereco, fkCliente_indicado) VALUES
('Marcos', 'contato@marcos.com', 1, null),
('Flavia', 'contato@flavia.com',2,  1),
('Roger', 'contato@roger.com', 3, null),
('Cezar', 'contato@cezar.com', 4, 3),
('Juan', 'contato@juan.com', 5, null),
('Samuel', 'contato@samuel.com', 6, 1);

INSERT INTO endereco(logradouro, bairro, numero, cep) VALUES
('Travessa cachoeira benfica', 'Jardim Rodolfo Pirane', '150', '08311-380'),
('Alameda cruz', 'Cunha souza', '301', '03447-001'),
('Rua do Afonso', 'Jururu', '1004', '0777-520'),
('Travessa do chico', 'Vila mariana', '500', '08400-100'),
('Rua chico chavier', 'Afonso lazaro', '2500', '01222-031'),
('Avenida dos bandeirantes', 'Morro das pedras', '501', '01222-762');

INSERT INTO venda(total_venda, data_venda) VALUES
(3000, '2022-09-10'),
(250.00, '2022-09-12'),
(300.00, '2022-10-23'),
(30.00, '2022-10-20'),
(200.00, '2022-11-03'),
(1000.00, '2022-12-10');

INSERT INTO produto(nome, descricao, preco_produto, fkCliente) VALUES
('Asus vivoBook', 'Notbook', '6000.00', 2),
('Logitech', 'Mouse', 500.00, 4),
('Lenovo', 'Mouse', 350.00, 1),
('Chamequinho', 'Folha de sulfite', 50.00, 6),
('abelha', 'mouse', 200.00, 3),
('HP', 'Impressora', '1000.00', 5);

INSERT INTO historico_vendas(quantidade, desconto, fkProduto, fkVenda, fkCliente) VALUES
(2, 1500, 1, 1, 2),
(2, 250, 2, 2, 4),
(1, 50, 3, 3, 1),
(1, 20, 4, 4, 6),
(1, 0, 5, 5, 3),
(1, 0, 6, 6, 5);

------------------------------------------------------------------------------------------------
------------------------------------ APRESENTAÇÃO DOS DADOS ------------------------------------
------------------------------------------------------------------------------------------------

-- Apresenta os dados dos clientes e os dados de suas respectivas vendas.
SELECT * FROM cliente 
JOIN historico_vendas 
ON id_cliente = fkCliente;

-- Apresenta os dados de um determinado cliente informando o nome do cliente na consulta e os dados de suas respectivas vendas.
SELECT * FROM cliente 
JOIN historico_vendas 
ON id_cliente = fKCliente 
WHERE id_cliente = 1;

-- Apresenta os dados dos clientes e de suas respectivas indicações de clientes.
SELECT * FROM cliente c 
LEFT JOIN cliente i 
ON c.id_cliente = i.fkCliente_indicado; 

-- Apresenta os dados dos clientes indicados e os dados dos respectivos clientes 
-- indicadores, porém somente de um determinado cliente indicador (informar o nome 
-- do cliente que indicou na consulta).
SELECT * FROM cliente c 
JOIN cliente i 
ON c.id_cliente = i.fkCliente_indicado 
WHERE c.nome = 'Pedro';

-- Apresenta os dados dos clientes, os dados dos respectivos clientes que indicaram, os 
-- dados das respectivas vendas e dos produtos.
SELECT * FROM cliente indicador 
JOIN cliente indicados 
ON indicador.id_cliente = indicados.fkCliente_indicado
JOIN historico_vendas h 
ON indicador.id_cliente = h.fkCliente
JOIN produto p 
ON indicador.id_cliente = p.id_produto;

-- Apresenta apenas a data da venda, o nome do produto e a quantidade do produto 
-- numa determinada venda.
SELECT 
    v.data_venda, 
    p.nome, 
    h.quantidade 
FROM historico_vendas as h 
JOIN venda v ON v.id_venda = h.fkVenda 
JOIN produto p ON p.id_produto = h.fkProduto WHERE id_venda = 6;

-- Apresenta apenas o nome do produto, o valor do produto e a soma da quantidade de produtos vendidos agrupados pelo nome do produto.
SELECT 
    p.nome, 
    p.preco_produto, 
    SUM(quantidade) AS quant_prod_vendidos
FROM historico_vendas as h 
JOIN produto p ON p.id_produto = h.fkProduto 
GROUP BY p.nome;

-- Apresenta o valor mínimo e o valor máximo dos preços dos produtos;
SELECT 
    MIN(preco_produto), 
    MAX(preco_produto) 
FROM produto;

-- Apresenta a soma e a média dos preços dos produtos;
SELECT 
    SUM(preco_produto) AS soma_produtos, 
    AVG(preco_produto) AS media_produtos 
FROM produto;  

-- Apresenta a quantidade de preços acima da média entre todos os produtos;   
SELECT COUNT(preco_produto) as acima_media FROM produto 
WHERE (SELECT AVG(preco_produto) FROM produto) < preco_produto;
