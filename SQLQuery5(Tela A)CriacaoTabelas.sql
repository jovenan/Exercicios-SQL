drop table if exists TB_Empresa
go
drop table if exists TB_Banco
go
drop table if exists TB_Agencia
go
drop table if exists TB_Conta
go

Create table TB_Empresa
(
	Id_Empresa int primary key identity (1,1),
	Nm_Empresa varchar (200),
);
go

Create table TB_Banco
(
	Id_Banco int primary key identity (1,1),
	Nm_Banco varchar (100),
);
go

Create table TB_Agencia
(
	Nr_Agencia int primary key identity (1,1),
	Id_banco int,
	Nm_Agencia varchar (20),
	Foreign key (Id_Banco) references TB_Banco (Id_banco),
);
go

Create table TB_Conta
(
	Nr_Conta int identity (1,1),
	Nr_Agencia int,
	Id_Banco int,
	Id_empresa int,
	Vl_Saldo Decimal (12,2),
	Primary key (Nr_Conta,Nr_Agencia,Id_Banco),
	Foreign key (Nr_Agencia) references TB_Agencia (Nr_Agencia),
	Foreign key (Id_Banco) references TB_Banco (Id_banco),
	Foreign key (Id_Empresa) references TB_Empresa (Id_Empresa),
);
go



 Drop table if exists TB_Fornecedor
 go

 Drop table if exists TB_PlanoConta
 go

 Drop table if exists TB_Produto
 go

 Drop table if exists TB_PedidoCompra
 go

 Drop table if exists TB_PedidoCompraItem
 go


 Create table TB_Fornecedor
 (
	Id_Fornecedor int primary key identity (1,1),
	Nm_Fornecedor varchar (100),
 );
 go

 Create table TB_PlanoConta
 (
	Id_PlanoConta int primary key identity (1,1),
	Ds_PlanoConta varchar (100),
 );
 go

Create table TB_Produto
(
	Id_Produto int primary key identity (1,1),
	Nm_Produto varchar (100),
	Vl_Unitario decimal (12,2),
	Vl_IPIPorc decimal (6,2),
);
go

Create table TB_PedidoCompra 
(
	Nr_PedidoCompra int primary key identity (1,1),
	Id_fornecedor int,
	Id_PlanoConta int,
	Dt_Pedido date,
	Dt_Prevista date,
	Ds_CondPagamento varchar (20),
	Vl_SubTotal decimal (12,2),
	Vl_DescPorc decimal (6,2),
	Vl_TotalIPI decimal (6,2),
	Vl_TotalPedido decimal (12,2),
	Foreign key (Id_fornecedor) references TB_fornecedor (Id_fornecedor),
	Foreign key (Id_PlanoConta) references TB_PlanoConta (Id_PlanoConta),
);
go

Create table TB_PedidoCompraItem
(
	Nr_PedidoCompra int,
	Id_Produto int,
	Vl_Quantidade numeric (10),
	Vl_IPIPorc decimal (6,2),
	Vl_Unitario decimal (12,2),
	Vl_TotalPedido decimal (12,2),
	Primary key (Nr_PedidoCompra,Id_Produto),
);
go