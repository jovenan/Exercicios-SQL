
Insert Into TB_NotaFiscal(Vl_Total) Values (55);

Select * from TB_NotaFiscal


CREATE TABLE TB_CLIENTE 
(
	ID_Cliente Int Primary Key Identity (1,1),
	Nm_Cliente char (45),
	Ds_endereco varchar (100),
	Nr_Telefone numeric (11),
	Nr_Celular numeric (11)
)

Insert Into TB_CLIENTE(Nm_Cliente, Ds_endereco, Nr_Telefone, Nr_Celular) Values ('jonatas','Rua Floriano Peixoto, 955', 153225412, 1599854);
Insert Into TB_CLIENTE(Nm_Cliente, Ds_endereco, Nr_Telefone, Nr_Celular) Values ('joao','Rua Floriano peidxe, 910', 1532254122, 159985454);
Insert Into TB_CLIENTE(Nm_Cliente, Ds_endereco, Nr_Telefone, Nr_Celular) Values ('Gabriel','Avenida Fernando Steca, 615', 153225800, 1599456);
Insert Into TB_CLIENTE(Nm_Cliente, Ds_endereco, Nr_Telefone, Nr_Celular) Values ('Bea','Rua lindoia, 457', 153225891, 1599124);
Insert Into TB_CLIENTE(Nm_Cliente, Ds_endereco, Nr_Telefone, Nr_Celular) Values ('Rafa','Rua Floriano Peixoto, 941', 15324112, 159851); 

Select * From TB_CLIENTE

Drop Table TB_NotaFiscal;

CREATE TABLE TB_NotaFiscal 
(
	Nr_NotaFiscal Int Primary key Identity (1000,1),
	ID_Cliente Int,
	Vl_Total Decimal(10,2),
	Foreign Key (ID_Cliente) References TB_CLIENTE (ID_Cliente)
);

Insert Into TB_NotaFiscal(ID_Cliente, Vl_Total) Values (5999, 456);

Select * from TB_NotaFiscal