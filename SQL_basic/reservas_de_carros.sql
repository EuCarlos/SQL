-- SQLite
DROP TABLE reserva;
DROP TABLE carro;
DROP TABLE cliente;
DROP TABLE profissao;
DROP TABLE agencia;
DROP TABLE garagem;

-----------------------------------------------------------------------------------------------
------------------------------------- CRIAÇÃO DAS TABELAS -------------------------------------
-----------------------------------------------------------------------------------------------

CREATE TABLE profissao (
    id_profissao INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(15)
);

CREATE TABLE cliente (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(10),
    endereco VARCHAR(15),
    bairro VARCHAR(15),
    idade INT(2),
    id_profissao INT,

    FOREIGN KEY (id_profissao) REFERENCES profissao(id_profissao) 
);

CREATE TABLE agencia (
    id_agencia INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(15),
    endereco VARCHAR(15)
);

CREATE TABLE garagem (
    id_garagem INTEGER PRIMARY KEY AUTOINCREMENT,
    endereco VARCHAR(15)
);

CREATE TABLE carro (
    id_carro INTEGER PRIMARY KEY AUTOINCREMENT,
    marca VARCHAR(10),
    placa CHAR(7),
    id_garagem INT,

    FOREIGN KEY (id_garagem) REFERENCES garagem(id_garagem)
);

CREATE TABLE reserva (
    id_reserva INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INT,
    id_carro INT,
    fr DATE,
    id_agencia INT,

    FOREIGN KEY (id_agencia) REFERENCES agencia(id_agencia),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_carro) REFERENCES carro(id_carro)
);

------------------------------------------------------------------------------------------------
--------------------------------------- INSERIR OS DADOS ---------------------------------------
------------------------------------------------------------------------------------------------

INSERT INTO profissao (nome)VALUES
('Gestor'),
('Analista'),
('Professor'),
('Admisnistrador'),
('RH'),
('Diretor');

INSERT INTO cliente (nome,endereco,bairro,idade,id_profissao) VALUES
('Carlos','R. do peixe','pontevedra',24,1),
('Pamela','R. lua','lugo',24,2),
('Mario','R. sol','pontevedra',19,3),
('Daniel','R. da pedra','corunha',20,4),
('Marcelo','R. da arvoré','ourense',40,5),
('Claudia','R. do dente','ourense',50,6),
('Flavia','R. do roxa','pontevedra',32,5);

INSERT INTO agencia (nome,endereco) VALUES
('Agencia - 2 Irmãos','R. do ave'),
('Agencia do Seu Zé','R. do pez'),
('Agencia do Arábe','R. do luna'),
('Agencia El shaday','R. do sol');

INSERT INTO garagem (endereco) VALUES
('R. do klimt'),
('R. do velazquez'),
('R. do murillo'),
('R. do virxilio');

INSERT INTO carro (marca,placa,id_garagem) VALUES
('opel','NAF7250',1),
('opel','GSS8893',2),
('citroen','NAQ6649',1),
('renault','LTU5328',3),
('mercedes','HOC7194',2),
('seat','MZR9001',3),
('opel','MQB5971',1),
('opel','KFK8448',1),
('citroen','NDJ0669',2);

INSERT INTO reserva (id_cliente,id_carro,fr,id_agencia) VALUES
(1,3,'3/10/2022',1),
(1,4,'1/10/2022',2),
(6,2,'2/11/2022',1),
(2,1,'1/10/2022',3),
(5,6,'2/12/2022',1),
(3,7,'1/10/2022',2),
(2,5,'3/10/2022',1);

------------------------------------------------------------------------------------------------
------------------------------------ APRESENTAÇÃO DOS DADOS ------------------------------------
------------------------------------------------------------------------------------------------

-- Apresenta todas as profissões registradas
SELECT * FROM profissao;

-- Apresenta nome, endereçom bairro, idade e profissão do cliente com id igual a 1
SELECT 
	c.nome,
    endereco,
    bairro,
    idade,
    p.nome AS profissao
FROM cliente c
JOIN profissao p ON c.id_profissao = p.id_profissao
WHERE id_cliente = 1;

-- Apresenta todas as agencias registradas
SELECT * FROM agencia;

-- Apresenta todas as garagens registradas
SELECT * FROM garagem;

-- Apresenta marca, placa e endereço da garagem onde se encontra o carro
SELECT
	marca,
    placa,
    endereco AS endereco_garagem
FROM carro ca
JOIN garagem ga ON ca.id_garagem = ga.id_garagem;

-- Apresenta todas as reserva do cliente com id = 1
SELECT 
	cl.nome AS cliente,
    cl.idade || ' anos' AS idade,
    cl.endereco,
    cl.bairro,
    ca.marca,
    ca.placa,
    re.fr AS data_reserva,
    ga.endereco AS garagem
FROM reserva re
JOIN cliente cl ON re.id_cliente = cl.id_cliente
JOIN carro ca ON re.id_carro = ca.id_carro
JOIN garagem ga ON ca.id_garagem = ga.id_garagem
WHERE cl.id_cliente = 1;
