-- MySQL
-- nadação

CREATE DATABASE treinador;

USE treinador;

-----------------------------------------------------------------------------------------------
------------------------------------- CRIAÇÃO DAS TABELAS -------------------------------------
-----------------------------------------------------------------------------------------------

CREATE TABLE treinador (
    idtreinador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    telefone VARCHAR(11),
    email VARCHAR(70),
    fktreinadorExp INT,

    FOREIGN KEY (fktreinadorExp) REFERENCES treinador(idtreinador)
);

CREATE TABLE nadador (
    idNadador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    estado VARCHAR(70),
    dataNasc DATE,
    fktreinador INT,

    FOREIGN KEY (fktreinador) REFERENCES treinador(idtreinador)
);

------------------------------------------------------------------------------------------------
--------------------------------------- INSERIR OS DADOS ---------------------------------------
------------------------------------------------------------------------------------------------

INSERT INTO treinador(nome, telefone, email, fktreinadorExp) VALUES 
('Felipe', '11989545870', 'pedro.dornelas@gmail.com', NULL),
('Maria', '11945444741', 'maria.fatima@gmail.com', NULL),
('Matheus', '11995087434', 'matheus.ribeiro@gmail.com', NULL),
('Vinicios', '11937610922', 'vinicios.garcia@gmail.com', NULL),
('Antonio', '11966765432', 'antonio.carlos@gmail.com', NULL),
('Vera', '11923478654', 'vera.lucia@gmail.com', NULL);

INSERT INTO nadador (nome, estado, datanasc, fktreinador) VALUES 
('Pedro', 'São Paulo', '2000-07-28', 1),
('Math', 'Rio de janeiro', '2001-05-31',2),
('Daniel', 'São Paulo', '2002-07-05', 2),
('Barbara', 'Babia', '2004-01-10',4),
('Ryan', 'São Paulo', '1988-07-03',5),
('Sonia', 'Minas gerais', '1997-02-09', 6),
('Simone', 'Paraná', '2000-12-09', 1),
('Clara', 'Goiás', '2003-08-13', 2),
('Gomes', 'Mato grosso', '2008-10-22', 3),
('Eduardo', 'Santa catarina', '2000-11-02' ,4),
('Guilherme', 'Pará', '2001-01-01' ,5),
('Selma', 'São paulo', '1994-09-10' ,6);


UPDATE treinador SET fktreinadorExp = 1 WHERE idtreinador = 2;
UPDATE treinador SET fktreinadorExp = 1 WHERE idtreinador = 4;
UPDATE treinador SET fktreinadorExp = 3 WHERE idtreinador = 5;
UPDATE treinador SET fktreinadorExp = 3 WHERE idtreinador = 6;

------------------------------------------------------------------------------------------------
------------------------------------ APRESENTAÇÃO DOS DADOS ------------------------------------
------------------------------------------------------------------------------------------------

SELECT * FROM treinador;
SELECT * FROM nadador;

-- Apresentar os dados dos treinadores e os dados de seus respectivos nadadores.
SELECT * FROM treinador 
JOIN nadador ON fktreinador = idtreinador;

-- Apresentar os dados de um determinado treinador (informar o nome do treinador na consulta) e os
-- dados de seus respectivos nadadores.
SELECT * FROM treinador 
JOIN nadador ON fktreinador = idtreinador 
WHERE treinador.nome = 'Maria';

-- Apresentar os dados dos treinadores e os dados dos respectivos treinadores orientadores.
SELECT * FROM treinador AS exp 
JOIN treinador AS nov ON exp.fktreinadorExp = nov.idtreinador;

-- Apresentar os dados dos treinadores e os dados dos respectivos treinadores orientadores, porém
-- somente de um determinado treinador orientador (informar o nome do treinador na consulta).
SELECT * FROM treinador AS exp 
JOIN treinador AS nov ON nov.fktreinadorExp = exp.idtreinador 
WHERE exp.nome = 'Felipe';

-- Apresentar os dados dos treinadores, os dados dos respectivos nadadores e os dados dos 
-- respectivos treinadores orientadores.
SELECT * FROM treinador AS exp 
JOIN treinador AS nov ON nov.fktreinadorExp = exp.idtreinador
JOIN nadador AS nad ON nad.fktreinador = nov.idtreinador;
 
-- Apresentar os dados de um treinador (informar o seu nome na consulta), os dados dos respectivos
-- nadadores e os dados do seu treinador orientador. 
SELECT * FROM treinador AS exp 
JOIN treinador AS nov ON nov.fktreinadorExp = exp.idtreinador
JOIN nadador AS nad ON nad.fktreinador = nov.idtreinador 
WHERE nov.nome = 'Vera';
