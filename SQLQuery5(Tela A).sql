/*Atividade Tela A*/

/*Normalizacao*/

/*

TB_Empresa = primary key *Id_empresa // Nm_empresa 

TB_Banco = primary key *Id_Banco // Nm_banco 

TB_Agencia = primary key *Nr_Agencia / *Id_Banco // Nm_Agencia

TB_Conta = primary key *Nr_Conta/ *Nr_Agencia/ *Id_Banco // Id_empresa / Vl_Saldo

 */

 /*Atividade Tela B*/

 /*
 Nr_pedidoDeCompra
 Id_Fornecedor, nm_fornecedor
 Id_planoDeConta, Ds_planoDeConta
 Id_Produto, Nm_Produto, Vl_custoUnitario, Vl_Quantidade, Vl_IPIPorc, Vl_DescontoPorc, Vl_total
 Dt_PedidoCompra, Dt_prevista, Vl_subtotal, Vl_totalIPI,Vl_totalPedido
 Id_CondicaoPagamento, Ds_CondicaoPagamento


 TB_Fornecedor = *Id_Fornecedor // Nm_fornecedor

 TB_PlanoConta = *Id_PlanoConta // Ds_PlanoConta

 TB_Produto = *Id_Produto // Nm_Produto / Vl_Unitario / Vl_IPIPorc 

 TB_PedidoCompra = *Nr_PedidoCompra // Id_Fornecedor / Id_PlanoConta /  Dt_Pedido / Dt_prevista / Ds_CondPagamento / Vl_SubTotal / Vl_descPorc / Vl_TotalIPI / Vl_TotalPedido

 TB_PedidoCompraItem = *Nr_PedidoCompra / *Id_Produto // Vl_Quantidade / Vl_IPIPorc / Vl_CustoUn / Vl_Total

 */


 /*Ja corrigidos*/
