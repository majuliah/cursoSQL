CREATE DATABASE AULA40;

USE AULA40;

CREATE TABLE USUARIO
(
	IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    LOGIN VARCHAR(30),
    SENHA VARCHAR(100)
);

CREATE TABLE BACKUP_USUARIO
(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
    IDUSUARIO INT,
    NOME VARCHAR(30),
    LOGIN VARCHAR(30)
);

DELIMITER $;

CREATE TRIGGER BACKUP_USER
BEFORE DELETE ON USUARIO
FOR EACH ROW
BEGIN 
    INSERT INTO BACKUP_USUARIO VALUES (NULL, OLD.IDUSUARIO, OLD.NOME, OLD.LOGIN);
END
$

INSERT INTO USUARIO VALUES(NULL, 'ANDRADE', 'ANDRADE2009', 'HEXACAMPEAO');

DELETE FROM USUARIO WHERE IDUSUARIO = 1;

SELECT * FROM BACKUP_USUARIO;

SHOW TABLES;







CREATE DATABASE LOJA;

USE LOJA;

CREATE TABLE PRODUTO
(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    VALOR FLOAT(10,2)
);

CREATE DATABASE BACKUP;
USE BACKUP;

CREATE TABLE BKP_PRODUTO
(
	IDBKP INT PRIMARY KEY AUTO_INCREMENT,
    IDPRODUTO INT,
    NOME VARCHAR(30),
    VALOR FLOAT(10,2)
);

INSERT INTO BACKUP.BKP_PRODUTO
VALUES (NULL, 1000, 'TESTE', 0.0);

SELECT * FROM BACKUP.BKP_PRODUTO;

DELIMITER $;

CREATE TRIGGER BACKUP_PRODUTO
BEFORE INSERT ON PRODUTO
FOREACH ROW
BEGIN
	INSERT INTO BACKUP.BKP_PRODUTO
	VALUES (NULL, NEW.IDPRODUTO, NEW.NOME, NEW.VALOR);
END

INSERT INTO PRODUTO VALUES(NULL, 'LIVRO MODELAGEM', 50.00);
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO BI', 60.00);
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO ORACLE', 70.00);
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO SQL SERVER', 150.00);

SELECT * FROM PRODUTO

DROP DATABASE LOJA;
DROP DATABASE BACKUP;
