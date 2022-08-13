CREATE TABLE cronometro (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
  	cod_usuario INTEGER,
  	data DATE,
  	tempo TIME
);

INSERT INTO cronometro (cod_usuario, data, tempo) VALUES
(1, "2022-08-01", "05:00:00"),
(1, "2022-08-03", "00:30:00"),
(1, "2022-08-02", "00:30:00"),
(2, "2022-08-01", "00:40:00"),
(2, "2022-08-03", "01:40:00"),
(3, "2022-08-01", "02:22:00");

CREATE TABLE usuario (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
  	nome VACHAR(50),
  	cronometro_id INT,
  	FOREIGN KEY (cronometro_id) REFERENCES cronometro(id)
);

INSERT INTO usuario (nome, cronometro_id) VALUES
("Carlos", 1),
("Marcos", 2),
("Flavio", 3);

-- apresenta todos os dados da tabela cronometro
SELECT cod_usuario, data, tempo
FROM cronometro
ORDER BY cod_usuario;

-- apresenta o total de horas agrupado pelo código do usúario
SELECT 
	cod_usuario, 
    CAST(SUM(tempo) AS FLOAT) AS total_horas_p_usuarios
FROM cronometro
GROUP BY cod_usuario
ORDER by cod_usuario;

-- apresenta o nome e total de horas agrupado pelo código do usúario 
SELECT 
	u.nome, 
    SUM(c.tempo) AS total_horas_p_usuarios
FROM cronometro c, usuario u
WHERE c.cod_usuario = u.cronometro_id
GROUP BY c.cod_usuario
ORDER BY u.nome ASC;