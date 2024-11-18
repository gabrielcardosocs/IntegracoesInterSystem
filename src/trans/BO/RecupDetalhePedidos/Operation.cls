Class trans.BO.RecupDetalhePedidos.Operation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method RecupDetalhePedido(pResquest As trans.BO.RecupDetalhePedidos.Request, Output pResponse As trans.BO.RecupDetalhePedidos.Response) As %Status
{
	
	Set pResponse = ##class(trans.BO.RecupDetalhePedidos.Response).%New()
	
	Set vStatus =$$$OK
	
	Set vQuery = "SELECT T1.*,T2.* FROM TRE_DATA.Pedido T1, TRE_DATA.Cliente T2 "_
		"WHERE T1.CodigoCliente = T2.CodigoCliente "_
		"AND T1.CodigoPedido = ? "
		
	Set vResult = ##class(%ResultSet).%New()
	
	Set vStatus = vResult.Prepare(vQuery)
	If ($SYSTEM.Status.IsError(vStatus))
	{
		Return vStatus
	}
	
	Set vStatus = vResult.Execute(pResquest.CodigoPedido)
	If ($SYSTEM.Status.IsError(vStatus))
	{
		Return vStatus
	}
	
	If (vResult.Next())
	{
		Set pResponse.PesoKG = vResult.Get("PesoKG")
		Set pResponse.CEP = vResult.Get("CEP")
		Set pResponse.Cidade = vResult.Get("Cidade")
		Set pResponse.Email = vResult.Get("EnderecoEmail")
		Set pResponse.Endereco = vResult.Get("Endereco")
		Set pResponse.Estado = vResult.Get("Estado")
		Set pResponse.NomeContato = vResult.Get("NomeContato")
		Set pResponse.NomeEmpresa = vResult.Get("NomeEmpresa")
		Set pResponse.Volumes = vResult.Get("Volumes")
	}
	
	Return vStatus
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="trans.BO.RecupDetalhePedidos.Request">
        <Method>RecupDetalhePedido</Method>
    </MapItem>
</MapItems>
}

}
