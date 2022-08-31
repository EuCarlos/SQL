CREATE TABLE alunos (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome VACHAR(50),
  sexo CHAR,
  idade INT,
  status VACHAR(20)
);

-- INDEX
INSERT INTO alunos (nome, sexo, idade, status) VALUES 
("André", "M", 42, "Cursando"),
("Pâmela", "F", 24, "Cursando"),
("Carlos", "M", 24, "Concluido"),
("Daniel", "M", 21, NULL),
("Samuel", "M", 35, "Cursando"),
("Rodrigo", "M", 55, NULL),
("Joyce", "F", 18, NULL),
("Marcela", "F", 39, "Concluido");

-- retorna a média da idade dos alunos
SELECT AVG(idade) FROM alunos;

-- retorna o nome e idade dos alunos onde a idade é maior que a media da idade de todos alunos ordenado do mais velho para o mais novo
SELECT nome, idade FROM alunos 
WHERE idade > (SELECT AVG(idade) FROM alunos)
ORDER BY idade DESC;

-- retorna o nome e o status diferente de "Concluido" e/ou com valores NULOS
SELECT 
	nome, 
  IFNULL(status, "Desconhecido") AS status 
FROM alunos
WHERE status <> "Concluido"
OR status IS NULL
