Class TRE.DATA.Destino Extends %Persistent
{

Property CodigoDestino As %String(MAXLEN = "");

Property CepInicial As %Integer;

Property CepFinal As %Integer;

Property PrazoEntregaDias As %String(MAXLEN = "");

Storage Default
{
<Data name="DestinoDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CodigoDestino</Value>
</Value>
<Value name="3">
<Value>CepInicial</Value>
</Value>
<Value name="4">
<Value>CepFinal</Value>
</Value>
<Value name="5">
<Value>PrazoEntregaDias</Value>
</Value>
</Data>
<DataLocation>^TRE.DATA.DestinoD</DataLocation>
<DefaultData>DestinoDefaultData</DefaultData>
<ExtentSize>5</ExtentSize>
<IdLocation>^TRE.DATA.DestinoD</IdLocation>
<IndexLocation>^TRE.DATA.DestinoI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="CepFinal">
<AverageFieldSize>6.6</AverageFieldSize>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="CepInicial">
<AverageFieldSize>6.6</AverageFieldSize>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="CodigoDestino">
<AverageFieldSize>4</AverageFieldSize>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="PrazoEntregaDias">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>25.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^TRE.DATA.DestinoS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
