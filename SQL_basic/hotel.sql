-- MySQL

-----------------------------------------------------------------------------------------------
-------------------------------------- CRIAÇÃO DO BANCO ---------------------------------------
-----------------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS hotel;
CREATE DATABASE IF NOT EXISTS hotel;
SHOW DATABASES;

-----------------------------------------------------------------------------------------------
------------------------------------- CRIAÇÃO DAS TABELAS -------------------------------------
-----------------------------------------------------------------------------------------------
CREATE OR REPLACE TABLE usuarios (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_de_usuario VARCHAR(45) NOT NULL,
    senha VARCHAR(45) NOT NULL,
    tipo_de_usuario ENUM('administrador','funcionario')
);

CREATE OR REPLACE TABLE funcionarios (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    codigo_cracha VARCHAR(15) NOT NULL,
    nome VARCHAR(45) NOT NULL DEFAULT 'Unknown',
    cep  CHAR(8),
    funcao ENUM('CEO','Segurança','Serviços Gerais','Recepcionista','Chefe','Gerente','Limpador'),
    telefone VARCHAR(15),
    email TEXT,
    salario DOUBLE
);

CREATE OR REPLACE TABLE clientes (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  	codigo_cliente VARCHAR(15) NOT NULL,
    nome VARCHAR(45) NOT NULL,
    cep  CHAR(8),
    cidade TEXT,
    nacionalidade TEXT,
    email TEXT,
    telefone VARCHAR(15)
);

CREATE OR REPLACE TABLE quartos (
    id VARCHAR(15),
    tipo_de_quarto VARCHAR(15),
    capacidade ENUM('Solteiro','Duplo','Triplo','Quádruplo'),
    preco_do_quarto DOUBLE DEFAULT 0.00,
    esta_disponivel TINYINT(1),
    
    CONSTRAINT PRIMARY KEY (id)
);

CREATE OR REPLACE TABLE refeicoes (
    id VARCHAR(15),
    nome VARCHAR(30),
    preco_da_refeicao DOUBLE DEFAULT 0.00,
    quantidade INT,
    
    CONSTRAINT PRIMARY KEY (id)
);

CREATE OR REPLACE TABLE veiculos (
    id VARCHAR(15),
    tipo ENUM('Bicicleta','Moto','Carro','Táxi','Jeep'),
    custo_do_aluguel DOUBLE DEFAULT 0.00,
    esta_disponivel TINYINT(1),
    
    CONSTRAINT PRIMARY KEY (id)
);

CREATE OR REPLACE TABLE detalhes_da_reserva (
  	id INT NOT NULL AUTO_INCREMENT,
    id_cliente INT,
    id_quarto VARCHAR(15),
    data_check_in Date,
    data_check_out Date,
    custo_do_quarto DOUBLE,
    custo_de_alimentacao DOUBLE,
    custo_do_veiculo DOUBLE,
    custo_total DOUBLE,
    
    CONSTRAINT PRIMARY KEY (id),
    CONSTRAINT FOREIGN KEY (id_cliente) REFERENCES clientes(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (id_quarto) REFERENCES quartos(id) ON DELETE CASCADE ON UPDATE CASCADE
);

------------------------------------------------------------------------------------------------
--------------------------------------- INSERIR OS DADOS ---------------------------------------
------------------------------------------------------------------------------------------------

INSERT INTO usuarios (nome_de_usuario,senha, tipo_de_usuario) VALUES
('@Carlos',MD5('admin123'),'administrador'),
('@marcelo',MD5('admin123'),'funcionario'),
('@henrique',MD5('admin123'),'funcionario'),
('@fernando',MD5('admin123'),'funcionario');

INSERT INTO clientes (codigo_cliente, nome, cep, cidade, nacionalidade, email, telefone) VALUES
('C001','Marcos','0000-000','São Paulo','Brasileiro','contato@marcos.com','(11) 91234-5678');

INSERT INTO quartos (id, tipo_de_quarto, capacidade, preco_do_quarto) VALUES
('QT024','DELUXE','Solteiro','6500'),
('QT025','DELUXE','Solteiro','6500'),
('QT026','DELUXE','Duplo','8000'),
('QT027','DELUXE','Duplo','8000'),
('QT028','DELUXE','Duplo','8000'),
('QT029','DELUXE','Duplo','8000'),
('QT030','DELUXE','Duplo','8000'),
('QT031','DELUXE','Triplo','9000'),
('QT032','DELUXE','Triplo','9000'),
('QT033','DELUXE','Triplo','9000'),
('QT034','DELUXE','Triplo','9000'),
('QT035','DELUXE','Triplo','9000'),
('QT036','DELUXE','Quádruplo','10000'),
('QT037','DELUXE','Quádruplo','10000'),
('QT038','DELUXE','Quádruplo','10000'),
('QT039','DELUXE','Quádruplo','10000'),
('QT040','DELUXE','Quádruplo','10000'),
('QT041','PREMIO','Solteiro','12000'),
('QT042','PREMIO','Solteiro','12000'),
('QT043','PREMIO','Solteiro','12000'),
('QT044','PREMIO','Duplo','15000'),
('QT045','PREMIO','Duplo','15000'),
('QT046','PREMIO','Duplo','15000'),
('QT047','PREMIO','Triplo','18000'),
('QT048','PREMIO','Triplo','18000'),
('QT049','PREMIO','Quádruplo','20000'),
('QT050','PREMIO','Quádruplo','20000');

INSERT INTO veiculos (id, tipo, custo_do_aluguel, esta_disponivel) VALUES
('V001','Bicicleta','200',0),
('V002','Bicicleta','200', 0),
('V003','Bicicleta','200', 0),
('V004','Bicicleta','200', 0),
('V005','Bicicleta','200', 0),
('V006','Bicicleta','200', 0),
('V007','Bicicleta','200', 0),
('V008','Bicicleta','200', 0),
('V009','Moto','500', 0),
('V010','Moto','500', 0),
('V011','Moto','500', 0),
('V012','Moto','500', 0),
('V013','Moto','500', 0),
('V014','Carro','3000', 0),
('V015','Carro','3000', 0),
('V016','Carro','3000', 0),
('V017','Carro','3000', 0),
('V018','Carro','3000', 0),
('V019','Táxi','4000', 0),
('V020','Táxi','4000', 0),
('V021','Táxi','4000', 0),
('V022','Jeep','4000', 0),
('V023','Jeep','3000', 0),
('V024','Jeep','4000', 0),
('V025','Jeep','4000', 0);

INSERT INTO funcionarios (codigo_cracha, nome, cep, funcao, telefone, email, salario) VALUES
('F001','Carlos Alves','0000-000','CEO','(11) 96230-4050','hotel@carlos.com','25000'),
('F002','Cauê Gonçalves','0000-000','Segurança','(11) 96234-7890','hotel@cauê.com','25000'),
('F003','Emilly Pereira','0000-000','Serviços Gerais','(11) 97623-4050','hotel@emilly.com','23000'),
('F004','Vitória Campos','0000-000','Serviços Gerais','(11) 96230-4050','hotel@vitória.com','25000'),
('F005','Isabella Gomes','0000-000','Serviços Gerais','(11) 96233-4754','hotel@isabella.com','25000'),
('F006','João Lucas Barros','0000-000','Serviços Gerais','(11) 97623-4050','hotel@lucas.com','23000'),
('F007','Bárbara Correia','0000-000','Serviços Gerais','(11) 96230-4050','hotel@baárbara.com','25000'),
('F008','Lavínia Pires','0000-000','Serviços Gerais','(11) 96234-7890','hotel@lavínia.com','25000'),
('F009','Rebeca Gomes','0000-000','Serviços Gerais','(11) 91234-5678','hotel@rebeca.com','23000'),
('F010','Ana Beatriz Cardoso','0000-000','Serviços Gerais','(11) 96230-4050','hotel@beatriz.com','25000'),
('F011','Marcelo Sales','0000-000','Recepcionista','(11) 96234-7890','hotel@marcelo.com','28000'),
('F012','Ana Laura Vieira','0000-000','Recepcionista','(11) 97623-4050','hotel@laura.com','28000'),
('F013','Sofia Rezende','0000-000','Recepcionista','(11) 96230-4050','hotel@sofia.com','28000'),
('F014','Leonardo Campos','0000-000','Recepcionista','(11) 96234-7890','hotel@leonardo.com','45000'),
('F015','Felipe Pinto','0000-000','Chefe','(11) 97623-4050','hotel@felipe.com','43000'),
('F016','Pedro Miguel Castro','0000-000','Chefe','(11) 96230-4050','hotel@pedro.com','55000'),
('F017','Bianca Rodrigues','0000-000','Chefe','(11) 96234-7890','hotel@bianca.com','55000'),
('F018','João Guilherme Oliveira','0000-000','Gerente','(11) 97623-4050','hotel@guilherme.com','73000'),
('F019','Agatha Duarte','0000-000','Gerente','(11) 96230-4050','hotel@agatha.com','95000'),
('F020','Clara Freitas','0000-000','Segurança','(11) 96234-7890','hotel@clara.com','25000'),
('F021','Ana Luiza Farias','0000-000','Limpador','(11) 97623-4050','hotel@luiza.com','23000');

INSERT INTO refeicoes (id, nome, preco_da_refeicao, quantidade) VALUES
('RF001','Arroz Frito','250','100'),
('RF002','Arroz Vegetal','200','100'),
('RF003','Biriyani','300','100'),
('RF004','Ovo Kottu','200','30'),
('RF005','Queijo Kottu','250','50'),
('RF006','Frango Kottu','250','50'),
('RF007','Pizza','600','100'),
('RF008','Berger','270','40'),
('RF009','Ovo roti','200','100'),
('RF010','Roti','100','100'),
('RF011','Bolo de camarão','350','100'),
('RF012','Rolos de Camarão','200','100'),
('RF013','Tikka de Carroanguejo','450','100'),
('RF014','Choco','700','30'),
('RF015','Café Gelado','100','50'),
('RF016','Milo gelado','250','50'),
('RF017','Suco de papaia','120','100'),
('RF018','Suco de Laranja','130','40'),
('RF019','Creme de Manga','170','100'),
('RF020','Falooda','90','100');

INSERT INTO detalhes_da_reserva (id_cliente, id_quarto, data_check_in, data_check_out, custo_do_quarto, custo_de_alimentacao, custo_do_veiculo, custo_total) VALUES
(1,'QT029','2022-10-30','2022-11-03',8000,500,3000,11500);

------------------------------------------------------------------------------------------------
------------------------------------ APRESENTAÇÃO DOS DADOS ------------------------------------
------------------------------------------------------------------------------------------------
SHOW TABLES;
DESCRIBE usuarios;

-- Verifica usuário
SELECT * FROM usuarios 
WHERE nome_de_usuario = '@Carlos'
AND senha = MD5('admin123');

-- Busca quartos com quapacidade igual a 'Duplo'
SELECT * FROM quartos
WHERE capacidade = 'Duplo';

-- Verifica a quantidade de quartos disponiveis agrupados pelo tipo
SELECT 
	DISTINCT tipo_de_quarto,
    COUNT(tipo_de_quarto) AS quantidade
FROM quartos
GROUP BY tipo_de_quarto
ORDER BY tipo_de_quarto ASC;

-- Verifica a quantidade de quartos disponiveis agrupados pela capacidade
SELECT 
	DISTINCT capacidade,
    COUNT(capacidade) AS quantidade
FROM quartos
GROUP BY capacidade
ORDER BY capacidade ASC;

-- Busca por veiculos dísponiveis com o valor de até 500 reais
SELECT * FROM veiculos
WHERE custo_do_aluguel <= 500;

-- Busca pelos funcionarios que trabalha com Serviços Gerais
SELECT 
	codigo_cracha,
    nome,
    funcao,
    telefone,
    email,
    salario
FROM funcionarios
WHERE funcao = 'Serviços Gerais'

-- Retorna o nome, preço e quantidade disponiveis da refeição
SELECT * FROM refeicoes WHERE nome = 'Café Gelado';

SELECT * FROM detalhes_da_reserva;