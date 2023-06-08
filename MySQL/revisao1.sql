USE exemplo;

select * from cliente;

	ALTER TABLE cliente CHANGE SEXO GENERO VARCHAR(10);
/*  alterar tabela cliente mudando o sexo para genero sendo varchar(10). Nessa você precisa passar o nome da coluna para ser alterado. 
caso não queira alterar, é necessário digitar duas vezes, porque ele altera de qualquer jeito.*/

	ALTER TABLE cliente CHANGE CPF CPF VARCHAR(15) NOT NULL;
/*	Nome da coluna digitado duas vezes pois não queria alterar o nome. Ele fez a alteração de CPF para CPF. */

	ALTER TABLE cliente MODIFY ENDERECO VARCHAR(60) NOT NULL;
/*	Altera só o necessário */

	ALTER TABLE cliente ADD PROFISSAO VARCHAR(15) NOT NULL;
/* Adiciona uma coluna na tabela. */

	ALTER TABLE cliente DROP EMAIL;
/*	Dropa uma coluna na tabela. */    
    
    ALTER TABLE cliente ADD COLUMN PESO FLOAT(14,2) NOT NULL AFTER GENERO;
/* Vai adicionar uma coluna depois do Genero. */

	ALTER TABLE cliente ADD COLUMN HOBBU VARCHAR(25) NOT NULL FIRST;
/* Vai adicionar como primeiro item. */

SELECT * FROM cliente;
INSERT INTO cliente (NOME, GENERO, PESO, EMAIL, CPF, TELEFONE, ENDERECO, PROFISSAO) VALUES('Magda', 'FEM', 45.3, 'magda@gmail.com', '123456987', '1234569','rua 76, numero 4 vr', 'veteri');

UPDATE cliente SET PROFISSAO = 'VET' 
WHERE NOME = 'Magda';

SELECT COUNT(*) AS QUANTIDADE, GENERO FROM cliente GROUP BY GENERO;


    