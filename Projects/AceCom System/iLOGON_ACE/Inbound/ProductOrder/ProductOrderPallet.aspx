<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>

<%@ Page Language="c#" CodeBehind="ProductOrderPallet.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Inbound.ProductOrder.ProductOrderPallet" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ProductOrder</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <div id="div-datagrid" style="height: 92%">
        <asp:Label ID="ReceiptIdLbl" runat="server" CssClass="pagetitle"></asp:Label>
        &nbsp;
        <asp:DataGrid ID="ResultDG" runat="server" DataKeyField="seqid" AutoGenerateColumns="False"
            BorderStyle="None" GridLines="Both" CellPadding="2" AllowSorting="True" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
                <%--<ASP:TEMPLATECOLUMN>
							<ITEMSTYLE HorizontalAlign="left" Wrap="False"></ITEMSTYLE>
							<ITEMTEMPLATE>
                            <A id=lnkRegeneratePallet onclick="return confirm('Confirm Register New Pallet?')" 
                                href='<%#DataBinder.Eval(Container,"DataItem.lot5")%>' runat="server" 
                                onserverclick="PO_RegeneratePallet"><IMG id="RegeneratePalletImg" border="0" alt="Regenerate Pallet" src="..\..\image\accept.png"
                                width="15" height="15" runat="server"></A>
                            <A id=lnkSendToMatcon onclick="return confirm('Confirm Send To Matcon?')" 
                                href='<%#DataBinder.Eval(Container,"DataItem.lot5")%>' runat="server" 
                                onserverclick="PO_SendToMatcon"><IMG id="SendToMatconImg" border="0" alt="Send To Matcon" src="..\..\image\matcon.jpg"
                                width="15" height="15" runat="server"></A> 
                            <A id=lnkSendToSAP onclick="return confirm('Send To SAP?')" 
                                href='<%#DataBinder.Eval(Container,"DataItem.lot5")%>' runat="server" 
                                onserverclick="PO_SendToSAP"><IMG id="SendToSapImg" border="0" alt="Send To SAP" src="..\..\image\sap_logo.gif"
                                width="15" height="15" runat="server"></A>
                            <ASP:LABEL id="DetailLbl" runat="server"></ASP:LABEL>
                            <a id=lnkPrint href='<%#DataBinder.Eval(Container,"DataItem.lot5")%>'
                                onserverclick="PO_PrintLabel" runat=server>
							    <img id="printImg" src="..\..\image\printer.png" Width="15" Height="15" border="0" alt="Print Label"
								    runat="server"></a>
                            <A id=lnkDelete onclick="return confirm('Confirm delete?')" 
                                href='<%#DataBinder.Eval(Container,"DataItem.lot5")%>' runat="server" 
                                onserverclick="PO_Delete"><IMG id="delImg" border="0" alt="Delete" src="..\..\image\bin.gif" width="15"
                                height="15" runat="server"></A>
							</ITEMTEMPLATE>
						</ASP:TEMPLATECOLUMN>--%>
                <asp:TemplateColumn>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        No
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="Lot5" HeaderText="PalletID" SortExpression="Lot5">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="active" HeaderText="Active" SortExpression="active">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="TotalBags" HeaderText="TotalBags" SortExpression="TotalBags">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Scanned" HeaderText="Scanned" SortExpression="Scanned">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </asp:BoundColumn>
                <%--<ASP:BOUNDCOLUMN DataField="NotScanned" HeaderText="NotScanned" SortExpression="NotScanned">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"  HorizontalAlign="Center"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>--%>
                <%--<ASP:BOUNDCOLUMN DataField="SentToMatcon" HeaderText="SentToMatcon" SortExpression="SentToMatcon">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"  HorizontalAlign="Center"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>--%>
                <asp:BoundColumn DataField="WeighingCompleted" HeaderText="WeighingCompleted" SortExpression="WeighingCompleted">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="VoidLabel" HeaderText="VoidLabel" SortExpression="VoidLabel">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="SendtoSAP" HeaderText="SentToSAP" SortExpression="SendtoSAP">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </asp:BoundColumn>
            </Columns>
        </asp:DataGrid>
    </div>
    </form>
</body>
</html>
