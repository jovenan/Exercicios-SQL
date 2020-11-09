CREATE DATABASE estudo1;
USE estudo1;


CREATE TABLE tb_estado(
      est_id tinyint primary key,
      est_uf CHAR(2),
      est_nome CHAR(30)
);

DELIMITER && 
CREATE PROCEDURE sp_estado_inserir (
	IN var_id TINYINT,
	   var_uf CHAR(2),
	   var_nome CHAR(30))
      BEGIN 
	  REPLACE INTO tb_estado VALUES (var_id,var_uf,var_nome);
	  END
	  &&

call sp_estado_inserir(1, “SP”, “São Paulo”);



DELIMITER $$ 
     CREATE PROCEDURE sp_estado_listar(IN var_id TINYINT)
	 BEGIN
	 IF(var_id IS NULL) THEN 
	 SELECT est_id,est_nome,est_uf FROM tb_estado; 
	 ELSE
     SELECT est_id,est_nome,est_uf  FROM tb_estado where EST_ID=VAR_ID;	 
	 END IF;
	 END $$ 


CALL sp_estado_listar(null); 
CALL sp_estado_listar(1); 


DELIMITER $$ 
     CREATE PROCEDURE sp_estado_excluir(IN var_id TINYINT) 
	 BEGIN 
	 DELETE FROM tb_estado WHERE est_id = var_id; 
	 END $$ 


CALL sp_estado_excluir(1); 