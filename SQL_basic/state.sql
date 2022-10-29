-- MySQL
CREATE TABLE states (
     id_state INT PRIMARY KEY NOT NULL,
     ibge_code INT NOT NULL CHECK ("ibge_code" <> ''),
     abbreviation CHAR(2) NOT NULL CHECK ("abbreviation" <> ''),
     state_value VARCHAR(60) NOT NULL CHECK ("state_value" <> ''),
     region ENUM('Norte', 'Nordeste', 'Sudeste', 'Sul', 'Centro-Oeste')
);

INSERT INTO states (id_state, ibge_code, abbreviation, state_value, region) VALUES
(1, 12, 'AC', 'Acre', 'Norte'),
(2, 27, 'AL', 'Alagoas', 'Nordeste'),
(3, 16, 'AP', 'Amapá', 'Norte'),
(4, 13, 'AM', 'Amazonas', 'Norte'),
(5, 29, 'BA', 'Bahia', 'Nordeste'),
(6, 23, 'CE', 'Ceará', 'Nordeste'),
(7, 53, 'DF', 'Distrito Federal', 'Centro-Oeste'),
(8, 32, 'ES', 'Espírito Santo', 'Sudeste'),
(9, 52, 'GO', 'Goiás', 'Centro-Oeste'),
(10, 21, 'MA', 'Maranhão', 'Nordeste'),
(11, 51, 'MT', 'Mato Grosso', 'Centro-Oeste'),
(12, 50, 'MS', 'Mato Grosso do Sul', 'Centro-Oeste'),
(13, 31, 'MG', 'Minas Gerais', 'Sudeste'),
(14, 15, 'PA', 'Pará', 'Norte'),
(15, 25, 'PB', 'Paraíba', 'Nordeste'),
(16, 41, 'PR', 'Paraná', 'Sul'),
(17, 26, 'PE', 'Pernambuco', 'Nordeste'),
(18, 22, 'PI', 'Piauí', 'Nordeste'),
(19, 33, 'RJ', 'Rio de Janeiro', 'Sudeste'),
(20, 24, 'RN', 'Rio Grande do Norte', 'Nordeste'),
(21, 43, 'RS', 'Rio Grande do Sul', 'Sul'),
(22, 11, 'RO', 'Rondônia', 'Norte'),
(23, 14, 'RR', 'Roraima', 'Norte'),
(24, 42, 'SC', 'Santa Catarina', 'Sul'),
(25, 35, 'SP', 'São Paulo', 'Sudeste'),
(26, 28, 'SE', 'Sergipe', 'Nordeste'),
(27, 17, 'TO', 'Tocantins', 'Norte');


SELECT COUNT(*) AS quant_estados from states;

SELECT abbreviation, state_value from states
ORDER BY abbreviation ASC;

SELECT 
     ibge_code,
     abbreviation AS state,
     region
FROM states
WHERE region = 'Centro-Oeste'

SELECT 
	DISTINCT region,
     COUNT(region) AS quant_de_estados
FROM states
GROUP BY region
ORDER BY region;