/* STORED PROCEDURES -> BLOCOS DE NOTAÇÕES QUE FICAM ARMAZENADOS */

DELIMITER $

CREATE PROCEDURE NOME()
BEGIN 
QUALQUER COISA;
END
$

/* CHAMADA PROCEDURE */
DELIMITER ;

CALL NOME();

DROP PROCEDURE NOME;

/* PROCEDURES COM PARAMETROS */
DELIMITER $

CREATE PROCEDURE CONTA()
BEGIN SELECT 10 + 10 AS CONTA;
END
$

CREATE PROCEDURE CALCULA(NUMERO1 INT, NUMERO2 INT)
BEGIN
SELECT NUMERO1 + NUMERO2 AS CONTA;
END
$





