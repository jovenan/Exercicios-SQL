/*
Curso      : Ciencia da Computação 3º sem
Disciplina : Banco de Dados
Nome       : Jonatas Venancio
*/

/*exercicio A*/

DROP TABLE IF EXISTS TB_Correntista
go
DROP TABLE IF EXISTS TB_Agencia
go
DROP TABLE IF EXISTS TB_ContaCorrente
go

Create table TB_Correntista
(
	Id_Correntista int primary key identity (10,1),
	Nm_Correntista varchar (50),
	Nr_Telefone Numeric (11),
	Nr_Cpf Numeric (11),
);
go

Create table TB_Agencia
(
	Nr_Agencia int primary key identity (100,10),
	Nm_Agencia varchar (20),
);
go

Create table TB_ContaCorrente
(
	Nr_ContaCorrente int primary key identity (200000,1),
	Vl_saldo Numeric (10,2),
	Id_Correntista int,
	Nr_Agencia int,
	Foreign key (Id_Correntista) references TB_Correntista (Id_Correntista),
	Foreign key (Nr_Agencia) references TB_Agencia (Nr_Agencia)
);
go

insert into TB_Correntista (Nm_Correntista, Nr_Telefone, Nr_Cpf) values ('jonatas', '15998377848','12345679801')
insert into TB_Correntista (Nm_Correntista, Nr_Telefone, Nr_Cpf) values ('Beatriz', '15998377586','13545679801')
insert into TB_Correntista (Nm_Correntista, Nr_Telefone, Nr_Cpf) values ('Carlos', '15998874848','12336579801')
insert into TB_Correntista (Nm_Correntista, Nr_Telefone, Nr_Cpf) values ('Jorge', '15998152148','12658798013')
insert into TB_Correntista (Nm_Correntista, Nr_Telefone, Nr_Cpf) values ('Valdecir', '15998165891','13654798014')
insert into TB_Correntista (Nm_Correntista, Nr_Telefone, Nr_Cpf) values ('Lucia', '15998145634','12985398015')
insert into TB_Correntista (Nm_Correntista, Nr_Telefone, Nr_Cpf) values ('Isabela', '15985481448','12658784518')
insert into TB_Correntista (Nm_Correntista, Nr_Telefone, Nr_Cpf) values ('Samuel', '15998152452','12658765812')
insert into TB_Correntista (Nm_Correntista, Nr_Telefone, Nr_Cpf) values ('Evelin', '15991221448','14558798014')
insert into TB_Correntista (Nm_Correntista, Nr_Telefone, Nr_Cpf) values ('Shemue', '15998155648','12658548069')

insert into TB_Agencia (Nm_Agencia) values ('São Paulo')
insert into TB_Agencia (Nm_Agencia) values ('Rio de Janeiro')
insert into TB_Agencia (Nm_Agencia) values ('Espirito Santo')
insert into TB_Agencia (Nm_Agencia) values ('Bahia')
insert into TB_Agencia (Nm_Agencia) values ('Amazonas')

insert into TB_ContaCorrente (Id_Correntista, Vl_Saldo, Nr_Agencia) values (10, 2500, 100)
insert into TB_ContaCorrente (Id_Correntista, Vl_Saldo, Nr_Agencia) values (11,-300, 110)
insert into TB_ContaCorrente (Id_Correntista, Vl_Saldo, Nr_Agencia) values (12, 27500, 120)
insert into TB_ContaCorrente (Id_Correntista, Vl_Saldo, Nr_Agencia) values (13, 21500, 120)
insert into TB_ContaCorrente (Id_Correntista, Vl_Saldo, Nr_Agencia) values (14, 300000, 140)
insert into TB_ContaCorrente (Id_Correntista, Vl_Saldo, Nr_Agencia) values (15, -10500, 130)
insert into TB_ContaCorrente (Id_Correntista, Vl_Saldo, Nr_Agencia) values (16, -89, 100)
insert into TB_ContaCorrente (Id_Correntista, Vl_Saldo, Nr_Agencia) values (17, 500, 110)
insert into TB_ContaCorrente (Id_Correntista, Vl_Saldo, Nr_Agencia) values (18, 200, 140)
insert into TB_ContaCorrente (Id_Correntista, Vl_Saldo, Nr_Agencia) values (19, -900, 100)

select * from TB_Correntista
select * from TB_Agencia
select * from TB_ContaCorrente

/*exercicio B*/

DROP TABLE IF EXISTS TB_Correntista
go
DROP TABLE IF EXISTS TB_Agencia
go
DROP TABLE IF EXISTS TB_ContaCorrente
go
DROP TABLE IF EXISTS TB_ContaCorrenteAgencia
go

Create table TB_Correntista
(
	Id_Correntista int primary key identity (10,1),
	Nm_Correntista varchar (50),
	Nr_Telefone Numeric (11),
	Nr_Cpf Numeric (11),
);
go

Create table TB_ContaCorrente
(
	Nr_ContaCorrente int primary key identity(200000,1),
	Vl_Saldo Numeric (10,2),
);
go

Create table TB_Agencia
(
	Nr_Agencia int primary key identity (100,10),
	Nm_Agencia varchar (20),
);
go

Create table TB_ContaCorrenteAgencia
(
	Nr_ContaCorrente int,
	Nr_Agencia int,
	Id_Correntista int,
	Primary key (Nr_ContaCorrente,Nr_Agencia),
	Foreign key (Nr_ContaCorrente) references TB_ContaCorrente (Nr_ContaCorrente),
	Foreign key (Nr_Agencia) references TB_Agencia (Nr_Agencia),
	Foreign key (Id_Correntista) references TB_Correntista (Id_Correntista),
);
go

insert into TB_Correntista (Nm_Correntista, Nr_Telefone, Nr_Cpf) values ('Baltazar', '15998377848','12345679801')
insert into TB_Correntista (Nm_Correntista, Nr_Telefone, Nr_Cpf) values ('Barbara', '15998377586','13545679801')
insert into TB_Correntista (Nm_Correntista, Nr_Telefone, Nr_Cpf) values ('Carlos', '15998874848','12336579801')
insert into TB_Correntista (Nm_Correntista, Nr_Telefone, Nr_Cpf) values ('Leonardo', '15998152148','12658798013')
insert into TB_Correntista (Nm_Correntista, Nr_Telefone, Nr_Cpf) values ('Valdecir', '15998165891','13654798014')
insert into TB_Correntista (Nm_Correntista, Nr_Telefone, Nr_Cpf) values ('Valter', '15998145634','12985398015')
insert into TB_Correntista (Nm_Correntista, Nr_Telefone, Nr_Cpf) values ('Ruberlei', '15985481448','12658784518')
insert into TB_Correntista (Nm_Correntista, Nr_Telefone, Nr_Cpf) values ('Valdir', '15998152452','12658765812')
insert into TB_Correntista (Nm_Correntista, Nr_Telefone, Nr_Cpf) values ('João', '15991221448','14558798014')
insert into TB_Correntista (Nm_Correntista, Nr_Telefone, Nr_Cpf) values ('Marcos', '15998155648','12658548069')

insert into TB_Agencia (Nm_Agencia) values ('Roraima')
insert into TB_Agencia (Nm_Agencia) values ('Pernambuco')
insert into TB_Agencia (Nm_Agencia) values ('Rio Grande do Sul')
insert into TB_Agencia (Nm_Agencia) values ('Amapa')
insert into TB_Agencia (Nm_Agencia) values ('Acre')

insert into TB_ContaCorrente (Vl_Saldo) values (1500)
insert into TB_ContaCorrente (Vl_Saldo) values (1200)
insert into TB_ContaCorrente (Vl_Saldo) values (200)
insert into TB_ContaCorrente (Vl_Saldo) values (800)
insert into TB_ContaCorrente (Vl_Saldo) values (3500)
insert into TB_ContaCorrente (Vl_Saldo) values (4000)
insert into TB_ContaCorrente (Vl_Saldo) values (1250)
insert into TB_ContaCorrente (Vl_Saldo) values (5500)
insert into TB_ContaCorrente (Vl_Saldo) values (6500)
insert into TB_ContaCorrente (Vl_Saldo) values (3000)

insert into TB_ContaCorrenteAgencia (Nr_ContaCorrente,Nr_Agencia,Id_Correntista) values (200000,100,10)
insert into TB_ContaCorrenteAgencia (Nr_ContaCorrente,Nr_Agencia,Id_Correntista) values (200001,110,11)
insert into TB_ContaCorrenteAgencia (Nr_ContaCorrente,Nr_Agencia,Id_Correntista) values (200002,120,12)
insert into TB_ContaCorrenteAgencia (Nr_ContaCorrente,Nr_Agencia,Id_Correntista) values (200003,130,14)
insert into TB_ContaCorrenteAgencia (Nr_ContaCorrente,Nr_Agencia,Id_Correntista) values (200004,110,15)
insert into TB_ContaCorrenteAgencia (Nr_ContaCorrente,Nr_Agencia,Id_Correntista) values (200005,140,16)
insert into TB_ContaCorrenteAgencia (Nr_ContaCorrente,Nr_Agencia,Id_Correntista) values (200006,120,17)
insert into TB_ContaCorrenteAgencia (Nr_ContaCorrente,Nr_Agencia,Id_Correntista) values (200007,140,18)
insert into TB_ContaCorrenteAgencia (Nr_ContaCorrente,Nr_Agencia,Id_Correntista) values (200008,100,19)
insert into TB_ContaCorrenteAgencia (Nr_ContaCorrente,Nr_Agencia,Id_Correntista) values (200009,110,13)

select * from TB_Correntista
select * from TB_Agencia
select * from TB_ContaCorrente
select * from TB_ContaCorrenteAgencia

/*exercicio C*/

DROP TABLE IF EXISTS TB_Ator
go
DROP TABLE IF EXISTS TB_Filme
go
DROP TABLE IF EXISTS TB_FilmeAtor
go

Create table TB_Ator
(
	Id_Ator int primary key identity (1,1),
	Nm_Ator varchar (50),
);

Create table TB_Filme
(
	Id_Filme int primary key identity (1,1),
	Nm_TituloOriginal varchar (30),
	Nm_TituloBrasil varchar (30),
	Nr_AnoLancamento numeric,
);

Create table TB_FilmeAtor
(
	Id_Ator int,
	Id_Filme int,
	Primary Key(Id_Ator,Id_Filme),
	Foreign key (Id_Ator) references TB_Ator (Id_Ator),
	Foreign key (Id_Filme) references TB_Filme (Id_Filme),
);

insert into TB_Ator (Nm_Ator) values ('Will Smith');
insert into TB_Ator (Nm_Ator) values ('Jaden Smith');
insert into TB_Ator (Nm_Ator) values ('Ryan Reynalds');
insert into TB_Ator (Nm_Ator) values ('Chris Hemsworth');
insert into TB_Ator (Nm_Ator) values ('Robert Downey Jr.');
insert into TB_Ator (Nm_Ator) values ('Brie Larson');

insert into TB_Filme (Nm_TituloOriginal,Nm_TituloBrasil,Nr_AnoLancamento) values ('Bad Boys','Os Bad Boys',1995);
insert into TB_Filme (Nm_TituloOriginal,Nm_TituloBrasil,Nr_AnoLancamento) values ('I Am Legend','Eu sou a Lenda',2007);
insert into TB_Filme (Nm_TituloOriginal,Nm_TituloBrasil,Nr_AnoLancamento) values ('Deadpool','Deadpool',2016);
insert into TB_Filme (Nm_TituloOriginal,Nm_TituloBrasil,Nr_AnoLancamento) values ('Avengers: EndGame','Vingadores: Ultimato',2019);
insert into TB_Filme (Nm_TituloOriginal,Nm_TituloBrasil,Nr_AnoLancamento) values ('Thor: Ragnarok','Thor: Ragnarok',2017);
insert into TB_Filme (Nm_TituloOriginal,Nm_TituloBrasil,Nr_AnoLancamento) values ('The Karate Kid','Karate Kid',2010);
insert into TB_Filme (Nm_TituloOriginal,Nm_TituloBrasil,Nr_AnoLancamento) values ('The Pursuit of Happyness','A procura da Felicidade',2006);
insert into TB_Filme (Nm_TituloOriginal,Nm_TituloBrasil,Nr_AnoLancamento) values ('Captain Marvel','Capitã Marvel',2019);

insert into TB_FilmeAtor (Id_Ator,Id_Filme) values (1,1);
insert into TB_FilmeAtor (Id_Ator,Id_Filme) values (1,2);
insert into TB_FilmeAtor (Id_Ator,Id_Filme) values (1,7);
insert into TB_FilmeAtor (Id_Ator,Id_Filme) values (2,6);
insert into TB_FilmeAtor (Id_Ator,Id_Filme) values (2,7);
insert into TB_FilmeAtor (Id_Ator,Id_Filme) values (3,3);
insert into TB_FilmeAtor (Id_Ator,Id_Filme) values (4,4);
insert into TB_FilmeAtor (Id_Ator,Id_Filme) values (4,5);
insert into TB_FilmeAtor (Id_Ator,Id_Filme) values (5,4);
insert into TB_FilmeAtor (Id_Ator,Id_Filme) values (6,4);
insert into TB_FilmeAtor (Id_Ator,Id_Filme) values (6,8);

Select * from TB_Ator
Select * from TB_Filme
Select * from TB_FilmeAtor
