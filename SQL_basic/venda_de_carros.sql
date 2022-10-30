-- MySQL

-----------------------------------------------------------------------------------------------
------------------------------------- CRIAÇÃO DAS TABELAS -------------------------------------
-----------------------------------------------------------------------------------------------

CREATE TABLE modelos_de_carro (
    id INT NOT NULL,
    modelo VARCHAR(20),
    fabricante VARCHAR(20)
);

CREATE TABLE carros_disponiveis (
    id INT NOT NULL,
    id_modelo_carro INT NOT NULL,
    placa CHAR(8),
    cor VARCHAR(10),
    ano CHAR(4)
);

CREATE TABLE venda_de_carros (
    data_nota_fiscal VARCHAR(10),
    estado VARCHAR(20),
    valor_venda MEDIUMINT,
    valor_custo MEDIUMINT,
    total_desconto FLOAT,
    custo_entrega SMALLINT,
    custo_mao_de_obra SMALLINT,
    nome_cliente VARCHAR(30),
    id_carro_vendido INT NOT NULL
);

------------------------------------------------------------------------------------------------
--------------------------------------- INSERIR OS DADOS ---------------------------------------
------------------------------------------------------------------------------------------------

INSERT INTO modelos_de_carro (id, fabricante, modelo) VALUES
(1,'Rolls Royce','Camargue'),
(2,'Aston Martin','DBS'),
(3,'Jaguar','XJ6'),
(4,'Bentley','Continental'),
(5,'TVR','Tuscan'),
(6,'MGB','GT'),
(7,'Triumph','TR4');

INSERT INTO carros_disponiveis (id, id_modelo_carro, placa, cor, ano) VALUES
(25,1,'BIB-1458','Vermelho','2016'),
(3,2,'CRK-7443','Azul','2016'),
(97,3,'GFY-4752','Verde','2017'),
(32,4,'DYM-0815','Azul','2016'),
(108,5,'EQZ-3253','Azul','2017'),
(36,6,'GGL-3275','Verde','2017'),
(75,7,'BOZ-7841','Prata','2019');

INSERT INTO venda_de_carros (data_nota_fiscal,estado,valor_venda,valor_custo,total_desconto,custo_entrega,custo_mao_de_obra,nome_cliente, id_carro_vendido) VALUES 
('04-10-2022','São Paulo',95000,50000,500,750,750,'Carlos',25), 
('01-01-2022','São Paulo',120000,75000,0,1500,550,'Pamela',3), 
('02-12-2022','São Paulo',39500,37500,750,500,1250,'André',97), 
('01-01-2022','São Paulo',39500,25700,750,500,1250,'Samuel',32), 
('02-02-2022','São Paulo',41250,37500,150,50,325,'Claudia',108), 
('02-01-2022','São Paulo',39500,4500,150,50,325,'Marcela',36), 
('09-01-2022','São Paulo',28000,22000,550,875,450,'Felipe',75);

------------------------------------------------------------------------------------------------
------------------------------------ APRESENTAÇÃO DOS DADOS ------------------------------------
------------------------------------------------------------------------------------------------

-- Lista todos os modelos de carros
SELECT * FROM modelos_de_carro;

-- Lista todos os carros disponiveis para venda
SELECT
	modelo,
    fabricante,
    placa,
    cor,
    ano
FROM carros_disponiveis cd
INNER JOIN modelos_de_carro mc ON cd.id_modelo_carro = mc.id;

-- Lista todas informações das vendas
SELECT
	nome_cliente,
    modelo,
    fabricante,
    placa,
    ano,
    placa,
    estado,
    data_nota_fiscal
FROM venda_de_carros vc
INNER JOIN carros_disponiveis cd ON vc.id_carro_vendido = cd.id 
INNER JOIN modelos_de_carro mc ON cd.id_modelo_carro = mc.id;