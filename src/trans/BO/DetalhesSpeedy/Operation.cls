Class trans.BO.DetalhesSpeedy.Operation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method VerificaDestinoSpeedy(pRequest As trans.BO.DetalhesSpeedy.VerificaDestinoSpeedy.Request, Output pResponse As trans.BO.DetalhesSpeedy.VerificaDestinoSpeedy.Response) As %Status
{
	Set tSC = $System.Status.OK()
	
	Try 
	{
		Set pResponse = ##class(trans.BO.DetalhesSpeedy.VerificaDestinoSpeedy.Response).%New()
		Set tSQL = "SELECT COUNT(*) As Atende FROM TRE_DATA.DESTINO "_
				   "WHERE CEPInicial <= "_pRequest.Cep5n_
				   " AND CEPFinal >= "_pRequest.Cep5n
				   
		Set tRs = ##class(%ResultSet).%New()
		Set tSC = tRs.Prepare(tSQL)
		If ($SYSTEM.Status.IsError(tSC))
		{
			Throw tSC
		}
		
		Set tSC = tRs.Execute()
		If ($SYSTEM.Status.IsError(tSC))
		{
			Throw tSC
		}	
		
		Set pResponse.AtendidoSpeedy = 0
		While tRs.Next() 
		{
			if (tRs.Get("Atende")>0)
			{
				Set pResponse.AtendidoSpeedy = 1
			} 
		}
		
			
	}
	Catch(e) 
	{
	Set tSC = e.AsStatus()
	}
	Quit tSC
}

Method RecupPrazoEntrega(pRequest As trans.BO.DetalhesSpeedy.RecupPrazoEntrega.Request, Output pResponse As trans.BO.DetalhesSpeedy.RecupPrazoEntrega.Response) As %Status
{
	Set tSC = $SYSTEM.Status.OK()
	
	Try 
	{
		Set pResponse= ##class(trans.BO.DetalhesSpeedy.RecupPrazoEntrega.Response).%New()
		Set tSQL = "SELECT PrazoEntregaDias FROM TRE_DATA.DESTINO "_
				   "WHERE CEPInicial <= "_pRequest.Cep5n_
				   " AND CEPFinal >= "_pRequest.Cep5n
				   
		Set tRs = ##class(%ResultSet).%New()
		Set tSC = tRs.Prepare(tSQL)
		If ($SYSTEM.Status.IsError(tSC))
		{
			Throw tSC
		}
		
		Set tSC= tRs.Execute()
		If ($SYSTEM.Status.IsError(tSC))
		{
			Throw tSC
		}
		
		Set pResponse.PrazoEntregaDias = -1
		
		While tRs.Next() 
		{
			if (tRs.Get("PrazoEntregaDias")>0)
			{
				Set pResponse.PrazoEntregaDias = tRs.Get("PrazoEntregaDias")
			} 
		}
		
		
	}Catch(e) 
	{
	Set tSC = e.AsStatus()
	}
	Quit tSC
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="trans.BO.DetalhesSpeedy.VerificaDestinoSpeedy.Request">
        <Method>VerificaDestinoSpeedy</Method>
    </MapItem>
        <MapItem MessageType="trans.BO.DetalhesSpeedy.RecupPrazoEntrega.Request">
        <Method>RecupPrazoEntrega</Method>
    </MapItem>
    
</MapItems>
}

}
