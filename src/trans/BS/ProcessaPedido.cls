Class trans.BS.ProcessaPedido Extends EnsLib.SOAP.Service
{

Parameter ADAPTER = "EnsLib.SOAP.InboundAdapter";

/// Name of the WebService
Parameter SERVICENAME = "ProcessaPedidos";

/// TODO: Change this to actual network address
/// URL for invoking the WebService
Parameter LOCATION = "http://127.0.0.1:52775/irisintegracao/csp/healthshare/treinamento/services";

/// TODO: Change this to actual SOAP namespace
/// SOAP namespace for the WebService
Parameter NAMESPACE = "http://tempuri.org";

// http://localhost:52773/irishealth/csp/healthshare/treinamento/services/trans.BS.ProcessaPedido.cls?wsdl=1

// http://127.0.0.1:52775/irisintegracao/csp/healthshare/treinamento/services/trans.BS.ProcessaPedido.cls?wsdl=1

Method ProcessaPedido(pCodigoPedido As %String) As trans.VO.ConfirmaPedido [ WebMethod ]
{

	Set tSC=..ProcessInput(pCodigoPedido,.tResponse,"ProcessaTransporte")
	If $$$ISERR(tSC) Do ..ReturnMethodStatusFault(tSC)
	
	#Dim tResponse As trans.BP.ProcessaTransporte.Response
	Set VOResp 						= ##class(trans.VO.ConfirmaPedido).%New()
	Set VOResp.CodigoTransp 		= tResponse.CodigoTransp
	Set VOResp.DataPrevisaoEntrega 	= tResponse.DataPrevisaoEntrega
	Set VOResp.Status				= tResponse.Status
	
	
	
	Quit VOResp
}

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject, ByRef pHint As %String) As %Status
{

	Set tSC = $$$OK
	
	Set tRequestPedido 				= ##class(trans.BP.ProcessaTransporte.Request).%New()
	Set tRequestPedido.CodigoPedido = pInput
	Set tSC 						= ..SendRequestSync(pHint,tRequestPedido,.pOutput)

	Quit tSC
}

}
