<%@ Register TagPrefix="iWMS" TagName="iForm" Src="iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="PartnerSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Control.PartnerSearch" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PartnerSearch</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self">
        <meta http-equiv="Pragma" content="no-cache">
</head>
<body leftmargin="0" topmargin="3">
    <form action="PartnerSearch.aspx" method="post" runat="server">
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
            DataKeyField="id" UseAccessibleHeader="True">
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
                <asp:BoundColumn DataField="name" SortExpression="name" HeaderText="Name">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="statusdescr" HeaderText="Status">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn Visible="False" DataField="addr1"></asp:BoundColumn>
                <asp:BoundColumn Visible="False" DataField="addr2"></asp:BoundColumn>
                <asp:BoundColumn Visible="False" DataField="addr3"></asp:BoundColumn>
                <asp:BoundColumn Visible="False" DataField="addr4"></asp:BoundColumn>
                <asp:BoundColumn Visible="False" DataField="zipcode"></asp:BoundColumn>
                <asp:BoundColumn Visible="False" DataField="citycode"></asp:BoundColumn>
                <asp:BoundColumn Visible="False" DataField="countrycode"></asp:BoundColumn>
            </Columns>
            <PagerStyle HorizontalAlign="Left" ForeColor="Black" Position="Bottom" Mode="NumericPages">
            </PagerStyle>
        </asp:DataGrid></div>
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
