-- postgres
CREATE TABLE usuarios (
	codigo SERIAL PRIMARY KEY,
  	usuario VARCHAR(10),
  	email VARCHAR(100),
  	senha VARCHAR(32)
);

insert INTO usuarios(usuario, email, senha) VALUES
('@maiconlma', 'maiconlma@dev.io', MD5('123456')),
('@flavio123', 'flavio123@dev.io', MD5('abc123')),
('@i_abc3687', 'i_abc3687@dev.io', MD5('a1b2c3'));

-- verificar usuario
SELECT * FROM usuarios 
WHERE usuario = '@maiconlma'
AND senha = MD5('123456')

-- atualiza senha
UPDATE usuarios SET senha = MD5('novasenha') WHERE codigo = 2;