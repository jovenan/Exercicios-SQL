DROP TABLE IF EXISTS TB_Funcionario
go
DROP TABLE IF EXISTS TB_Departamento
go

CREATE TABLE TB_Departamento
(
	ID_Departamento int primary key identity (1,1),
	Nm_departamento varchar (20),
	Ds_abreviacao varchar (2),
)

CREATE TABLE TB_Funcionario
( 
	ID_funcionario int primary key identity (1,1),
	Nm_funcionario varchar (40),
	Vl_salario decimal (10,2),
	Dt_admissao date,
	Dt_demissao date,
	Vl_bolsaAuxilio decimal(10,2),
	ID_Departamento int,
	foreign key (ID_Departamento) references TB_Departamento (ID_Departamento)
)

SELECT NAME FROM SYSOBJECTS WHERE XTYPE='U'

INSERT INTO TB_Departamento(Nm_departamento,Ds_abreviacao) VALUES ('Recursos humanos', 'RH')
INSERT INTO TB_Departamento(Nm_departamento,Ds_abreviacao) VALUES ('Dep. TI', 'DT')
INSERT INTO TB_Departamento(Nm_departamento,Ds_abreviacao) VALUES ('Dep. Financeiro', 'DF')

INSERT INTO TB_Funcionario(Nm_funcionario,Vl_salario,Dt_admissao,Dt_demissao,Vl_bolsaAuxilio,ID_Departamento) VALUES ('Jonatas', 3000, '02/03/2020', NULL, 200, 2)
INSERT INTO TB_Funcionario(Nm_funcionario,Vl_salario,Dt_admissao,Dt_demissao,Vl_bolsaAuxilio,ID_Departamento) VALUES ('Beatriz', 4500, '12/03/2020', NULL, 200, 1)
INSERT INTO TB_Funcionario(Nm_funcionario,Vl_salario,Dt_admissao,Dt_demissao,Vl_bolsaAuxilio,ID_Departamento) VALUES ('Berenice', 1300, '05/03/2020', '06/03/2020', 200, 1)

SELECT * from TB_Departamento
SELECT * from TB_Funcionario

SELECT Nm_funcionario FROM TB_Funcionario order by Nm_funcionario

SELECT Nm_funcionario FROM TB_Funcionario where Dt_demissao = NULL

SELECT Nm_funcionario FROM TB_Funcionario where Dt_admissao > '01/01/2020'

SELECT Nm_funcionario, Vl_salario from TB_Funcionario where Vl_salario > '1499'


SELECT Nm_funcionario, Ds_abreviacao from TB_Funcionario F inner join TB_Departamento D on F.ID_Departamento = D.ID_Departamento

SELECT Nm_funcionario, DATEDIFF(DAY, Dt_admissao, Dt_demissao) as Tempo from TB_Funcionario where Dt_demissao is not NULL;

SELECT Nm_funcionario, DATEDIFF(DAY, Dt_admissao, GETDATE()) as Tempo from TB_Funcionario where Dt_demissao is NULL;

SELECT Nm_funcionario, Vl_salario, Dt_admissao, Dt_demissao, Vl_bolsaAuxilio, Nm_departamento, Ds_abreviacao from TB_Funcionario F inner join TB_Departamento D on F.ID_Departamento = D.ID_Departamento


/*o Update faz atualizacao em um campo desejado no Banco*/

Update TB_Funcionario set Vl_salario = 14000, Vl_bolsaAuxilio = 350 where ID_funcionario = 2;

/*dar aumento de 10% para todos*/

update TB_Funcionario set Vl_salario = Vl_salario * 1.10 where ID_Departamento = 1


/*
Faz deletar os campos onde o where é correspondido

obs: se nao tiver where ele deletara todos os dados da tabela
*/
delete from TB_Funcionario where ID_funcionario = 3;

