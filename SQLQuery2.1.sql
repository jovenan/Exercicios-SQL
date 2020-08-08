
/*Mostra o nome do correntista que tem saldo inferior a 0 */
select Nm_Correntista, Vl_Saldo from TB_ContaCorrente CC inner join TB_Correntista C on CC.Id_Correntista = C.Id_Correntista where Vl_Saldo < 0;

/*Correntistas VIPS - saldo maior ou igual a 10.000 */
select Nm_Correntista, Vl_Saldo from TB_ContaCorrente CC inner join TB_Correntista C on CC.Id_Correntista = C.Id_Correntista where Vl_Saldo >= 10000;

/*Correntistas para emprestimo, campos formatados*/
select upper(substring(Nm_Correntista,1,1)) +
		SUBSTRING(Nm_Correntista,2,100) as Nm_Correntista,
		'(' + substring(cast(Nr_telefone as varchar),1,2) + ') ' +
		substring(cast(Nr_telefone as varchar),3,7) + '-' +
		substring(cast(Nr_telefone as varchar),8,10) as Nr_Telefone
		from TB_ContaCorrente CC inner join TB_Correntista C on CC.Id_Correntista = C.Id_Correntista where Vl_Saldo < 0;

/*pessoas entre cc 200004 e 200009*/
select Nr_ContaCorrente, Nm_Correntista from TB_ContaCorrente CC inner join TB_Correntista C on CC.Id_Correntista = C.Id_Correntista 
		where Nr_ContaCorrente between 200004 and 200009;

/*Correntistas da agencia 2*/
select Nm_Correntista from TB_ContaCorrente CC inner join TB_Correntista C on CC.Id_Correntista = C.Id_Correntista where Nr_Agencia = '110';

/*apresentar dados formatados*/
select Substring(cast(A.Nr_Agencia as varchar),1,3) + '0' as Nr_Agencia,
		upper(substring(A.Nm_Agencia,1,1)) +
		SUBSTRING(lower(Nm_Agencia),2,100) as Nm_Agencia,
		substring(cast(Nr_ContaCorrente as varchar),1,2) + '.' +
		SUBSTRING(cast(Nr_ContaCorrente as varchar),3,1) + '.' +
		substring(cast(Nr_ContaCorrente as varchar),4,2) + '-' +
		SUBSTRING(cast(Nr_ContaCorrente as varchar),6,1) as Nr_ContaCorrente,
		C.Id_Correntista,
		upper(substring(Nm_Correntista,1,1)) +
		SUBSTRING(lower(Nm_Correntista),2,100) as Nm_Correntista,
		Vl_Saldo
		from TB_ContaCorrente CC inner join TB_Correntista C 
		on CC.Id_Correntista = C.Id_Correntista inner join TB_Agencia A on CC.Nr_Agencia = A.Nr_Agencia;

/*exer 7*/
select Substring(cast(A.Nr_Agencia as varchar),1,3) + '0' + ' / ' +
		substring(cast(Nr_ContaCorrente as varchar),1,2) + '.' +
		SUBSTRING(cast(Nr_ContaCorrente as varchar),3,1) + '.' +
		substring(cast(Nr_ContaCorrente as varchar),4,2) + '-' +
		SUBSTRING(cast(Nr_ContaCorrente as varchar),6,1) as Nr_AgenciaCorrentista,
		upper(substring(Nm_Correntista,1,1)) +
		SUBSTRING(lower(Nm_Correntista),2,100) as Nm_Correntista,
		Substring(cast(C.Nr_Cpf as varchar),1,3) + '.' +
		Substring(cast(C.Nr_Cpf as varchar),3,3) + '.' +
		Substring(cast(C.Nr_Cpf as varchar),5,3) + '-' +
		Substring(cast(C.Nr_Cpf as varchar),6,2) as Nr_Cpf
		from TB_ContaCorrente CC inner join TB_Correntista C 
		on CC.Id_Correntista = C.Id_Correntista inner join TB_Agencia A on CC.Nr_Agencia = A.Nr_Agencia;

/*exercicio 8*/
Select COUNT(Nm_correntista) as TotalDeCorrentistas from TB_Correntista 

/*exercicio 9*/
Select COUNT(Nr_Agencia) as TotalDeAgencias from TB_Agencia

/*exercicio 10*/
select SUM(Vl_Saldo)/COUNT(Vl_Saldo) as MediaDeSaldos from TB_ContaCorrente

/* outra forma de fazer o 10*/
select AVG(Vl_Saldo) as MediaDeSaldos from TB_ContaCorrente where Nr_Agencia = 110
