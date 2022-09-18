-- postgres
-- autorelacionamento
CREATE TABLE funcionarios (
	codigo SERIAL PRIMARY KEY,
    matricula VARCHAR(15),
    nome VARCHAR(100) NOT NULL,
    dt_nasc DATE,
    cod_gerente INT
);

ALTER TABLE funcionarios 
ADD CONSTRAINT funcionarios_gerenete_FK FOREIGN KEY(cod_gerente) 
REFERENCES funcionarios(codigo);

insert into funcionarios (matricula, nome, cod_gerente) VALUES
("d3jzfsa8k", "Carlos", NULL),
("iu5ylk1bv", "Claudio",1),
("yuetfdsaq", "Felipe",1),
("mlur7edw2", "Marcelo",2);