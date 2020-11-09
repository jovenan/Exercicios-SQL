create database Univesidade

create table Professores (
matricula int primary key,
nome varchar(40) not null,
RG int unique ,
sexo char(1) check(sexo in ('M','F')),
idade tinyint check(idade between 21 and 80),
titulacao varchar(15) check(titulacao in ('graduado','especialista', 'mestre', 'doutor')),
categoria varchar(15) check(categoria in ('auxiliar','assistente', 'adjunto', 'titular')),
nroTurmas tinyint check(nroTurmas >= 0))

create table cursos(
	codigo int primary key,
	nome varchar(40) not null,
	duracao int check(duracao between 4 and 12),
	matricula int,
	foreign key (matricula) references Professores (matricula)
)

create table disciplinas (
	codigo int primary key,
	nome varchar(40) not null,
	creditos int check(creditos between 2 and 8)
)

create table curriculos (
	curso int,
	disciplinas int,
	fase int check(fase between 1 and 12),
	foreign key (curso) references cursos (codigo),
	foreign key (disciplinas) references disciplinas (codigo)
)

create table turmas (
	codigo int primary key,
	vagas int check(vagas > 0),
	matricula int,
	foreign key (matricula) references professores (matricula)
)
