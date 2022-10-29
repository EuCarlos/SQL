-- Banco de dados LOJA
-- MySQL

CREATE DATABASE loja;
USE loja;

-----------------------------------------------------------------------------------------------
------------------------------------- CRIAÇÃO DAS TABELAS -------------------------------------
-----------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS loja (
  id_loja INT(5) NOT NULL AUTO_INCREMENT,
  nome_da_loja VARCHAR(35) DEFAULT NULL,
  rfc VARCHAR(10) DEFAULT NULL,
  endereco VARCHAR(300) DEFAULT NULL,
  cod_postal INT(5) DEFAULT NULL,
  tefone VARCHAR(15) DEFAULT NULL,
  email VARCHAR(35) DEFAULT NULL,
  PRIMARY KEY (id_loja)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=2;

CREATE TABLE IF NOT EXISTS departamento (
  id_departamento INT(5) NOT NULL AUTO_INCREMENT,
  nome_dept VARCHAR(35) DEFAULT NULL,
  descricao VARCHAR(150) DEFAULT NULL,
  PRIMARY KEY (id_departamento)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=3;

CREATE TABLE IF NOT EXISTS produto (
  id INT(5) NOT NULL AUTO_INCREMENT,
  produto VARCHAR(35) DEFAULT NULL,
  codigo INT(15) DEFAULT NULL,
  descricao VARCHAR(50) DEFAULT NULL,
  quant_no_estoque INT(5) DEFAULT NULL,
  id_departamento INT(11) DEFAULT NULL,
  preco_unitario DECIMAL(5,1) DEFAULT NULL,
  preco DECIMAL(5,1) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=3;

CREATE TABLE IF NOT EXISTS tipo_usuario (
  id_tipo_usuario INT(5) NOT NULL AUTO_INCREMENT,
  rol VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (id_tipo_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=3;

CREATE TABLE IF NOT EXISTS usuarios (
  id_usuario INT(5) NOT NULL AUTO_INCREMENT,
  nome VARCHAR(30) DEFAULT NULL,
  nome_do_pai VARCHAR(30) DEFAULT NULL,
  nome_do_mae VARCHAR(30) DEFAULT NULL,
  data_nascimento DATE DEFAULT NULL,
  telefone VARCHAR(15) DEFAULT NULL,
  email VARCHAR(35) DEFAULT NULL,
  usuario VARCHAR(30) DEFAULT NULL,
  password VARCHAR(30) DEFAULT NULL,
  id_tipo_usuario INT(11) DEFAULT NULL,
  id_loja INT(11) DEFAULT NULL,
  PRIMARY KEY (id_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=2;

CREATE TABLE IF NOT EXISTS venda (
  id INT(10) NOT NULL AUTO_INCREMENT,
  fechamento DATETIME DEFAULT NULL,
  id_usuario INT(11) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=3;

CREATE TABLE IF NOT EXISTS detalhes_da_venda (
  id INT(10) NOT NULL AUTO_INCREMENT,
  id_venda INT(11) DEFAULT NULL,
  id_produto INT(11) DEFAULT NULL,
  quantidade INT(10) DEFAULT NULL,
  preco DECIMAL(6,2) DEFAULT NULL,
  subtotal DECIMAL(6,2) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=5;

------------------------------------------------------------------------------------------------
--------------------------------------- INSERIR OS DADOS ---------------------------------------
------------------------------------------------------------------------------------------------

INSERT INTO loja (id_loja, nome_da_loja, rfc, endereco, cod_postal, tefone, email) VALUES
(1, 'Loja 24H', 'LOCI930402', 'Rua Amauri 286, Jardim Europa, São Paulo - SP', 01448900, '+55 (11) 91234-5678', 'contato@loja24h.com.br');

INSERT INTO departamento (id_departamento, nome_dept, descricao) VALUES
(1, 'LIMPEZA', 'DETERGENTES, PAPEL, ETC'),
(2, 'MANTIMENTOS', 'CESTA BÁSICA');

INSERT INTO produto (id, produto, codigo, descricao, quant_no_estoque, id_departamento, preco_unitario, preco) VALUES
(1, 'PAPEL', 21212, 'PAPEL HIGIENICO 4 ROLOS', 2, 1, '10.1', '15.1'),
(2, 'MOLHO', 23233, 'MOLHO DE PIMENTA VALENTINA 500GR', 5, 2, '8.5', '12.5');

INSERT INTO tipo_usuario (id_tipo_usuario, rol) VALUES
(1, 'Administrador'),
(2, 'Caixa Eletrônico');

INSERT INTO usuarios (id_usuario, nome, nome_do_pai, nome_do_mae, data_nascimento, telefone, email, usuario, password, id_tipo_usuario, id_loja) VALUES
(1, 'Carlos', 'Fernando', 'Flavia', '1998-03-01', '+55 (11) 91234-5678', 'contato@carlos.dev', '@eucarlos', 'admin123', 1, 1);

INSERT INTO venda (id, fechamento, id_usuario) VALUES
(1, '2022-10-29 07:43:58', 1),
(2, '2022-10-29 08:08:55', 1);

INSERT INTO detalhes_da_venda (id, id_venda, id_produto, quantidade, preco, subtotal) VALUES
(1, 1, 1, 2, '15.10', '30.20'),
(2, 1, 2, 1, '12.50', '12.50'),
(3, 2, 1, 3, '15.10', '45.30'),
(4, 2, 2, 1, '12.50', '12.50');

------------------------------------------------------------------------------------------------
------------------------------------ APRESENTAÇÃO DOS DADOS ------------------------------------
------------------------------------------------------------------------------------------------

-- Busca departamento por id
SELECT * FROM departamento WHERE id_departamento = 3;

-- Busca produto por id
SELECT * FROM produto 
WHERE id_produto = 2;

-- Mostra os todos os departamentos
SELECT * FROM departamento 
WHERE id_departamento IN(
    SELECT id_departamento FROM produto 
    WHERE id_produto = 1
);

-- Mostra os todos os tipos
SELECT * FROM tipo_usuario 
WHERE id_tipo_usuario IN (
    SELECT id_tipo_usuario FROM usuarios
    WHERE id_usuario = 1
);

-- Apresenta o total de fechamento de vendas por més
SELECT 
    COUNT('fechamento') as total 
FROM venda 
GROUP BY MONTH(venda.fechamento) ASC;

-- Apresenta dados da loja
SELECT * FROM loja WHERE id_loja = 1;

-- Apresenta a detalhes da compra
SELECT 
    codigo, 
    descricao, 
    quant_no_estoque, 
    dv.preco, 
    dv.subtotal 
FROM produto p
JOIN detalhes_da_venda dv
USING(id_produto) 
WHERE id_venda = 1;

-- Mostra o total da venda
SELECT 
    SUM(subtotal) as total 
FROM detalhes_da_venda 
WHERE id_venda = 3 
GROUP BY id_venda;
