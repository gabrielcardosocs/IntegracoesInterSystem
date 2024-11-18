Class trans.BP.ProcessaTransporte.Custom.Request Extends Ens.Request
{

Property CodigoPedido As %Integer;

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
