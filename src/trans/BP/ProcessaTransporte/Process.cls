/// 
Class trans.BP.ProcessaTransporte.Process Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='trans.BP.ProcessaTransporte.Request' response='trans.BP.ProcessaTransporte.Response' height='2000' width='2000' >
<context>
<property name='cep5n' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='AtendidoSpeedy' type='%Boolean' instantiate='0' />
<property name='PrazoEntregaDias' type='%Integer' instantiate='0' />
<property name='PesoKg' type='%Library.Float' instantiate='0' />
</context>
<sequence xend='200' yend='1750' >
<call name='ChamaDetalhesPedido' target='Detalha Pedidos BO' async='1' xpos='200' ypos='250' >
<annotation><![CDATA[Este componente é responsavel por realizar uma chamada para o Operation: Detalha Pedidos BO]]></annotation>
<request type='trans.BO.RecupDetalhePedidos.Request' >
<assign property="callrequest.CodigoPedido" value="request.CodigoPedido" action="set" languageOverride="" />
</request>
<response type='trans.BO.RecupDetalhePedidos.Response' >
<assign property="context.cep5n" value="callresponse.CEP" action="set" languageOverride="" />
<assign property="context.PesoKg" value="$REPLACE(callresponse.PesoKG,&quot;,&quot;,&quot;.&quot;)" action="set" languageOverride="" />
</response>
</call>
<sync name='AguardaDetalhesPedido' calls='ChamaDetalhesPedido' type='all' xpos='200' ypos='350' />
<if name='PedidoValido?' condition='context.cep5n &apos;= ""' xpos='200' ypos='450' xend='200' yend='1650' >
<annotation><![CDATA[Esse componente é responsável por verificar uma condição se o pedido é valido]]></annotation>
<true>
<assign name="DefineStatusPedidoValido" property="response.Status" value="1" action="set" languageOverride="" xpos='470' ypos='600' />
<assign name="DefineCep5n" property="context.cep5n" value="$PIECE(context.cep5n,&quot;-&quot;,1)" action="set" languageOverride="" xpos='470' ypos='700' >
<annotation><![CDATA[Esse componente é responsável por definir a limitação de 5 numeros do Cep]]></annotation>
</assign>
<alert name='ValorCEP5N' value='context.cep5n' xpos='470' ypos='800' />
<call name='ChamaVerificaDestinoSpeedy' target='Detalhes Speedy BO' async='1' xpos='470' ypos='900' >
<annotation><![CDATA[Este componente é responsavel por realizar uma chamada para o Operation: Detalha Speedy BO]]></annotation>
<request type='trans.BO.DetalhesSpeedy.VerificaDestinoSpeedy.Request' >
<assign property="callrequest.Cep5n" value="context.cep5n" action="set" languageOverride="" />
</request>
<response type='trans.BO.DetalhesSpeedy.VerificaDestinoSpeedy.Response' >
<assign property="context.AtendidoSpeedy" value="callresponse.AtendidoSpeedy" action="set" languageOverride="" />
</response>
</call>
<call name='ChamaRecupPrazoEntrega' target='Detalhes Speedy BO' async='1' xpos='470' ypos='1000' >
<annotation><![CDATA[Este componente é responsavel por realizar uma chamada para o Operation: Detalha Speedy BO]]></annotation>
<request type='trans.BO.DetalhesSpeedy.RecupPrazoEntrega.Request' >
<assign property="callrequest.Cep5n" value="context.cep5n" action="set" languageOverride="" />
</request>
<response type='trans.BO.DetalhesSpeedy.RecupPrazoEntrega.Response' >
<assign property="context.PrazoEntregaDias" value="callresponse.PrazoEntregaDias" action="set" languageOverride="" />
</response>
</call>
<sync name='AguardaDetalhesSpeedy' calls='ChamaVerificaDestinoSpeedy,ChamaRecupPrazoEntrega' type='all' xpos='470' ypos='1100' />
<if name='AceitavelSpeedy?' condition='(context.AtendidoSpeedy = 1)  &amp;&amp; (context.PesoKg &lt;= 50)' xpos='470' ypos='1200' xend='470' yend='1550' >
<annotation><![CDATA[Esse componente é responsável por verificar uma condição se aceita atendimento Speedy]]></annotation>
<true>
<assign name="AtribuiSpeedy" property="response.CodigoTransp" value="1" action="set" languageOverride="" xpos='740' ypos='1350' />
<assign name="CalculaDataEntregaSpeedy" property="response.DataPrevisaoEntrega" value="$P($Horolog,&quot;,&quot;,1) + context.PrazoEntregaDias" action="set" languageOverride="" xpos='740' ypos='1450' />
</true>
<false>
<assign name="AtribuirFlex" property="response.CodigoTransp" value="2" action="set" languageOverride="" xpos='470' ypos='1350' />
<assign name="CalculaDataEntregaFlex" property="response.DataPrevisaoEntrega" value="$P($Horolog,&quot;,&quot;,1) + 5" action="set" languageOverride="" xpos='470' ypos='1450' />
</false>
</if>
</true>
<false>
<assign name="DefineStatusPedidoInvalido" property="response.Status" value="0" action="set" languageOverride="" xpos='200' ypos='600' />
</false>
</if>
</sequence>
</process>
}

}
