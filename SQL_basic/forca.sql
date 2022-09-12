-- mysql
CREATE DATABASE jogo;
USE jogo;

CREATE TABLE IF NOT EXISTS forca (
    id INT NOT NULL AUTO_INCREMENT,
    palavra VARCHAR(45) NOT NULL,
    dica VARCHAR(19) ENUM(
        "Fruta",
        "Peixe",
        "Cor",
        "Flores",
        "Legume",
        "Times de Futebol",
        "Estados Brasileiros",
        "Países",
        "Mamíferos",
        "Esporte"
    ),

    PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO forca (palavra, dica) VALUES
("manga","Fruta"),
("banana","Fruta"),
("goiaba","Fruta"),
("caqui","Fruta"),
("uva","Fruta"),
("açai","Fruta"),
("acerola","Fruta"),
("kiwi","Fruta"),
("mamao","Fruta"),
("caju","Fruta"),
("dourado","Peixe"),
("enguia","Peixe"),
("pacu","Peixe"),
("linguado","Peixe"),
("salmao","Peixe"),
("pargo","Peixe"),
("truta","Peixe"),
("atum","Peixe"),
("bagre","Peixe"),
("carpa","Peixe"),
("rosa","Cor"),
("vermelho","Cor"),
("cinza","Cor"),
("verde","Cor"),
("bege","Cor"),
("lilas","Cor"),
("marrom","Cor"),
("amarelo","Cor"),
("roxo","Cor"),
("azul","Cor"),
("lotus","Flores"),
("tulipa","Flores"),
("petunia","Flores"),
("primula","Flores"),
("hortensia","Flores"),
("cravo","Flores"),
("ipe","Flores"),
("rosa","Flores"),
("girassol","Flores"),
("lirio","Flores"),
("aspargo","Legume"),
("repolho","Legume"),
("chuchu","Legume"),
("quiabo","Legume"),
("pimentao","Legume"),
("tomate","Legume"),
("rabanete","Legume"),
("cenoura","Legume"),
("mandioca","Legume"),
("gengibre","Legume"),
("fortaleza","Times de Futebol"),
("botafogo","Times de Futebol"),
("Corinthians","Times de Futebol"),
("vasco","Times de Futebol"),
("fluminense","Times de Futebol"),
("santos","Times de Futebol"),
("gremio","Times de Futebol"),
("flamengo","Times de Futebol"),
("cruzeiro","Times de Futebol"),
("palmeiras","Times de Futebol"),
("bahia","Estados Brasileiros"),
("parana","Estados Brasileiros"),
("goias","Estados Brasileiros"),
("amazonas","Estados Brasileiros"),
("pernambuco","Estados Brasileiros"),
("ceara","Estados Brasileiros"),
("sergipe","Estados Brasileiros"),
("maranhao","Estados Brasileiros"),
("paraiba","Estados Brasileiros"),
("roraima","Estados Brasileiros"),
("jamaica","Países"),
("finlandia","Países"),
("dinamarca","Países"),
("croacia","Países"),
("portugal","Países"),
("belgica","Países"),
("grecia","Países"),
("brasil","Países"),
("angola","Países"),
("afeganistao","Países"),
("javali","Mamíferos"),
("macaco","Mamíferos"),
("raposa","Mamíferos"),
("ovelha","Mamíferos"),
("tigre","Mamíferos"),
("golfinho","Mamíferos"),
("coelho","Mamíferos"),
("morcego","Mamíferos"),
("baleia","Mamíferos"),
("zebra","Mamíferos"),
("rugby","Esporte"),
("volei","Esporte"),
("basquete","Esporte"),
("handbol","Esporte"),
("natacao","Esporte"),
("ciclismo","Esporte"),
("beisebol","Esporte"),
("hoquei","Esporte"),
("futebol","Esporte"),
("tenis","Esporte");

CREATE OR REPLACE FUNCTION generate_random_number (first_value INT, second_value INT) RETURNS INT
BEGIN
	DECLARE r INT;
    SET r = FLOOR(second_value + RAND() * (first_value - second_value));
    
    RETURN r;
END;

-- apresenta a palavra e a dica de toda a base
SELECT palavra, dica FROM forca;

-- gera uma palavra com uma função que escolhe um numero de um 
SELECT 
    palavra,
    LENGTH(palavra) AS tamanho,
    dica 
FROM forca
WHERE id = generate_random_number(1, 100)
LIMIT 1;

-- lista todas as categorias e a quantidade registrada por categoria
SELECT
	dica AS categoria,
    COUNT(dica) AS quantidade_per_categoria
FROM forca
GROUP BY dica
ORDER BY dica;

-- lista todos que a dica é "Peixe"
SELECT 
    palavra,
    dica 
FROM forca
WHERE dica = "Peixe"
ORDER BY palavra;

SELECT 
    palavra,
    dica
FROM forca
WHERE dica = "Peixe" 
AND id = (SELECT MAX(id) FROM forca WHERE dica = "Peixe")
ORDER BY palavra;

