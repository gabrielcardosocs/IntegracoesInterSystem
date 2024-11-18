Class trans.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="trans.Production" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Detalha Pedidos BO" Category="Pedidos" ClassName="trans.BO.RecupDetalhePedidos.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Detalhes Speedy BO" Category="Detalhes" ClassName="trans.BO.DetalhesSpeedy.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="ProcessaTransporte" Category="Transporte" ClassName="trans.BP.ProcessaTransporte.Process" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="ProcessaTransporteCustom" Category="Pedidos" ClassName="trans.BP.ProcessaTransporte.Custom.Process" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="trans.BS.ProcessaPedido" Category="Pedidos" ClassName="trans.BS.ProcessaPedido" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="EnableStandardRequests">1</Setting>
  </Item>
</Production>
}

}
