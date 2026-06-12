<%@ Page Language="c#" CodeBehind="PackingStationActivity.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Inbound.PackingStationActivity.PackingStationActivity" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PackingStationActivity</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
        <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    </meta>
    <style type="text/css">
        .style2
        {
            width: 125px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td class="style2">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
            <td>
                &nbsp;<asp:Button Style="z-index: 0" ID="refreshBtn" runat="server" CssClass="detailbutton"
                    Text="Refresh" OnClick="refreshBtn_Click"></asp:Button>
                &nbsp;<asp:Label ID="LastLbl" runat="server">Last refresh</asp:Label>:
                <asp:Label ID="LastRefreshLbl" runat="server"></asp:Label>
                <br />
                &nbsp;
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
                <br />
                <br />
            </td>
        </tr>
    </table>
    <div>
        <asp:DataGrid ID="ResultDG" runat="server" DataKeyField="seqid" AutoGenerateColumns="False"
            BorderStyle="None" GridLines="Both" CellPadding="2" AllowSorting="True" UseAccessibleHeader="True"
            AllowPaging="false">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
                <asp:TemplateColumn>
                    <ItemStyle HorizontalAlign="left" Wrap="False"></ItemStyle>
                    <ItemTemplate>
                        <a id="lnkSetAsActive" onclick='<%# Eval("lot5", "return confirm(\"Confirm to set {0} as active?\");") %>'
                            href='<%#DataBinder.Eval(Container,"DataItem.lot5")%>' runat="server" onserverclick="PSA_SetAsActive">
                            <img id="SetAsActiveImg" border="0" alt="Set as Default" src="..\..\image\accept.png"
                                width="15" height="15" runat="server"></a>
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
                <asp:BoundColumn DataField="NotScanned" HeaderText="NotScanned" SortExpression="NotScanned">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="SentToMatcon" HeaderText="SentToMatcon" SortExpression="SentToMatcon">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </asp:BoundColumn>
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
