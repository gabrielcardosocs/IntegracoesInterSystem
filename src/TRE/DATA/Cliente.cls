Class TRE.DATA.Cliente Extends %Persistent
{

Property CodigoCliente As %String(MAXLEN = "");

Property NomeEmpresa As %String(MAXLEN = "");

Property NomeContato As %String(MAXLEN = "");

Property Endereco As %String(MAXLEN = "");

Property CEP As %String(MAXLEN = "");

Property Cidade As %String(MAXLEN = "");

Property Estado As %String(MAXLEN = "");

Property EnderecoEmail As %String(MAXLEN = "");

Storage Default
{
<Data name="ClienteDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CodigoCliente</Value>
</Value>
<Value name="3">
<Value>NomeEmpresa</Value>
</Value>
<Value name="4">
<Value>NomeContato</Value>
</Value>
<Value name="5">
<Value>Endereco</Value>
</Value>
<Value name="6">
<Value>CEP</Value>
</Value>
<Value name="7">
<Value>Cidade</Value>
</Value>
<Value name="8">
<Value>Estado</Value>
</Value>
<Value name="9">
<Value>EnderecoEmail</Value>
</Value>
</Data>
<DataLocation>^TRE.DATA.ClienteD</DataLocation>
<DefaultData>ClienteDefaultData</DefaultData>
<ExtentSize>5</ExtentSize>
<IdLocation>^TRE.DATA.ClienteD</IdLocation>
<IndexLocation>^TRE.DATA.ClienteI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="CEP">
<AverageFieldSize>11</AverageFieldSize>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="Cidade">
<AverageFieldSize>12.8</AverageFieldSize>
<Selectivity>25.0000%</Selectivity>
</Property>
<Property name="CodigoCliente">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="Endereco">
<AverageFieldSize>24.2</AverageFieldSize>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="EnderecoEmail">
<AverageFieldSize>22.4</AverageFieldSize>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="Estado">
<AverageFieldSize>4</AverageFieldSize>
<Selectivity>25.0000%</Selectivity>
</Property>
<Property name="NomeContato">
<AverageFieldSize>15.6</AverageFieldSize>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="NomeEmpresa">
<AverageFieldSize>17</AverageFieldSize>
<Selectivity>20.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^TRE.DATA.ClienteS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
