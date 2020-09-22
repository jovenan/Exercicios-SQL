create database vendaingressos;
use vendaingressos;

create table usuario(
usu_codigo int not null,
usu_nome varchar(30),
usu_email varchar(30),
usu_cpf varchar(10));

create table categoria(
cat_codigo int not null,
cat_descricao varchar(30));

create table integrantes(
int_codigo int not null,
int_nome varchar(30),
int_funcao varchar(30));

create table tipo_ambiente(
tpa_codigo int not null,
tpa_descricao varchar(30));

create table setor(
set_codigo int not null,
set_descricao varchar(30));

create table evento(
eve_codigo int primary key not null,
eve_descricao varchar(30),
eve_data datetime,
eve_resumo varchar(200),
eve_imagem varchar(6),
eve_cat_codigo int,
eve_int_codigo int);

create table ingresso(
ing_codigo int not null,
ing_eve_codigo int,
ing_valor varchar(10),
ing_tipo char(1));

create table ambiente(
amb_codigo int not null,
amb_eve_codigo int,
amb_descricao varchar(30),
amb_set_codigo int,
amb_local varchar(30),
amb_referencia varchar(30),
amb_tpa_codigo int);

create table compra(
com_codigo int not null,
com_usu_codigo int,
com_ing_codigo int,
com_data datetime,
com_total varchar(10),
com_quantidade int);


alter table usuario add primary key (usu_codigo)
alter table categoria add primary key (cat_codigo)
alter table integrantes add primary key (int_codigo)
alter table tipo_ambiente add primary key (tpa_codigo)
alter table setor add primary key (set_codigo)
alter table evento add primary key (eve_codigo)
alter table ingresso add primary key (ing_codigo)
alter table ambiente add primary key (amb_codigo)
alter table compra add primary key (com_codigo)

alter table evento add constraint eve_cat_codigo foreign key (eve_cat_codigo) references categoria (cat_codigo)
alter table evento add constraint eve_int_codigo foreign key (eve_int_codigo) references integrantes (int_codigo)
alter table ingresso add constraint ing_eve_codigo foreign key (ing_eve_codigo) references evento (eve_codigo)
alter table ambiente add constraint amb_eve_codigo foreign key (amb_eve_codigo) references evento (eve_codigo)
alter table ambiente add constraint amb_set_codigo foreign key (amb_eve_codigo) references setor (set_codigo)
alter table ambiente add constraint amb_tpa_codigo foreign key (amb_tpa_codigo) references tipo_ambiente (tpa_codigo)
alter table compra add constraint com_usu_codigo foreign key (com_usu_codigo) references usuario (usu_codigo)
alter table compra add constraint com_ing_codigo foreign key (com_ing_codigo) references ingresso (ing_codigo)

alter table ambiente alter column amb_referencia int

alter table evento drop column eve_resumo

