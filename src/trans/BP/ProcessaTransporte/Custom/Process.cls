Class trans.BP.ProcessaTransporte.Custom.Process Extends Ens.BusinessProcess [ ClassType = persistent ]
{

Property PesoKG As %Float;

Property Cep5nCustom As %String(MAXLEN = 50);

Property PrazoEntregaDias As %Integer;

Property AtendidoSpeedy As %Boolean;

Method OnRequest(pRequest As trans.BP.ProcessaTransporte.Custom.Request, Output pResponse As trans.BP.ProcessaTransporte.Custom.Response) As %Status
{

	Set tSC = $$$OK
	Set pResponse = ##class(trans.BP.ProcessaTransporte.Custom.Response).%New()
	
	Try
	{
		// Recupera Detalhes Pedidos
		Set tRequestPedido = ##class(trans.BO.RecupDetalhePedidos.Request).%New()
		Set tRequestPedido.CodigoPedido = pRequest.CodigoPedido
		
		#Dim tResponsePedido As trans.BO.RecupDetalhePedidos.Response
		Set tSC = ..SendRequestSync("Detalha Pedidos BO",tRequestPedido,.tResponsePedido)
		If ($SYSTEM.Status.IsError(tSC)) 
		{
			Throw tSC
		}
		
		Set ..Cep5nCustom = tResponsePedido.CEP
		if (..Cep5nCustom '= "") 
		{
			Set pResponse.Status = 1
			Set ..PesoKG 	   	= $REPLACE(tResponsePedido.PesoKG,",",".")
			Set ..Cep5nCustom  	= $PIECE(..Cep5nCustom,"-",1)
		}
		Else 
		{
			Set pResponse.Status = 0
			Return tSC
		}
		
		KILL tRequestPedido,tResponsePedido
		
		// Verifica Destino Speedy
		Set tRequestDestinoSpeedy = ##class(trans.BO.DetalhesSpeedy.VerificaDestinoSpeedy.Request).%New()
		Set tRequestDestinoSpeedy.Cep5n = ..Cep5nCustom
		
		#Dim tResponsetDestinoSpeedy As trans.BO.DetalhesSpeedy.VerificaDestinoSpeedy.Response
		Set tSC = ..SendRequestSync("Detalhes Speedy BO",tRequestDestinoSpeedy,.tResponsetDestinoSpeedy)
		If ($SYSTEM.Status.IsError(tSC)) 
		{
			Throw tSC
		}
		
		Set ..AtendidoSpeedy = tResponsetDestinoSpeedy.AtendidoSpeedy
		
		KILL tRequestDestinoSpeedy,tResponsetDestinoSpeedy
		
		Set tRequestPrazoEntrega = ##class(trans.BO.DetalhesSpeedy.RecupPrazoEntrega.Request).%New()
		Set tRequestPrazoEntrega.Cep5n = ..Cep5nCustom
		
		#Dim tResponsePrazoEntrega As trans.BO.DetalhesSpeedy.RecupPrazoEntrega.Response
		Set tSC = ..SendRequestSync("Detalhes Speedy BO",tRequestPrazoEntrega,.tResponsePrazoEntrega)
		If ($SYSTEM.Status.IsError(tSC)) 
		{
			Throw tSC
		}
		
		Set ..PrazoEntregaDias = tResponsePrazoEntrega.PrazoEntregaDias
		
		KILL tRequestPrazoEntrega,tResponsetDestinoSpeedy
		
		If ((..AtendidoSpeedy) && (..PesoKG <= 50))
		{
			Set pResponse.CodigoTransp = 1
			Set pResponse.DataPrevisaoEntrega = ((+$horolog)+(..PrazoEntregaDias))		
		}
		Else
		{
			Set pResponse.CodigoTransp = 2
			Set pResponse.DataPrevisaoEntrega = (+$horolog + 5)
		}
		
	}
	Catch(tException)
	{
		#Dim tException As %Exception.SystemException
		
		Set tSC = $SYSTEM.Status.GetErrorText(tException.AsStatus())
	}
	Quit tSC
}

Storage Default
{
<Data name="ProcessDefaultData">
<Subscript>"Process"</Subscript>
<Value name="1">
<Value>PesoKG</Value>
</Value>
<Value name="2">
<Value>Cep5nCustom</Value>
</Value>
<Value name="3">
<Value>PrazoEntregaDias</Value>
</Value>
<Value name="4">
<Value>AtendidoSpeedy</Value>
</Value>
</Data>
<DefaultData>ProcessDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
