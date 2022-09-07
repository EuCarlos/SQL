CREATE DATABASE oficina;
USE oficina;

-----------------------------------------------------------------------------------------------
------------------------------------- CRIAÇÃO DAS TABELAS -------------------------------------
-----------------------------------------------------------------------------------------------

CREATE TABLE cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_completo VARCHAR (30),
    sexo CHAR(1),
    num_cpf CHAR(11) UNIQUE,
    modelo_do_veiculo VARCHAR (30),
    placa_do_veiculo CHAR(7) UNIQUE,
    telefone VARCHAR(11) 
);

CREATE TABLE funcionario (
    idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (30),
    endereco VARCHAR (30),
    especialidade ENUM('Funilaria', 'Eletrica', 'Arrefecimento', 'Motor', 'Cambio')
);                         

CREATE TABLE ordem_de_servico (
    idOrdemDeServico INT PRIMARY KEY AUTO_INCREMENT,
    tipo_os ENUM ('concerto','revisão'),
    descricao_serviço VARCHAR (255),
    status_os ENUM('analisando', 'em andamento', 'aguardando aprovação', 'aguardando peça', 'concluido'),
    valor FLOAT,
    data_os date,
    data_conclusao date,
    idCliente_os INT,
    idMecanico_os INT,
    CONSTRAINT fk_ordem_de_servico_cliente FOREIGN KEY (idCliente_os) REFERENCES cliente(idCliente),
    CONSTRAINT fk_ordem_de_servico_mecanico FOREIGN KEY (idMecanico_os) REFERENCES funcionario(idFuncionario)        
);

CREATE TABLE orcamento(
    Id_orcamento INT PRIMARY KEY AUTO_INCREMENT,
    num_os INT,
    valor_orcamento FLOAT,
    idCliente_orcamento INT,
    CONSTRAINT fk_orcamento_num_os FOREIGN KEY (num_os) REFERENCES ordem_de_servico(idOrdemDeServico),
    CONSTRAINT fk_orcamento_idCliente FOREIGN KEY (idCliente_orcamento) REFERENCES cliente(idCliente)
);

------------------------------------------------------------------------------------------------
--------------------------------------- INSERIR OS DADOS ---------------------------------------
------------------------------------------------------------------------------------------------

INSERT INTO cliente (nome_completo, sexo, num_cpf, modelo_do_veiculo, placa_do_veiculo, telefone) VALUES
('Carlos Alves', 'm', '39739016006', 'Etios','FLF5j33', '11912345678'),
('Fernando Melo', 'm', '40439333040', 'Corsa','ALF5G44', '11912345678'),
('Ana Silva', 'f', '18892624040', 'Palio','ABF5j21', '11912345678'),
('Pamela Mendes', 'f', '87959609020', 'Corolla','ZEL473', '11912345678'),
('André Santos', 'm', '87640205093', 'Hilux','TAL511', '11912345678'),
('Maria de Jesus', 'f', '85136938048', 'Fiesta','COR672', '11912345678');

INSERT INTO funcionario (nome,endereco,especialidade) VALUES
('Alceu Álvarez', 'Rua Araúnas 429','Funilaria'),
('Conrado Santos', 'Rua Garça 162', 'Motor'),
('Giovane Lacerda', 'Rua Petrúcio Ferreira', 'Arrefecimento'),
('João Campos', 'Rua Quatorze 460', 'Cambio'),
('Vítor Nogueira', 'Rua Alemanha 597', 'Eletrica');    

INSERT INTO ordem_de_servico (tipo_os, descricao_serviço, status_os, valor, data_os, data_conclusao,idCliente_os,idMecanico_os) VALUES
('concerto', 'funilaria na porta', 'analisando', '200', '2022-08-30', '2022-09-05','1','1'),
('revisão', 'motor falhando', 'aguardando aprovação', '500', '2022-08-25', '2022-08-30','2','2'),
('concerto', 'farol não liga', 'aguardando aprovação', '500', '2022-08-27', '2022-09-02','3','3');

INSERT INTO orcamento (num_os ,valor_orcamento, idCliente_orcamento)VALUES
('1','200',1),
('2','500',2),
('3','500',3);

------------------------------------------------------------------------------------------------
--------------------------------------- CRIAÇÃO DE VIEWS ---------------------------------------
------------------------------------------------------------------------------------------------

-- View que lista até 10 status da ordem de serviço do cliente com o valor do serviço
CREATE VIEW vw_ordem_de_servico_com_valor AS SELECT 
	c.nome_completo, 
    o.valor_orcamento, 
    os.status_os 
FROM cliente c
INNER JOIN orcamento o
ON c.idCliente = o.idCliente_orcamento
JOIN ordem_de_servico os
ON os.idOrdemDeServico = o.idCliente_orcamento
LIMIT 10;

SELECT * FROM ordem_de_servico_com_valor;

-- View que lista até 10 clientes e apresenta o tipo de serviço solicitado, com o nome do mecanico resposavel
CREATE VIEW vw_mecanico_responsavel_pelo_servico AS SELECT 
	c.nome_completo AS cliente, 
    os.descricao_serviço, 
    f.nome AS mecanico
FROM cliente c
INNER JOIN ordem_de_servico os
ON c.idCliente = os.idCliente_os
JOIN funcionario f
ON f.idFuncionario = os.idMecanico_os
LIMIT 10;

SELECT * FROM mecanico_responsavel_pelo_servico;

-- Remove as views
DROP VIEW vw_ordem_de_servico_com_valor;
DROP VIEW vw_mecanico_responsavel_pelo_servico;
