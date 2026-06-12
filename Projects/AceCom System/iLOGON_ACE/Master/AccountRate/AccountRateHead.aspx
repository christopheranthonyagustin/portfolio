<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>

<%@ Page Language="c#" CodeBehind="AccountRateHead.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.AccountRate.AccountRateHead" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>AccountRateHead</title>
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
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <div id="div-datagrid" style="height: 92%">
        <asp:DataGrid ID="ResultDG" runat="server" PageSize="8" AllowPaging="True" BorderStyle="None"
            GridLines="Both" CellPadding="2" AutoGenerateColumns="False" DataKeyField="id"
            AllowSorting="True" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
                <asp:TemplateColumn>
                    <ItemStyle Wrap="False"></ItemStyle>
                    <ItemTemplate>
                        <iWMS:iSubMenu ID="subMenuCtl" runat="server"></iWMS:iSubMenu>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="code" SortExpression="Code" HeaderText="Account">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="code2" SortExpression="Code2" HeaderText="Code2">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="name" SortExpression="name" HeaderText="Name">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="addr1" SortExpression="addr1" HeaderText="Address#1">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="addr2" SortExpression="addr2" HeaderText="Address#2">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="addr3" SortExpression="addr3" HeaderText="Address#3">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="addr4" SortExpression="addr4" HeaderText="Address#4">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="zipcode" SortExpression="zipcode" HeaderText="Zip Code">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="citycode" SortExpression="citycode" HeaderText="City">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="country" SortExpression="country" HeaderText="Country">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="inshelflife" SortExpression="inshelflife" HeaderText="Shelf Life(In)">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="outshelflife" SortExpression="outshelflife" HeaderText="Shelf Life(Out)">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
            </Columns>
            <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
        </asp:DataGrid></div>
    </form>
</body>
</html>
