/*
Jonatas Venancio     RA: N4581B6      4º Semestre Ciências da Computação
*/

create database Empresa;
go

drop table if exists TB_departamento;
go
drop table if exists TB_Funcionario;
go
drop table if exists TB_Cadastro;
go

create table TB_departamento (
	ID_departamento int primary key identity (1,1),
	Ds_departamento varchar(30),
	Ds_abreviacao varchar(2),
);
go

create table TB_Funcionario (
	ID_Funcionario int primary key identity (1,1),
	NM_Funcionario varchar(30),
	DT_nascimento varchar(10),
	DS_sexo varchar(10),
);
go

create table TB_Cadastro (
	ID_cadastro int primary key identity (1,1),
	ID_Funcionario int,
	ID_Departamento int,
	VL_salario varchar(10),
	DT_Contratacao varchar(10)
	foreign key (ID_Funcionario) references TB_Funcionario (ID_Funcionario),
	foreign key (ID_Departamento) references TB_departamento (ID_departamento)
);
go

insert into TB_Funcionario (NM_Funcionario,DT_nascimento,DS_sexo) values ('Jonatas Venancio','02-03-2001','Masculino');
insert into TB_departamento (Ds_departamento,Ds_abreviacao) values ('Tecnologia da informacao','TI');
insert into TB_Cadastro (ID_Funcionario,ID_Departamento,VL_salario,DT_Contratacao) values (1,1,'957,90','24-08-2020')

select * from TB_Funcionario;
select * from TB_departamento;
select * from TB_Cadastro;