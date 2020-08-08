DROP TABLE IF EXISTS TB_clientePF
go
drop table if exists TB_uf
go

Create table TB_uf
(
	ID_uf int primary key Identity (1,1),
	Ds_uf varchar (2),
)

CREATE TABLE TB_clientePF
(
	ID_cliente int primary key Identity(1,1),
	Nm_cliente varchar (45),
	Nr_cpf varchar (11),
	ID_uf int,
	Vl_TotalCompra Decimal (10,2),
	Dt_ultimaCompra date,
	Foreign Key (ID_uf) References TB_uf (ID_uf),
);
go

Insert into TB_uf(Ds_uf) values ('RJ')

Insert into TB_clientePF (Nm_cliente,Nr_cpf,ID_uf,Vl_TotalCompra) values ('Joao','3292554230','1','42')
go

Select * from TB_uf
select * from TB_clientePF

select * from TB_clientePF
order by Nm_cliente

Select Nm_cliente from TB_clientePF 
where Dt_ultimaCompra IS NULL 

Select Nm_cliente from TB_clientePF
where Vl_TotalCompra = 0

Select Nm_cliente from TB_clientePF
Where Dt_ultimaCompra = Getdate()

Select Nm_cliente from TB_clientePF
Where Dt_ultimaCompra between '2019-01-01' and '2020-05-10'

Select Nm_cliente from TB_clientePF where ID_uf = '1' and Vl_TotalCompra > 30

Select TB_clientePF.Nm_cliente,TB_clientePF.Nr_cpf from TB_clientePF 

Select Nm_cliente,Ds_uf FROM TB_clientePF C INNER JOIN TB_uf U ON C.ID_uf = U.ID_uf