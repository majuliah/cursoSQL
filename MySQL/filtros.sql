show databases;
use exemplo;
use projeto;
										/*   FILTROS   */
                                        
/* Filtro faz o filtro em nível de registro */
SELECT NOME, SEXO FROM CLIENTE WHERE SEXO = 'M';

/* Utilizando like -> caractere coringa */
SELECT NOME, SEXO FROM CLIENTE WHERE ENDERECO LIKE '%RJ'; /*no final*/
SELECT NOME, SEXO FROM CLIENTE WHERE ENDERECO LIKE 'SP%'; /*no começo*/
SELECT NOME, SEXO FROM CLIENTE WHERE ENDERECO LIKE '%SC%'; /*em qualquer lugar*/
SELECT NOME, SEXO FROM CLIENTE WHERE ENDERECO LIKE '%__MG__%'; /*com 2 caracteres antes e dois depois*/



