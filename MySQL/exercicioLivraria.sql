CREATE DATABASE LIVRARIA;

CREATE TABLE LIVROS(
NOMELIVRO VARCHAR(30),
NUMEROPAGINAS INT(10),
ANOPUBLICACAO INT(10),
VALORLIVRO FLOAT(10,2),
NOMEAUTOR VARCHAR(30),
SEXTOAUTOR CHAR(1),
NOMEEDITORA VARCHAR(30),
ESTADOEDITORA CHAR(2)
);

SHOW TABLES;
DESC LIVROS;

INSERT INTO LIVROS(NOMELIVRO, NUMEROPAGINAS, ANOPUBLICACAO, VALORLIVRO, NOMEAUTOR, SEXTOAUTOR, NOMEEDITORA, ESTADOEDITORA) 
VALUES('Copas Inesquecíveis',200,2018,130.98, 'Marco Alcantra', 'M', 'Larson', 'RS'), ('O poder da mente',120,2017,56.58, 'Clara Mafra', 'F', 'Continental', 'SP');

/*QUERYS*/

/* Trazer todos os dados*/
SELECT * FROM LIVROS;

/* Trazer os nomes dos livros e o nome das editoras*/
SELECT NOMELIVRO AS NomeDoLivro, NOMEEDITORA AS NomeEditora FROM LIVROS; 

/* Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino*/
SELECT NOMELIVRO AS NomeDoLivro, ESTADOEDITORA AS EstadoLivro FROM LIVROS WHERE SEXTOAUTOR = 'M';

/* Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo Feminino */
SELECT NOMELIVRO AS NomeDoLivro, NUMEROPAGINAS AS NumeroPaginas FROM LIVROS WHERE SEXTOAUTOR = 'F';

/* Valores dos livros do estado de SP */
SELECT VALORLIVRO AS ValorLivro FROM LIVROS WHERE ESTADOEDITORA = 'SP';

/*Todos os dados dos autores do sexo masculino que tiveram livros publicados em SP ou RJ*/
SELECT * FROM LIVROS WHERE SEXTOAUTOR = 'M' AND (ESTADOEDITORA = 'SP' OR ESTADOEDITORA = 'RJ');