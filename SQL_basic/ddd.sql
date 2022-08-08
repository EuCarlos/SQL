-- TABLE
CREATE TABLE estado (
	id INT NOT NULL,
  	nome_estado VARCHAR(20) UNIQUE,
  	PRIMARY KEY (id)
);

CREATE TABLE ddd (
	id INT NOT NULL,
  	numero_DDD INT UNIQUE,
  	state_id INT NOT NULL,
  	PRIMARY KEY (id),
  	FOREIGN KEY (state_id) REFERENCES state(id)
);
 
-- INDEX
INSERT INTO estado VALUES
(1, "Acre"),
(2, "Alagoas"),
(3, "Amazonas"),
(4, "Amapá"),
(5, "Bahia"),
(6, "Ceará"),
(7, "Distrito Federal"),
(8, "Espírito Santo"),
(9, "Goiás"),
(10, "Maranhão"),
(11, "Minas Gerais"),
(12, "Mato Grosso do Sul"),
(13, "Mato Grosso"),
(14, "Pará"),
(15, "Paraíba"),
(16, "Pernambuco"),
(17, "Piauí"),
(18, "Paraná"),
(19, "Rio de Janeiro"),
(20, "Rio Grande do Norte"),
(21, "Rondônia"),
(22, "Roraima"),
(23, "Rio Grande do Sul"),
(24, "Santa Catarina"),
(25, "Sergipe"),
(26, "São Paulo"),
(27, "Tocantins");

INSERT INTO ddd VALUES
(1, 68, 1),
(2, 82, 2),
(3, 92, 3),
(4, 97, 3),
(5, 96, 4),
(6, 71, 5),
(7, 73, 5),
(8, 74, 5),
(9, 75, 5),
(10, 77, 5),
(11, 85, 6),
(12, 88, 6),
(13, 61, 7),
(14, 27, 8),
(15, 28, 8),
(16, 62, 9),
(17, 64, 9),
(18, 98, 10),
(19, 99, 10),
(20, 31, 11),
(21, 32, 11),
(22, 33, 11),
(23, 34, 11),
(24, 35, 11),
(25, 37, 11),
(26, 38, 11),
(27, 67, 12),
(28, 65, 13),
(29, 66, 13),
(30, 91, 14),
(31, 93, 14),
(32, 94, 14),
(33, 83, 15),
(34, 81, 16),
(35, 87, 16),
(36, 86, 17),
(37, 89, 17),
(38, 41, 18),
(39, 42, 18),
(40, 43, 18),
(41, 44, 18),
(42, 45, 18),
(43, 46, 18),
(44, 21, 19),
(45, 22, 19),
(46, 24, 19),
(47, 84, 20),
(48, 69, 21),
(49, 95, 22),
(50, 51, 23),
(51, 53, 23),
(52, 54, 23),
(53, 55, 23),
(54, 47, 24),
(55, 48, 24),
(56, 49, 24),
(57, 79, 25),
(58, 11, 26),
(59, 12, 26),
(60, 13, 26),
(61, 14, 26),
(62, 15, 26),
(63, 16, 26),
(64, 17, 26),
(65, 18, 26),
(66, 19, 26),
(67, 63, 27);

-- Retorna todos os estados e seus DDDs
SELECT e.nome_estado, d.numero_DDD
FROM estado e, ddd d
WHERE e.id = d.state_id
ORDER BY nome_estado ASC

-- Retorna todos os DDDs do estado de São Paulo
SELECT e.nome_estado, d.numero_DDD
FROM estado e, ddd d
WHERE e.id = d.state_id
AND nome_estado LIKE "%São Paulo%"

-- Retorna quantidade de DDDs existem para cada estado
SELECT e.nome_estado, COUNT(d.numero_DDD) AS quant_DDDs
FROM estado e, ddd d
WHERE e.id = d.state_id
GROUP BY e.nome_estado

-- Retorna de qual estado é o DDD 69
SELECT e.nome_estado, d.numero_DDD
FROM estado e, ddd d
WHERE e.id = d.state_id
AND numero_ddd = 69

-- Retorna os DDD maiores que 40 e menores 47
SELECT e.nome_estado, d.numero_DDD
FROM estado e, ddd d
WHERE e.id = d.state_id
AND d.numero_DDD > 40
AND d.numero_DDD < 47