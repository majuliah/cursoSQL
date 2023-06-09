--BULK INSERT
USE AULA1

CREATE TABLE LANCAMENTO_CONTABIL
(
    CONTA INT,
    VALOR INT,
    DEB_CRED CHAR(1)
)
GO

BULK INSERT LANCAMENTO_CONTABIL
FROM 'C:\Users\Public\Downloads\Curso\CONTAS.txt'
WITH
(
    FIRSTROW = 2,
    DATAFILETYPE = 'char',
    FIELDTERMINATOR = '\t', -- = tab
    ROWTERMINATOR = '\n' --enter
)

SELECT * FROM LANCAMENTO_CONTABIL

--Traga o número da conta - saldo - devedor ou credor

SELECT CONTA, VALOR,
CHARINDEX('D', TIPO) AS DEBITO,
CHARINDEX('C', TIPO) AS CREDITO
FROM LANCAMENTO_CONTABIL


SELECT CONTA, VALOR,
CHARINDEX('D', TIPO) AS DEBITO,
CHARINDEX('C', TIPO) AS CREDITO,
CHARINDEX('C', TIPO) * 2 - 1 AS MULTIPLICADOR
FROM LANCAMENTO_CONTABIL

SELECT CONTA, 
SUM(VALOR * (CHARINDEX('C', TIPO) * 2 - 1)) AS SALDO
FROM LANCAMENTO_CONTABIL
GROUP BY CONTA
GO

CREATE TABLE PRODUTOS
(
    IDPRODUTO INT IDENTITY PRIMARY KEY,
    NOME VARCHAR(50) NOT NULL,
    CATEGORIA VARCHAR(30) NOT NULL,
    PRECO NUMERIC(10,2) NOT NULL 
)
GO

CREATE TABLE HISTORICO
(
    IDOPERACAO INT PRIMARY KEY IDENTITY,
    PRODUTO VARCHAR(50) NOT NULL,
    CATEGORIA VARCHAR(30) NOT NULL,
    PRECOANTIGO NUMERIC(10,2) NOT NULL,
    PRECONOVO NUMERIC(10,2) NOT NULL,
    DATAPROD DATETIME,
    USUARIO VARCHAR(30),
    MENSAGEM VARCHAR(100) 
)

INSERT INTO PRODUTOS VALUES('LIVRO SQL SERVER','LIVROS', 98.0)
INSERT INTO PRODUTOS VALUES('LIVRO ORACLE','LIVROS', 50.0)
INSERT INTO PRODUTOS VALUES('LISCENÇA POWER', 'SOFTWARES',450000.0)
INSERT INTO PRODUTOS VALUES('NOTEBOOK','COMPUTADORES', 5000.0)
INSERT INTO PRODUTOS VALUES('BENGALA DE IDOSO','CUIDADOS', 200.0)

SELECT * FROM PRODUTOS
SELECT * FROM HISTORICO

SELECT SUSER_NAME()
GO

--TRIGGER DE DADOS -> DML -> DATA MANIPULATION LANGUAGE

CREATE TRIGGER TRG_ATUALIZA_PRECO
ON DBO.PRODUTOS
FOR UPDATE
AS
    DECLARE @IDPRODUTO INT
    DECLARE @PRODUTO VARCHAR(30)
    DECLARE @CATEGORIA VARCHAR(10)
    DECLARE @PRECO NUMERIC(10,2)
    DECLARE @PRECONOVO NUMERIC(10,2)
    DECLARE @DATAPROD DATETIME
    DECLARE @USUARIO VARCHAR(30)
    DECLARE @ACAO VARCHAR(100)