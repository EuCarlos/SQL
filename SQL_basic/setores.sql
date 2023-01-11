-- MySQL

create database praticaFuncionario;
USE praticaFuncionario;

-----------------------------------------------------------------------------------------------
------------------------------------- CRIAÇÃO DAS TABELAS -------------------------------------
-----------------------------------------------------------------------------------------------

CREATE TABLE setor(
    idSetor INT PRIMARY KEY AUTO_INCREMENT,
    nomeSetor VARCHAR(45),
    numeroAndar CHAR(3)
);

CREATE TABLE funcionario(
    idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    telefone_Fixo CHAR(10),
    telefone_Celular CHAR(11),
    salario DECIMAL(10,2),
    fksetor INT,

    FOREIGN KEY (fksetor) REFERENCES setor(idsetor),
    CONSTRAINT checksalario CHECK( salario  > 0)
);

CREATE TABLE acompanhante(
    idAcompanhante INT AUTO_INCREMENT, 
    nome VARCHAR(45), 
    tipo VARCHAR(30),
    datanasc DATE,
    fkfuncionario INT,
    FOREIGN KEY (fkfuncionario) REFERENCES funcionario(idFuncionario),
    PRIMARY KEY (idAcompanhante, fkfuncionario)
);

------------------------------------------------------------------------------------------------
--------------------------------------- INSERIR OS DADOS ---------------------------------------
------------------------------------------------------------------------------------------------

INSERT INTO setor(nomeSetor, numeroAndar) VALUES
('Perfumes', '2'),
('Cremes', '3'),
('Shampoo', '1'),
('perfumes', '2'),
('cremes', '3'),
('shampoo', '1');

INSERT INTO funcionario(nome, telefone_fixo, telefone_celular, salario, fksetor) VALUES
('Pedro', '1145363782', '11989545870', '4.000', 1),
('Mayara', '1145444741', '11946813210', '10.000', 2),
('Maya', '1132667033','11553908102', '3.000', 3),
('Antonio', '1129375655', '11998734235', '3.000', '4'),
('Maria', '1169945253', '11953304312', '10.000', '5'),
('Paulo', '1196377835', '11989985538', '4.500', '6');

INSERT INTO acompanhante(nome, tipo, datanasc, fkfuncionario) VALUES
('Samuel', 'Amigo', '2000-07-28', 1),
('Isabela', 'Amiga', '2001-08-17', 2),
('Sonia', 'Mãe', '1975-06-07', 3),
('Eva', 'sogra', '1971-08-26', '4'),
('Mario', 'amigo', '2006-12-31', '5'),
('Vivian', 'irmã', '2004-01-04', '6');

------------------------------------------------------------------------------------------------
------------------------------------ APRESENTAÇÃO DOS DADOS ------------------------------------
------------------------------------------------------------------------------------------------

-- Apresenta setores, funcionarios e acompanhantes existentes
SELECT * FROM setor;
SELECT * FROM funcionario;
SELECT * FROM acompanhante;

-- Apresenta os funcionarios com seus respectivos setores
SELECT * FROM funcionario JOIN setor ON fksetor = idSetor;

-- Apresenta os funcionarios com seus respectivos setores com id 1 e 4
SELECT 
    setor.nomeSetor, 
    funcionario.* 
FROM funcionario JOIN setor ON fksetor = idSetor 
WHERE idFuncionario IN(1,4);

-- Apresenta os funcionarios com seus respectivos acompanhantes 
SELECT * FROM funcionario 
JOIN acompanhante ON fkfuncionario = idFuncionario;

SELECT 
    funcionario.nome, 
    acompanhante.* 
FROM acompanhante JOIN funcionario ON fkfuncionario = idfuncionario 
WHERE idfuncionario = 1;

SELECT * FROM funcionario 
JOIN setor ON idsetor= fksetor 
JOIN acompanhante ON  fkfuncionario = idfuncionario;
