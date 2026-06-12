<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GRV2TUSummary.aspx.cs" Inherits="iWMS.Web.Inbound.GoodsReceiveV2.GRV2TUSummary" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReceiptV2TUSummary</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td class="pagetitle" colspan="2" width="100%">&nbsp;
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <div id="div-datagrid">
                        <asp:DataGrid ID="ResultDG" runat="server" PageSize="8" GridLines="Both" CellPadding="2"
                            AutoGenerateColumns="False" AllowSorting="True" UseAccessibleHeader="True">
                            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem"></ItemStyle>
                            <Columns>
                                <asp:TemplateColumn>
                                    <HeaderTemplate>
                                        S/N
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%#Container.ItemIndex+1%>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="TU1" SortExpression="TU1" HeaderText="TU1">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="TU2" SortExpression="TU2" HeaderText="TU2">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="SKU" SortExpression="SKU" HeaderText="SKU">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="SKU2" SortExpression="SKU2" HeaderText="Code2">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Description" SortExpression="Description" HeaderText="Description">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="qty" SortExpression="qty" HeaderText="Qty" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:#,0.##}">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                            </Columns>
                            <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                        </asp:DataGrid>
                    </div>
                </td>
                <td align="left">
                    <div id="div1">
                        <asp:DataGrid ID="ResultDG2" runat="server" PageSize="8" GridLines="Both" CellPadding="2"
                            AutoGenerateColumns="False" AllowSorting="True" UseAccessibleHeader="True">
                            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem"></ItemStyle>
                            <Columns>
                                <asp:TemplateColumn>
                                    <HeaderTemplate>
                                        S/N
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%#Container.ItemIndex+1%>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="SKU" SortExpression="SKU" HeaderText="SKU">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="qty" SortExpression="qty" HeaderText="Qty" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:#,0.##}">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                            </Columns>
                        </asp:DataGrid>
                        <br />
                        <asp:DataGrid ID="ResultDG3" runat="server" PageSize="8" GridLines="Both" CellPadding="2"
                            AutoGenerateColumns="False" AllowSorting="True" UseAccessibleHeader="True">
                            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem"></ItemStyle>
                            <Columns>
                                <asp:BoundColumn DataField="nooftu1" HeaderText="NoOfTuNo1">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="nooftu2" HeaderText="NoOfTuNo2">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                            </Columns>
                        </asp:DataGrid>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
