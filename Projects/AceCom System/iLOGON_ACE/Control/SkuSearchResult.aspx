<%@ Page Language="c#" CodeBehind="SkuSearchResult.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Control.SkuSearchResult" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SkuSearchResult</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <meta http-equiv="Pragma" content="no-cache">
    <link href="../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self">
</head>
<body topmargin="5">
    <form id="Form1" action="SkuSearchResult.aspx" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td>
                <div class="pagetitle">
                    Select SKU Code:
                </div>
                <td align="right">
                    <asp:TextBox ID="ReturnTxt" runat="server" ReadOnly="True" CssClass="detailButton"
                        BackColor="White" BorderWidth="0"></asp:TextBox>&nbsp;
                    <asp:Button ID="OkBtn" runat="server" CssClass="detailButton" Text="OK" OnClick="OkBtn_Click">
                    </asp:Button>&nbsp;&nbsp;
            </td>
        </tr>
    </table>
    <br>
    <div id="div-datagrid">
        <asp:DataGrid ID="ResultDG" runat="server" OnItemCommand="ResultDG_ItemCommand" PageSize="5"
            GridLines="Vertical" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"
            BackColor="White" CellPadding="3" AllowPaging="False" AutoGenerateColumns="False"
            DataKeyField="id" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <SelectedItemStyle Wrap="False" ForeColor="White" BackColor="#0033CC"></SelectedItemStyle>
            <Columns>
                <asp:ButtonColumn Text="Select" CommandName="Select"></asp:ButtonColumn>
                <asp:BoundColumn DataField="code" SortExpression="code" HeaderText="SKU Code">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="code2" SortExpression="Code2" HeaderText="Code 2">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="descr" SortExpression="descr" HeaderText="Description">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="packing" SortExpression="packing" HeaderText="Pack Description">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
            </Columns>
            <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
        </asp:DataGrid></div>
    </form>
</body>
</html>
