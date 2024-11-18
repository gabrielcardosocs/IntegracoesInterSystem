Class trans.BO.RecupDetalhePedidos.Request Extends Ens.Request
{

Property CodigoPedido As %String;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>CodigoPedido</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
