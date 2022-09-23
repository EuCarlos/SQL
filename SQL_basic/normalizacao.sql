-- postgres

CREATE TABLE IF NOT EXISTS funcionarios_sem_normalizacao (
	matricula SERIAL PRIMARY KEY,
 	nome VARCHAR(50) NOT NULL,
 	salario FLOAT NOT NULL,
 	departamento VARCHAR(45),
 	cidade VARCHAR(45),
  	estado CHAR(2)
);

INSERT INTO funcionarios_sem_normalizacao (nome,salario,departamento,cidade,estado) VALUES
('Carlos', 3651.25, 'Gestão de T.I', 'Recife', 'PE'),
('Paula', 2689.04, 'Recursos Humanos', 'Rio de Janeiro', 'RJ'),
('João', 3589.10, 'RH', 'São Paulo', 'SP'),
('Felipe', 1985.60, 'Financeiro', 'São Carlos', 'SP'),
('Claudia', 3050.85, 'Financeiro', 'Farroupilha', 'RS'),
('Marcela', 2541.60, 'Marketing', 'Caxias do Sul', 'RS'),
('Rogerio', 1253.60, 'MKT', 'Cax do sul', 'RS');

SELECT * from funcionarios_sem_normalizacao;


--------------------------------- COM NORMALIZAÇÃO ---------------------------------
CREATE TABLE IF NOT EXISTS departamento (
	codigo SERIAL PRIMARY KEY,
  	nome VARCHAR(45)
);

INSERT INTO departamento (nome) VALUES
('Gestão de T.I'),
('Recursos Humanos'),
('Financeiro'),
('Marketing');

CREATE TABLE IF NOT EXISTS cidades (
	codigo SERIAL PRIMARY KEY,
  	nome VARCHAR(45),
  	estado CHAR(2)
);

INSERT INTO cidades (nome, estado) VALUES
('Recife', 'PE'),
('Rio de Janeiro', 'RJ'),
('São Paulo', 'SP'),
('São Carlos', 'SP'),
('Farroupilha', 'RS'),
('Caxias do Sul', 'RS');

CREATE TABLE IF NOT EXISTS funcionarios (
	matricula SERIAL PRIMARY KEY,
 	nome VARCHAR(50) NOT NULL,
 	salario FLOAT NOT NULL,
 	cod_cidade INT,
  	cod_departamento INT,
  
    CONSTRAINT fk_depmt
      FOREIGN KEY(cod_departamento) 
        REFERENCES departamento(codigo),
  	CONSTRAINT fk_cid
      FOREIGN KEY(cod_cidade) 
        REFERENCES cidades(codigo)
);

INSERT INTO funcionarios (nome,salario,cod_cidade,cod_departamento) VALUES
('Carlos', 3651.25, 1, 1),
('Paula', 2689.04, 2, 2),
('João', 3589.10, 3, 2),
('Felipe', 1985.60, 4, 3),
('Claudia', 3050.85, 5, 3),
('Marcela', 2541.60, 6, 4),
('Rogerio', 1253.60, 6, 4);

SELECT 
	f.matricula,
    f.nome AS funcionario,
    f.salario,
    c.nome AS cidade,
    c.estado,
    d.nome AS departamento
FROM funcionarios AS f 
INNER JOIN cidades AS c 
	ON f.cod_cidade = c.codigo 
INNER JOIN departamento AS d 
	on F.cod_departamento = d.codigo
ORDER BY matricula ASC
LIMIT 10;
