<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListSearch.aspx.cs" Inherits="iWMS.Web.Control.ListSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ListSearch by </title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self">
        <meta http-equiv="Pragma" content="no-cache">
</head>
<body leftmargin="0" topmargin="3">
    <form action="ListSearch.aspx" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="3" cellpadding="3" border="0" width="100%">
        <tr>
            <td valign="top">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
            <td align="right" valign="top">
                <asp:Button ID="SearchBtn" runat="server" Text="Search" CssClass="detailButton" OnClick="SearchBtn_Click">
                </asp:Button>
            </td>
        </tr>
    </table>
    <div id="div-datagrid" style="width: 100%; height: 50%">
        <asp:DataGrid ID="ResultDG" runat="server" OnItemCommand="ResultDG_ItemCommand" PageSize="5"
            GridLines="Vertical" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"
            BackColor="White" CellPadding="3" AllowPaging="False" AutoGenerateColumns="False"
            DataKeyField="id" UseAccessibleHeader="True" OnItemDataBound="ResultDG_ItemDataBound">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <SelectedItemStyle Wrap="False" ForeColor="White" BackColor="#0033CC"></SelectedItemStyle>
            <Columns>
                <asp:ButtonColumn Text="Select" CommandName="Select"></asp:ButtonColumn>
                <asp:BoundColumn DataField="item" SortExpression="item" HeaderText="Item">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="descr" SortExpression="descr" HeaderText="Description">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="usrdef01" SortExpression="usrdef01" HeaderText="User-Define 1">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="usrdef02" SortExpression="usrdef02" HeaderText="User-Define 2">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="usrdef03" SortExpression="usrdef03" HeaderText="User-Define 3">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="usrdef04" SortExpression="usrdef04" HeaderText="User-Define 4">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="usrdef05" SortExpression="usrdef05" HeaderText="User-Define 5">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="statusdescr" HeaderText="Status">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
            </Columns>
            <PagerStyle HorizontalAlign="Left" ForeColor="Black" Position="Bottom" Mode="NumericPages">
            </PagerStyle>
        </asp:DataGrid>
    </div>
    <table cellspacing="3" cellpadding="3" border="0" width="100%">
        <tr>
            <td align="left" valign="top">
                <asp:Label ID="DetailLbl" runat="server"></asp:Label><br>
            </td>
            <td align="right" valign="top">
                <asp:Button ID="OkBtn" runat="server" Text="   OK   " CssClass="detailButton" Visible="False">
                </asp:Button><br>
                <asp:TextBox ID="ReturnTxt" runat="server" ReadOnly="True" BorderColor="White" Style="z-index: 0"
                    CssClass="detailButton" Width="50" BackColor="White" ForeColor="White"></asp:TextBox><br>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
