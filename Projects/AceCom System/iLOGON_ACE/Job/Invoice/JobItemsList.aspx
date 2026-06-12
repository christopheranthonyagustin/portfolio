<%@ Page Language="c#" CodeBehind="JobItemsList.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.Invoice.JobItemsList" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>JobItemsList</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%" cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="pagetitle">
                <asp:Label ID="IdLbl" runat="server"></asp:Label>&nbsp;
            </td>
            <td align="right">
                <asp:Button ID="BackButton" CausesValidation="False" runat="server" CssClass="detailButton"
                    Visible="True" Text="< Search Results" Width="140px" OnClick="BackButton_Click">
                </asp:Button>&nbsp;
            </td>
        </tr>
        <br />
    </table>
    <div id="div-datagrid">
        <asp:DataGrid ID="ResultDG" runat="server" PageSize="8" BorderStyle="None" GridLines="Both"
            CellPadding="2" AutoGenerateColumns="False" DataKeyField="id" AllowSorting="True"
            UseAccessibleHeader="True">
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
                <asp:BoundColumn DataField="permitno" SortExpression="Permitno" HeaderText="Permit">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="jbno" SortExpression="jbno" HeaderText="Job#">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="skugrpdescr" SortExpression="skugrpdescr" HeaderText="SKU Group">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="currlotno" SortExpression="currlotno" HeaderText="Lot No">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="outerqty" SortExpression="outerqty" HeaderText="OuterQty"
                    DataFormatString="{0:#,0.##}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="xdouterqty" SortExpression="xdouterqty" HeaderText="XD-Qty"
                    DataFormatString="{0:#,0.##}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="outeruom" SortExpression="outeruom" HeaderText="UOM">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="shippedqty" SortExpression="shippedqty" HeaderText="TotalShippedQty"
                    DataFormatString="{0:#,0.##}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="InDate" DataFormatString="{0:dd/MMM/yyyy}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="shdate" SortExpression="shdate" HeaderText="LastOutDate"
                    DataFormatString="{0:dd/MMM/yyyy}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="maxstoragedays" SortExpression="maxstoragedays" HeaderText="MaxStorageDay"
                    DataFormatString="{0:#,0.##}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                </asp:BoundColumn>
            </Columns>
        </asp:DataGrid></div>
    </form>
</body>
</html>
