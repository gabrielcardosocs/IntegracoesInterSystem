Class trans.BP.ProcessaTransporte.Custom.Response Extends Ens.Response
{

Property Status As %Boolean;

Property CodigoTransp As %String;

Property DataPrevisaoEntrega As %Date(FORMAT = 4);

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>Status</Value>
</Value>
<Value name="2">
<Value>CodigoTransp</Value>
</Value>
<Value name="3">
<Value>DataPrevisaoEntrega</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
