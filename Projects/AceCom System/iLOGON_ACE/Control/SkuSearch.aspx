<%@ Register TagPrefix="iWMS" TagName="iForm" Src="iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="SkuSearch.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Control.SkuSearch" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SKU Search</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache">
</head>
<body leftmargin="0" topmargin="3">
    <form action="SkuSearch.aspx" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="3" cellpadding="3" border="0" width="100%">
            <tr>
                <td valign="top">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
                <td align="right" valign="top">
                    <asp:Button ID="SearchBtn" runat="server" Text="Search" CssClass="detailButton" OnClick="SearchBtn_Click"></asp:Button>
                </td>
            </tr>
        </table>
        <div id="div-datagrid" style="width: 100%; height: 50%">
            <asp:DataGrid ID="ResultDG" runat="server" OnItemCommand="ResultDG_ItemCommand" PageSize="5"
                GridLines="Vertical" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"
                BackColor="White" CellPadding="3" AllowPaging="False" AutoGenerateColumns="False"
                DataKeyField="code" UseAccessibleHeader="True" AllowSorting="True">
                <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem"></ItemStyle>
                <SelectedItemStyle Wrap="False" ForeColor="White" BackColor="#0033CC"></SelectedItemStyle>
                <Columns>
                    <asp:ButtonColumn Text="Select" CommandName="Select"></asp:ButtonColumn>
                    <asp:BoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="code" SortExpression="Code" HeaderText="Code">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="descr" SortExpression="descr" HeaderText="Description">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="packing" SortExpression="packing" HeaderText="Packing Descr">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="coo" SortExpression="coo" HeaderText="COO">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="code2" SortExpression="code2" HeaderText="Code2">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="type" SortExpression="type" HeaderText="Type">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="hscode" SortExpression="hscode" HeaderText="HS Code">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="literage" SortExpression="literage" HeaderText="Literage">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="abv" SortExpression="abv" HeaderText="ABV">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                </Columns>
                <PagerStyle HorizontalAlign="Left" ForeColor="Black" Position="Bottom" Mode="NumericPages"></PagerStyle>
            </asp:DataGrid>
        </div>
        <table cellspacing="3" cellpadding="3" border="0" width="100%">
            <tr>
                <td align="left" valign="top">
                    <asp:Label ID="DetailLbl" runat="server"></asp:Label><br>
                </td>
                <td align="right" valign="top">
                    <asp:Button ID="OkBtn" runat="server" Text="   OK   " CssClass="detailButton" Visible="False"></asp:Button><br>
                    <asp:TextBox ID="ReturnTxt" runat="server" ReadOnly="True" BorderColor="White" Style="z-index: 0"
                        CssClass="detailButton" Width="50" BackColor="White" ForeColor="White"></asp:TextBox><br>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
