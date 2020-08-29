/*
AtividadeScripGeral

Jonatas Venancio      turma: cc3q17
*/

drop table if exists TB_Cliente;
go
drop table if exists TB_Produto;
go

create table TB_Cliente 
(
	Id_Cliente int primary key identity (1,1),
	Nm_Cliente varchar (20),
	Id_UF varchar (2),
	Nr_Telefone numeric (10),
	Nr_Celular numeric (10),
);
go

create table TB_Produto
(
	Id_Produto int primary key identity (321,1),
	Ds_Produto varchar (100),
	Pr_Venda decimal (38,2),
	Pr_Compra decimal (38,2),
	Qt_Estoque decimal (38,1)
);
go

Insert into TB_Cliente(Nm_Cliente, Id_UF, Nr_Telefone, Nr_Celular) values ('JOAO','SP',1155880101,1198800101);
Insert into TB_Cliente(Nm_Cliente, Id_UF, Nr_Telefone, Nr_Celular) values ('MARIA','MG',1155880202,1198800202);
Insert into TB_Cliente(Nm_Cliente, Id_UF, Nr_Telefone, Nr_Celular) values ('MARCOS','BA',1155880303,1198800303);
Insert into TB_Cliente(Nm_Cliente, Id_UF, Nr_Telefone, Nr_Celular) values ('ANTONIO','SP',1155880404,1198800404);
Insert into TB_Cliente(Nm_Cliente, Id_UF, Nr_Telefone, Nr_Celular) values ('GABRIELA','RJ',1155880505,1198800505);

Select Id_Cliente,Nm_Cliente, Id_UF, Nr_Telefone, Nr_Celular from TB_Cliente

Insert into TB_Produto(Ds_Produto,Pr_Venda,Pr_Compra,Qt_Estoque) values ('MONITOR LCD LG',430,300,4);
Insert into TB_Produto(Ds_Produto,Pr_Venda,Pr_Compra,Qt_Estoque) values ('MONITOR LCD SAMSUNG',450,350,1);
Insert into TB_Produto(Ds_Produto,Pr_Venda,Pr_Compra,Qt_Estoque) values ('IMPRESSORA EPSON',800,500,4);
Insert into TB_Produto(Ds_Produto,Pr_Venda,Pr_Compra,Qt_Estoque) values ('GRAVADOR EXTERNO DVD SAMSUNG USB',100,80,15);
Insert into TB_Produto(Ds_Produto,Pr_Venda,Pr_Compra,Qt_Estoque) values ('PENDRIVE 16GB',15,4,1250);
Insert into TB_Produto(Ds_Produto,Pr_Venda,Pr_Compra,Qt_Estoque) values ('PENDRIVE 64GB',30,15,1050);
Insert into TB_Produto(Ds_Produto,Pr_Venda,Pr_Compra,Qt_Estoque) values ('PENDRIVE 128GB',55,25,520);
Insert into TB_Produto(Ds_Produto,Pr_Venda,Pr_Compra,Qt_Estoque) values ('IMPRESSORA HP',600,450,2);



Drop table if exists TB_NF;
go
Drop table if exists TB_NFItem;
go

create table TB_NF
(
	Nr_NF int primary key identity (100101,1),
	Dt_NF date,
	Vl_NF decimal (38,2),
	Id_Cliente int,
);
go

create table TB_NFItem
(
	Nr_NFItem int primary key identity (1,1),
	Nr_NF int,
	Id_Produto int,
	Qt_vendida decimal (38,2),
	Pr_Unitario decimal (38,2),
	--Vl_SubTotal as Pr_Unitario * Qt_Vendida
	Vl_SubTotal decimal (38,2),
	foreign key (Nr_NF) references TB_NF(Nr_NF),
	foreign key (Id_Produto) references TB_Produto(Id_Produto),
);
go

Insert into TB_NF(Dt_NF,Vl_NF,Id_Cliente) values ('2011/04/01',250,1);
Insert into TB_NF(Dt_NF,Vl_NF,Id_Cliente) values ('2011/04/01',24,2);
Insert into TB_NF(Dt_NF,Vl_NF,Id_Cliente) values ('2011/04/03',160,3);
Insert into TB_NF(Dt_NF,Vl_NF,Id_Cliente) values ('2011/04/11',300,4);

select Nr_NF,Dt_NF,Vl_NF,Id_Cliente from TB_NF

insert into TB_NFItem(Nr_NF,Id_Produto,Qt_vendida,Pr_Unitario,Vl_SubTotal) values (100101,321,1,430,430);
insert into TB_NFItem(Nr_NF,Id_Produto,Qt_vendida,Pr_Unitario,Vl_SubTotal) values (100102,325,20,15,300);
insert into TB_NFItem(Nr_NF,Id_Produto,Qt_vendida,Pr_Unitario,Vl_SubTotal) values (100103,326,50,30,1500);
insert into TB_NFItem(Nr_NF,Id_Produto,Qt_vendida,Pr_Unitario,Vl_SubTotal) values (100103,324,1,100,100);
insert into TB_NFItem(Nr_NF,Id_Produto,Qt_vendida,Pr_Unitario,Vl_SubTotal) values (100104,323,1,800,800);

select Nr_NFItem,Nr_NF,Id_Produto,Qt_vendida,Pr_Unitario,Vl_SubTotal from TB_NFItem



/*exer1*/

Select Nr_NF,Dt_NF,Vl_NF,Id_Cliente From TB_NF Where Nr_NF = 100102

/*exer2*/

Update TB_Produto Set Pr_Venda = 600 Where Pr_Venda = 500;

/* nao alterou nenhum dado pois nao tem produto com Preco de venda igual a 500*/

/*exer3*/

Delete From TB_Cliente where Nm_Cliente = 'MARCOS';

/*exer4*/

Select Nr_Nf From TB_NF where Vl_NF > 160;

/*exer5*/

Update TB_NFItem Set Qt_vendida = 3, Vl_SubTotal = Qt_vendida * Pr_Unitario Where Nr_NF = 100102 And Id_Produto = 325;

/*exer6*/

Select Nm_Cliente From TB_Cliente Where Id_UF = 'SP';

/*exer7*/

Select Ds_Produto from TB_Produto where Ds_Produto Like '%DRIVE%';

/*exer8*/

Delete From TB_Cliente where Nm_Cliente Like 'G%';

/*exer9*/

Delete from TB_Produto where Id_Produto = 321;

/*nao apagou pois conflita com a Foreign key da TB_NFItem que usa essa ID*/

/*exer10*/

Delete From TB_NFItem where Nr_NF <> 100101 and  Nr_Nf <> 100103 and Nr_NF <> 100104 ;

/*exer11*/

Select Nr_NF From TB_NF Where Vl_NF >= 470;

/*exer12*/

Delete From TB_NF Where Vl_NF > 470;

/*exer13*/

Select Sum(Vl_Nf) as Vl_TotalVendas from TB_NF Where Id_Cliente = 1;

/*exer14*/

Select count(*) as Qt_Clientes From TB_Cliente Where Id_UF = 'MG';

/*exer15*/

Delete from TB_Produto Where Ds_Produto like '%HP%';

/*exer16*/

Select Ds_Produto From TB_Produto Where Ds_Produto like 'G%';

/*exer17*/

Delete From TB_Produto Where Pr_Venda between 1000 and 1500;

/*exer18*/

Update TB_Produto Set Pr_Venda = Pr_Compra * 1.15 where Id_Produto = 411;

/*exer19*/

Select Nr_NF from TB_Nf Where Nr_NF Like '%101%';

/*exer20*/

Delete From TB_NFItem Where Nr_NF = 100103;

/*exer21*/

Select N.Nr_Nf,Dt_Nf,Vl_NF, P.Id_Produto, Ds_Produto from TB_NFItem NI inner join TB_NF N on NI.Nr_NF = N.Nr_NF inner join TB_Produto P on NI.Id_Produto = P.Id_Produto;

/*exer22*/

Delete From TB_NF Where Nr_NF = 100103;

/*exer23*/

Select Nm_Cliente, Dt_NF, Vl_Nf From TB_NF N inner join TB_Cliente C on N.Id_Cliente = C.Id_Cliente;

/*exer24*/

Delete From TB_Cliente Where Nm_Cliente like '%ANTONIO%';

/*exer25*/

Select  Nm_Cliente,
		'(' + substring(cast(Nr_telefone as varchar),1,2) + ') ' +
		substring(cast(Nr_telefone as varchar),3,4) + '-' +
		substring(cast(Nr_telefone as varchar),7,4) as Nr_Telefone, 
		'(' + substring(cast(Nr_Celular as varchar),1,2) + ') ' +
		substring(cast(Nr_Celular as varchar),3,4) + '-' +
		substring(cast(Nr_Celular as varchar),7,4) as Nr_Celular From TB_Cliente ;


/*Atividades*/

Select Sum(Vl_Nf) as Vl_TotalNFs from TB_NF;

Select COUNT(*) as TotalDeClientes from TB_Cliente;

Select Sum(Qt_Estoque*Pr_Venda) as Previsao from TB_Produto;

Select Sum(Qt_Estoque*Pr_Venda) - sum(Qt_Estoque*Pr_Compra) as Previsao from TB_Produto where Ds_Produto like '%PENDRIVE%';
